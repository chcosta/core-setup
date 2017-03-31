﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

using Microsoft.Build.Framework;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Xml;

namespace Microsoft.DotNet.Build.Tasks
{
    public sealed class DownloadBlobFromAzure : BuildTask
    {

        /// <summary>
        /// Azure Storage account connection string.  Supersedes Account Key / Name.  
        /// Will cause errors if both are set.
        /// </summary>
        public string ConnectionString { get; set; }

        /// <summary>
        /// The Azure account key used when creating the connection string.
        /// When we fully deprecate these, can just make them get; only.
        /// </summary>
        public string AccountKey { get; set; }

        /// <summary>
        /// The Azure account name used when creating the connection string.
        /// When we fully deprecate these, can just make them get; only.
        /// </summary>
        public string AccountName { get; set; }

        /// <summary>
        /// The name of the container to access.  The specified name must be in the correct format, see the
        /// following page for more info.  https://msdn.microsoft.com/en-us/library/azure/dd135715.aspx
        /// </summary>
        [Required]
        public string ContainerName { get; set; }

        [Required]
        public string BlobName { get; set; }

        /// <summary>
        /// Directory to download blob files to.
        /// </summary>
        [Required]
        public string DownloadDirectory { get; set; }

        public override bool Execute()
        {
            return ExecuteAsync().GetAwaiter().GetResult();
        }

        public async Task<bool> ExecuteAsync()
        {
            if (!string.IsNullOrEmpty(ConnectionString))
            {
                if (!(string.IsNullOrEmpty(AccountKey) && string.IsNullOrEmpty(AccountName)))
                {
                    Log.LogError("If the ConnectionString property is set, you must not provide AccountKey / AccountName.  These values will be deprecated in the future.");
                }
                else
                {
                    Tuple<string, string> parsedValues = AzureHelper.ParseConnectionString(ConnectionString);
                    if (parsedValues == null)
                    {
                        Log.LogError("Error parsing connection string.  Please review its value.");
                    }
                    else
                    {
                        AccountName = parsedValues.Item1;
                        AccountKey = parsedValues.Item2;
                    }
                }
            }
            else if (string.IsNullOrEmpty(AccountKey) || string.IsNullOrEmpty(AccountName))
            {
                Log.LogError("Error, must provide either ConnectionString or AccountName with AccountKey");
            }

            if (Log.HasLoggedErrors)
            {
                return false;
            }
            // If the connection string AND AccountKey & AccountName are provided, error out.
            if (Log.HasLoggedErrors)
            {
                return false;
            }

            Log.LogMessage(MessageImportance.Normal, "Downloading contents of container {0} from storage account '{1}' to directory {2}.",
                ContainerName, AccountName, DownloadDirectory);

            List<string> blobsNames = new List<string>();
            string urlListBlobs = $"https://{AccountName}.blob.core.windows.net/{ContainerName}/{BlobName}";

            Log.LogMessage(MessageImportance.Low, "Sending request to list blobsNames for container '{0}'.", ContainerName);

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    Func<HttpRequestMessage> createRequest = () =>
                    {
                        DateTime dateTime = DateTime.UtcNow;
                        var request = new HttpRequestMessage(HttpMethod.Get, urlListBlobs);
                        request.Headers.Add(AzureHelper.DateHeaderString, dateTime.ToString("R", CultureInfo.InvariantCulture));
                        request.Headers.Add(AzureHelper.VersionHeaderString, AzureHelper.StorageApiVersion);
                        request.Headers.Add(AzureHelper.AuthorizationHeaderString, AzureHelper.AuthorizationHeader(
                                AccountName,
                                AccountKey,
                                "GET",
                                dateTime,
                                request));
                        return request;
                    };

                    // track the number of blobs that fail to download
                    string blob = Path.GetFileName(BlobName);
                    string filename = Path.Combine(DownloadDirectory, blob);
                    using (HttpResponseMessage response = await AzureHelper.RequestWithRetry(Log, client, createRequest))
                    {
                        if (response.IsSuccessStatusCode)
                        {
                            // Blobs can be files but have the name of a directory.  We'll skip those and log something weird happened.
                            if (!string.IsNullOrEmpty(Path.GetFileName(filename)))
                            {
                                Stream responseStream = await response.Content.ReadAsStreamAsync();

                                using (FileStream sourceStream = File.Open(filename, FileMode.Create))
                                {
                                    responseStream.CopyTo(sourceStream);
                                }
                            }
                            else
                            {
                                Log.LogWarning($"Unable to download blob '{blob}' as it has a directory-like name.  This may cause problems if it was needed.");
                            }
                        }
                        else
                        {
                            Log.LogError("Failed to retrieve blob {0}, the status code was {1}", blob, response.StatusCode);
                        }
                    }
                }
                catch (Exception e)
                {
                    Log.LogErrorFromException(e, true);
                }
                return !Log.HasLoggedErrors;
            }
        }
    }
}