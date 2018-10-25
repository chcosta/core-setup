<!--
============================================================================================================================================
E:\gh\shawnro\core-setup\src\corehost\build.proj
============================================================================================================================================
-->
<Project DefaultTargets="Build">
  <!--
============================================================================================================================================
  <Import Project="Sdk.props" Sdk="Microsoft.NET.Sdk">
  This import was added implicitly because the Project element's Sdk attribute specified "Microsoft.NET.Sdk".

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Sdk.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <!--
      Indicate to other targets that Microsoft.NET.Sdk is being used.

      This must be set here (as early as possible, before Microsoft.Common.props)
      so that everything that follows can depend on it.

      In particular, Directory.Build.props and nuget package props need to be able
      to use this flag and they are imported by Microsoft.Common.props.
    -->
    <UsingMicrosoftNETSdk>true</UsingMicrosoftNETSdk>
  </PropertyGroup>
  <PropertyGroup Condition="'$(MSBuildProjectFullPath)' == '$(ProjectToOverrideProjectExtensionsPath)'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildProjectExtensionsPath>$(ProjectExtensionsPathForSpecifiedProject)</MSBuildProjectExtensionsPath>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.Common.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (C) Microsoft Corporation. All rights reserved.
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ImportByWildcardBeforeMicrosoftCommonProps Condition="'$(ImportByWildcardBeforeMicrosoftCommonProps)' == ''">true</ImportByWildcardBeforeMicrosoftCommonProps>
    <ImportByWildcardAfterMicrosoftCommonProps Condition="'$(ImportByWildcardAfterMicrosoftCommonProps)' == ''">true</ImportByWildcardAfterMicrosoftCommonProps>
    <ImportUserLocationsByWildcardBeforeMicrosoftCommonProps Condition="'$(ImportUserLocationsByWildcardBeforeMicrosoftCommonProps)' == ''">true</ImportUserLocationsByWildcardBeforeMicrosoftCommonProps>
    <ImportUserLocationsByWildcardAfterMicrosoftCommonProps Condition="'$(ImportUserLocationsByWildcardAfterMicrosoftCommonProps)' == ''">true</ImportUserLocationsByWildcardAfterMicrosoftCommonProps>
    <ImportDirectoryBuildProps Condition="'$(ImportDirectoryBuildProps)' == ''">true</ImportDirectoryBuildProps>
  </PropertyGroup>
  <!-- 
        Determine the path to the directory build props file if the user did not disable $(ImportDirectoryBuildProps) and
        they did not already specify an absolute path to use via $(DirectoryBuildPropsPath)
    -->
  <PropertyGroup Condition="'$(ImportDirectoryBuildProps)' == 'true' and '$(DirectoryBuildPropsPath)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_DirectoryBuildPropsFile Condition="'$(_DirectoryBuildPropsFile)' == ''">Directory.Build.props</_DirectoryBuildPropsFile>
    <_DirectoryBuildPropsBasePath Condition="'$(_DirectoryBuildPropsBasePath)' == ''">$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildProjectDirectory), '$(_DirectoryBuildPropsFile)'))</_DirectoryBuildPropsBasePath>
    <DirectoryBuildPropsPath Condition="'$(_DirectoryBuildPropsBasePath)' != '' and '$(_DirectoryBuildPropsFile)' != ''">$([System.IO.Path]::Combine('$(_DirectoryBuildPropsBasePath)', '$(_DirectoryBuildPropsFile)'))</DirectoryBuildPropsPath>
  </PropertyGroup>
  <PropertyGroup Condition="'$(ImportDirectoryBuildProps)' == 'true' and exists('$(DirectoryBuildPropsPath)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(DirectoryBuildPropsPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(DirectoryBuildPropsPath)" Condition="'$(ImportDirectoryBuildProps)' == 'true' and exists('$(DirectoryBuildPropsPath)')">

E:\gh\shawnro\core-setup\Directory.Build.props
============================================================================================================================================
-->
  <PropertyGroup>
    <ImportNetSdkFromRepoToolset>false</ImportNetSdkFromRepoToolset>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="Sdk.props" Sdk="Microsoft.DotNet.Arcade.Sdk">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\Sdk\Sdk.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildThisFileFullPath);$(MSBuildAllProjects)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup>
    <!-- 
      When the bootstrapper script initializes a repo it restores an empty project that imports the toolset SDK.
      It invokes WriteToolsetLocation target with __ToolsetLocationOutputFile set to the path where the location of 
      SDK Build.proj entry point is to be stored. Suppress all other imports for that project.      
    -->
    <_SuppressSdkImports>false</_SuppressSdkImports>
    <_SuppressSdkImports Condition="'$(__ToolsetLocationOutputFile)' != ''">true</_SuppressSdkImports>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="..\tools\Settings.props" Condition="!$(_SuppressSdkImports)">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <ImportNetSdkFromRepoToolset Condition="'$(ImportNetSdkFromRepoToolset)' == ''">true</ImportNetSdkFromRepoToolset>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="BuildTasks.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\BuildTasks.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup>
    <ArcadeSdkBuildTasksAssembly Condition="'$(MSBuildRuntimeType)' != 'Core'">$(MSBuildThisFileDirectory)net461\Microsoft.DotNet.Arcade.Sdk.dll</ArcadeSdkBuildTasksAssembly>
    <ArcadeSdkBuildTasksAssembly Condition="'$(MSBuildRuntimeType)' == 'Core'">$(MSBuildThisFileDirectory)netcoreapp2.0\Microsoft.DotNet.Arcade.Sdk.dll</ArcadeSdkBuildTasksAssembly>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="ProjectLayout.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\ProjectLayout.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <!--
     Properties describing the layout of the repo specific to the current project.
  -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="RepoLayout.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\RepoLayout.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <!--
     Properties describing the layout of the repo.
  -->
  <!-- 
    Repositories are required to follow the following conventions:
      
    - global.json file in the repository root
      This file specifies the version of Arcade SDK like so:
      "msbuild-sdks": { "Microsoft.DotNet.Arcade.Sdk": "version" }
      
    - build/Versions.props 
      Specifies versions of dependencies
  -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup>
    <Configuration Condition="'$(Configuration)' == ''">Debug</Configuration>
    <Platform Condition="'$(Platform)' == ''">AnyCPU</Platform>
    <PlatformName Condition="'$(PlatformName)' == ''">$(Platform)</PlatformName>
  </PropertyGroup>
  <PropertyGroup>
    <!-- Respect environment variable for the NuGet Packages Root if set; otherwise, use the current default location -->
    <NuGetPackageRoot Condition="'$(NuGetPackageRoot)' == ''">$(NUGET_PACKAGES)</NuGetPackageRoot>
    <NuGetPackageRoot Condition="'$(NuGetPackageRoot)' == '' AND '$(OS)' == 'Windows_NT'">$(UserProfile)\.nuget\packages\</NuGetPackageRoot>
    <NuGetPackageRoot Condition="'$(NuGetPackageRoot)' == '' AND '$(OS)' != 'Windows_NT'">$([System.Environment]::GetFolderPath(SpecialFolder.Personal))\.nuget\packages\</NuGetPackageRoot>
    <NuGetPackageRoot Condition="!HasTrailingSlash('$(NuGetPackageRoot)')">$(NuGetPackageRoot)\</NuGetPackageRoot>
  </PropertyGroup>
  <PropertyGroup>
    <RepoRoot Condition="'$(RepoRoot)' == ''">$([MSBuild]::GetDirectoryNameOfFileAbove($(MSBuildProjectDirectory), 'global.json'))\</RepoRoot>
  </PropertyGroup>
  <PropertyGroup>
    <!-- TODO: remove condition once all repos update their dir structure (https://github.com/dotnet/roslyn-tools/issues/177) -->
    <RepositoryEngineeringDir Condition="Exists('$(RepoRoot)eng')">$(RepoRoot)eng\</RepositoryEngineeringDir>
    <RepositoryEngineeringDir Condition="'$(RepositoryEngineeringDir)' == ''">$(RepoRoot)build\</RepositoryEngineeringDir>
    <VersionsPropsPath>$(RepositoryEngineeringDir)Versions.props</VersionsPropsPath>
    <ArtifactsDir Condition="'$(ArtifactsDir)' == ''">$(RepoRoot)artifacts\</ArtifactsDir>
    <ArtifactsToolsetDir>$(ArtifactsDir)toolset\</ArtifactsToolsetDir>
    <ArtifactsObjDir>$(ArtifactsDir)obj\</ArtifactsObjDir>
    <ArtifactsBinDir>$(ArtifactsDir)bin\</ArtifactsBinDir>
    <ArtifactsLogDir>$(ArtifactsDir)log\$(Configuration)\</ArtifactsLogDir>
    <ArtifactsTmpDir>$(ArtifactsDir)tmp\$(Configuration)\</ArtifactsTmpDir>
    <ArtifactsTestResultsDir>$(ArtifactsDir)TestResults\$(Configuration)\</ArtifactsTestResultsDir>
    <ArtifactsSymStoreDirectory>$(ArtifactsDir)SymStore\$(Configuration)\</ArtifactsSymStoreDirectory>
    <ArtifactsPackagesDir>$(ArtifactsDir)packages\$(Configuration)\</ArtifactsPackagesDir>
    <ArtifactsShippingPackagesDir>$(ArtifactsPackagesDir)Shipping\</ArtifactsShippingPackagesDir>
    <ArtifactsNonShippingPackagesDir>$(ArtifactsPackagesDir)NonShipping\</ArtifactsNonShippingPackagesDir>
    <VisualStudioSetupOutputPath>$(ArtifactsDir)VSSetup\$(Configuration)\</VisualStudioSetupOutputPath>
    <VisualStudioSetupInsertionPath>$(VisualStudioSetupOutputPath)Insertion\</VisualStudioSetupInsertionPath>
    <VisualStudioSetupIntermediateOutputPath>$(ArtifactsDir)VSSetup.obj\$(Configuration)\</VisualStudioSetupIntermediateOutputPath>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\ProjectLayout.props
============================================================================================================================================
-->
  <PropertyGroup>
    <OutDirName Condition="'$(OutDirName)' == ''">$(MSBuildProjectName)</OutDirName>
    <BaseOutputPath Condition="'$(BaseOutputPath)' == ''">$([System.IO.Path]::GetFullPath('$(ArtifactsBinDir)$(OutDirName)\'))</BaseOutputPath>
    <OutputPath Condition="'$(PlatformName)' == 'AnyCPU'">$(BaseOutputPath)$(Configuration)\</OutputPath>
    <OutputPath Condition="'$(PlatformName)' != 'AnyCPU'">$(BaseOutputPath)$(PlatformName)\$(Configuration)\</OutputPath>
    <BaseIntermediateOutputPath Condition="'$(BaseIntermediateOutputPath)' == ''">$([System.IO.Path]::GetFullPath('$(ArtifactsObjDir)$(OutDirName)\'))</BaseIntermediateOutputPath>
    <IntermediateOutputPath Condition="'$(PlatformName)' == 'AnyCPU'">$(BaseIntermediateOutputPath)$(Configuration)\</IntermediateOutputPath>
    <IntermediateOutputPath Condition="'$(PlatformName)' != 'AnyCPU'">$(BaseIntermediateOutputPath)$(PlatformName)\$(Configuration)\</IntermediateOutputPath>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="DefaultVersions.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\DefaultVersions.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <!--
    Sets versions of packages used by the toolset unless they were already specified by the repo.
    Version.props shall be imported prior this file.
  -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup>
    <OfficialBuild>false</OfficialBuild>
    <OfficialBuild Condition="'$(OfficialBuildId)' != ''">true</OfficialBuild>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(VersionsPropsPath)">

E:\gh\shawnro\core-setup\eng\Versions.props
============================================================================================================================================
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <VersionPrefix>1.0.0</VersionPrefix>
    <PreReleaseVersionLabel Condition="'$(PackageVersionStamp)' != ''">$(PackageVersionStamp)</PreReleaseVersionLabel>
    <PreReleaseVersionLabel Condition="'$(PreReleaseVersionLabel)' == ''">preview1</PreReleaseVersionLabel>
    <!-- Libs -->
    <FeedTasksPackage>Microsoft.DotNet.Build.Tasks.Feed</FeedTasksPackage>
    <FeedTasksPackageVersion>3.0.0-preview1-03322-02</FeedTasksPackageVersion>
    <!-- Copy/paste from old dir.props -->
    <!-- SHAWNR
    <StabilizePackageVersion Condition="'$(StabilizePackageVersion)' == ''">false</StabilizePackageVersion>

    <IncludePreReleaseLabelInPackageVersion Condition="'$(StabilizePackageVersion)' != 'true' or '$(PackageVersionStamp)' != ''">true</IncludePreReleaseLabelInPackageVersion>
    <IncludeBuildNumberInPackageVersion Condition="'$(StabilizePackageVersion)' != 'true'">true</IncludeBuildNumberInPackageVersion>

    <ReleaseSuffix>$(PreReleaseLabel)</ReleaseSuffix>
    <ReleaseBrandSuffix>Preview 1</ReleaseBrandSuffix>
    <Channel>master</Channel>
    <ContainerName>dotnet</ContainerName>
    <ChecksumContainerName>$(ContainerName)</ChecksumContainerName>
    <NETCoreAppMaximumVersion>$(MajorVersion).$(MinorVersion)</NETCoreAppMaximumVersion>
-->
    <!-- End copy/paste -->
    <!--
      This name is used to create a GIT repository URL https://github.com/dotnet/$(GitHubRepositoryName) used to find source code for debugging
      It is also used to name the build output manifest for orchestrated builds.
    -->
    <!-- SHAWNR
    <GitHubRepositoryName Condition="'$(GitHubRepositoryName)' == ''">core-setup</GitHubRepositoryName>
-->
    <!-- Opt-out repo features -->
    <!-- SHAWNR
    <UsingToolNetFrameworkReferenceAssemblies>true</UsingToolNetFrameworkReferenceAssemblies>
    <MicrosoftNetFrameworkReferenceAssembliesVersion>1.0.0-alpha-004</MicrosoftNetFrameworkReferenceAssembliesVersion>
-->
    <!-- Libs -->
    <!-- <NewtonsoftJsonVersion>9.0.1</NewtonsoftJsonVersion> -->
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\DefaultVersions.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="Version.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Version.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <!--
    Specification: https://github.com/dotnet/arcade/blob/master/Documentation/Versioning.md
    
    Properties:
      SemanticVersioningV1  "true" if the Version needs to respect SemVer 1.0. Default is false, which means format following SemVer 2.0.
      
    Global settings:
      DotNetUseShippingVersions   
        - "true" to produce shipping versions in non-official builds, instead of default fixed dummy version number (42.42.42.42).
        - A builds target that produces MSI shall fail if DotNetUseShippingVersions == false, since MSIs require increasing file versions to function properly.
  -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!-- 
    The project can specify version either directly using the .NET SDK recognized property VersionPrefix,
    or using MajorVersion and MinorVersion properties.
  -->
  <PropertyGroup>
    <VersionPrefix Condition="'$(VersionPrefix)' == '' and '$(MajorVersion)' != '' and '$(MinorVersion)' != ''">$(MajorVersion).$(MinorVersion).0</VersionPrefix>
  </PropertyGroup>
  <Choose>
    <When Condition="'$(OfficialBuild)' == 'true' or '$(DotNetUseShippingVersions)' == 'true'">
      <PropertyGroup>
        <!--
          Building MSIs from dev build requires file versions to be increasing. 
          Use the current date in non-official builds. Note that this reduces the deterministic properties of the build 
          and should only be enabled when it's necessary to test-install the MSIs produced by the build.
        -->
        <_BuildNumber>$(OfficialBuildId)</_BuildNumber>
        <_BuildNumber Condition="'$(OfficialBuildId)' == ''">$([System.DateTime]::Now.ToString(yyyyMMdd)).1</_BuildNumber>
        <!--
          Official build PackageVersion format: MAJOR.MINOR.PATCH-PRERELEASE.SHORTDATE.REVISION+SHORTSHA

          MAJOR.MINOR.PATCH is specified by the project in VersionPrefix property.
          PRERELEASE.SHORTDATE.REVISION is calculated here and stored in VersionSuffix property.
          SHORTSHA is appended when PackageVersion is calculated in a target.

          OfficialBuildId is assumed to have format "yyyyMMdd.r" (the assumption is checked later in a target).
          REVISION (VersionSuffixBuildOfTheDay) is set to r component of OfficialBuildId.
          SHORTDATE (VersionSuffixDateStamp) is set to yy * 1000 + mm * 50 + dd.
        -->
        <_BuildNumberYY>$(_BuildNumber.Substring($([System.Convert]::ToInt32(2)), $([System.Convert]::ToInt32(2))))</_BuildNumberYY>
        <_BuildNumberMM>$(_BuildNumber.Substring($([System.Convert]::ToInt32(4)), $([System.Convert]::ToInt32(2))))</_BuildNumberMM>
        <_BuildNumberDD>$(_BuildNumber.Substring($([System.Convert]::ToInt32(6)), $([System.Convert]::ToInt32(2))))</_BuildNumberDD>
        <_BuildNumberR>$(_BuildNumber.Substring($([System.Convert]::ToInt32(9))))</_BuildNumberR>
        <!-- yy * 1000 + mm * 50 + dd -->
        <VersionSuffixDateStamp>$([MSBuild]::Add($([MSBuild]::Add($([MSBuild]::Multiply($([System.Convert]::ToInt32($(_BuildNumberYY))), $([System.Convert]::ToInt32(1000)))), $([MSBuild]::Multiply($([System.Convert]::ToInt32($(_BuildNumberMM))), $([System.Convert]::ToInt32(50)))))), $([System.Convert]::ToInt32($(_BuildNumberDD)))))</VersionSuffixDateStamp>
        <VersionSuffixBuildOfTheDay>$([System.Convert]::ToInt32($(_BuildNumberR)))</VersionSuffixBuildOfTheDay>
        <VersionSuffixBuildOfTheDayPadded>$(VersionSuffixBuildOfTheDay.PadLeft($([System.Convert]::ToInt32(2)), $([System.Convert]::ToChar(`0`))))</VersionSuffixBuildOfTheDayPadded>
        <_BuildNumberSuffix Condition="'$(SemanticVersioningV1)' != 'true'">.$(VersionSuffixDateStamp).$(VersionSuffixBuildOfTheDay)</_BuildNumberSuffix>
        <_BuildNumberSuffix Condition="'$(SemanticVersioningV1)' == 'true'">-$(VersionSuffixDateStamp)-$(VersionSuffixBuildOfTheDayPadded)</_BuildNumberSuffix>
      </PropertyGroup>
    </When>
    <Otherwise>
      <PropertyGroup>
        <VersionSuffixDateStamp />
        <VersionSuffixBuildOfTheDay />
        <VersionSuffixBuildOfTheDayPadded />
        <_BuildNumberSuffix />
        <!--
          Don't include a commit SHA to AssemblyInformationalVersion. 
          It would reduce the possibility of sharing otherwise unchanged build artifacts across deterministic builds.
        -->
        <IncludeSourceRevisionInInformationalVersion>false</IncludeSourceRevisionInInformationalVersion>
      </PropertyGroup>
    </Otherwise>
  </Choose>
  <PropertyGroup>
    <_PreReleaseLabel>$(PreReleaseVersionLabel)</_PreReleaseLabel>
    <_PreReleaseLabel Condition="'$(ContinuousIntegrationBuild)' == 'true' and '$(OfficialBuild)' != 'true'">ci</_PreReleaseLabel>
    <_PreReleaseLabel Condition="'$(ContinuousIntegrationBuild)' != 'true'">dev</_PreReleaseLabel>
    <!--
      If DotNetFinalVersionKind is specified, overrides the package version produced by the build like so:
        ""           1.2.3-beta.12345.67+sha
        "prerelease" 1.2.3-beta+sha
        "release"    1.2.3
    -->
    <VersionSuffix Condition="'$(DotNetFinalVersionKind)' == 'release'" />
    <VersionSuffix Condition="'$(DotNetFinalVersionKind)' == 'prerelease' and '$(SemanticVersioningV1)' != 'true'">$(_PreReleaseLabel).final</VersionSuffix>
    <VersionSuffix Condition="'$(DotNetFinalVersionKind)' == 'prerelease' and '$(SemanticVersioningV1)' == 'true'">$(_PreReleaseLabel)-final</VersionSuffix>
    <VersionSuffix Condition="'$(DotNetFinalVersionKind)' == ''">$(_PreReleaseLabel)$(_BuildNumberSuffix)</VersionSuffix>
    <!-- 
      Disable NuGet Pack warning that the version is SemVer 2.0.
      SemVer 2.0 is supported by NuGet since 3.0.0 (July 2015) in some capacity, and fully since 3.5.0 (October 2016).
    -->
    <NoWarn Condition="'$(SemanticVersioningV1)' != 'true'">$(NoWarn);NU5105</NoWarn>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\DefaultVersions.props
============================================================================================================================================
-->
  <PropertyGroup>
    <!-- 
      Configure NuGet Restore to only use NuGet.config file in the repository root.
      This makes sure we do not depend on any NuGet.config files located outside of the repository.
      
      Note: This setting only applies to command-line build, not design time builds done from Visual Studio.
      Visual Studio restore might still use other NuGet.config files.
    -->
    <RestoreConfigFile>$(RepoRoot)NuGet.config</RestoreConfigFile>
    <!-- Opt-out features -->
    <UsingToolXliff Condition="'$(UsingToolXliff)' == ''">true</UsingToolXliff>
    <UsingToolXUnit Condition="'$(UsingToolXUnit)' == ''">true</UsingToolXUnit>
    <UsingToolPdbConverter Condition="'$(UsingToolPdbConverter)' == ''">true</UsingToolPdbConverter>
    <!--
      Always use compilers from the package on CI build, to get consistent results.
      Locally we want to dogfood the compilers that come with the dotnet SDK or msbuild used to build the repo.
      The local compilers are also precompiled and thus faster.
      Repo can set this property to true for local builds if it needs to use newer compiler than the one in the dotnet SDK.
    -->
    <UsingToolMicrosoftNetCompilers Condition="'$(ContinuousIntegrationBuild)' == 'true'">true</UsingToolMicrosoftNetCompilers>
    <!-- Opt-in features -->
    <UsingToolVSSDK Condition="'$(UsingToolVSSDK)' == ''">false</UsingToolVSSDK>
    <UsingToolIbcOptimization Condition="'$(UsingToolIbcOptimization)' == ''">false</UsingToolIbcOptimization>
    <UsingToolNetFrameworkReferenceAssemblies Condition="'$(UsingToolNetFrameworkReferenceAssemblies)' == ''">false</UsingToolNetFrameworkReferenceAssemblies>
    <UsingToolNuGetRepack Condition="'$(UsingToolNuGetRepack)' == ''">false</UsingToolNuGetRepack>
    <UsingToolSymbolUploader Condition="'$(UsingToolSymbolUploader)' == ''">false</UsingToolSymbolUploader>
    <!-- Default versions -->
    <MicroBuildPluginsSwixBuildVersion Condition="'$(MicroBuildPluginsSwixBuildVersion)' == ''">1.0.422</MicroBuildPluginsSwixBuildVersion>
    <MicroBuildCoreVersion Condition="'$(MicroBuildCoreVersion)' == ''">0.2.0</MicroBuildCoreVersion>
    <MicrosoftDotNetIBCMergeVersion Condition="'$(MicrosoftDotNetIBCMergeVersion)' == ''">4.7.1-alpha-00001</MicrosoftDotNetIBCMergeVersion>
    <MicrosoftNetCompilersVersion Condition="'$(MicrosoftNetCompilersVersion)' == ''">2.8.0</MicrosoftNetCompilersVersion>
    <MicrosoftNETCoreCompilersVersion Condition="'$(MicrosoftNETCoreCompilersVersion)' == ''">$(MicrosoftNetCompilersVersion)</MicrosoftNETCoreCompilersVersion>
    <!-- Using a private build of Microsoft.Net.Test.SDK to work around issue https://github.com/Microsoft/vstest/issues/373 -->
    <MicrosoftNETTestSdkVersion Condition="'$(MicrosoftNETTestSdkVersion)' == ''">15.6.0-dev</MicrosoftNETTestSdkVersion>
    <MicrosoftNetFrameworkReferenceAssembliesVersion Condition="'$(MicrosoftNetFrameworkReferenceAssembliesVersion)' == ''">1.0.0-alpha-004</MicrosoftNetFrameworkReferenceAssembliesVersion>
    <MicrosoftVSSDKBuildToolsVersion Condition="'$(MicrosoftVSSDKBuildToolsVersion)' == ''">15.1.192</MicrosoftVSSDKBuildToolsVersion>
    <MicrosoftDiaSymReaderPdb2PdbVersion Condition="'$(MicrosoftDiaSymReaderPdb2PdbVersion)' == ''">1.1.0-beta1-62506-02</MicrosoftDiaSymReaderPdb2PdbVersion>
    <RoslynToolsModifyVsixManifestVersion Condition="'$(RoslynToolsModifyVsixManifestVersion)' == ''">1.0.0-beta2-63208-02</RoslynToolsModifyVsixManifestVersion>
    <RoslynToolsNuGetRepackVersion Condition="'$(RoslynToolsNuGetRepackVersion)' == ''">1.0.0-beta2-63223-01</RoslynToolsNuGetRepackVersion>
    <MicrosoftDotNetSignToolVersion Condition="'$(MicrosoftDotNetSignToolVersion)' == ''">1.0.0-beta.18511.3</MicrosoftDotNetSignToolVersion>
    <XliffTasksVersion Condition="'$(XliffTasksVersion)' == ''">0.2.0-beta-63004-01</XliffTasksVersion>
    <XUnitVersion Condition="'$(XUnitVersion)' == ''">2.4.1-pre.build.4059</XUnitVersion>
    <XUnitRunnerConsoleVersion Condition="'$(XUnitRunnerConsoleVersion)' == ''">$(XUnitVersion)</XUnitRunnerConsoleVersion>
    <XUnitRunnerVisualStudioVersion Condition="'$(XUnitRunnerVisualStudioVersion)' == ''">$(XUnitVersion)</XUnitRunnerVisualStudioVersion>
    <MicrosoftDotNetBuildTasksFeedVersion Condition="'$(MicrosoftDotNetBuildTasksFeedVersion)' == ''">2.2.0-beta.18475.5</MicrosoftDotNetBuildTasksFeedVersion>
    <MicrosoftSourceLinkVersion Condition="'$(MicrosoftSourceLinkVersion)' == ''">1.0.0-beta-63201-01</MicrosoftSourceLinkVersion>
    <MicrosoftSymbolUploaderBuildTaskVersion Condition="'$(MicrosoftSymbolUploaderBuildTaskVersion)' == ''">1.0.0-beta-63008-01</MicrosoftSymbolUploaderBuildTaskVersion>
    <VSWhereVersion Condition="'$(VSWhereVersion)' == ''">2.5.2</VSWhereVersion>
    <MicrosoftDotNetMaestroTasksVersion Condition="'$(MicrosoftDotNetMaestroTasksVersion)' == ''">1.0.0-beta.18478.2</MicrosoftDotNetMaestroTasksVersion>
  </PropertyGroup>
  <!-- RestoreSources overrides - defines DotNetRestoreSources variable if available -->
  <!--<Import Project="$(DotNetRestoreSourcePropsPath)" Condition="'$(DotNetRestoreSourcePropsPath)' != ''" />-->
  <!-- Force sources to DotNetRestoreSources if building offline, discard any sources set by the repo -->
  <PropertyGroup Condition="'$(DotNetBuildOffline)' == 'true'">
    <RestoreSources>$(DotNetRestoreSources)</RestoreSources>
  </PropertyGroup>
  <PropertyGroup Condition="'$(DotNetBuildOffline)' != 'true'">
    <RestoreSources>$(RestoreSources);https://api.nuget.org/v3/index.json</RestoreSources>
    <RestoreSources Condition="'$(UsingToolXliff)' == 'true' and $(XliffTasksVersion.Contains('-'))">$(RestoreSources);https://dotnet.myget.org/F/dotnet-core/api/v3/index.json</RestoreSources>
    <RestoreSources Condition="'$(UsingToolMicrosoftNetCompilers)' == 'true' and $(MicrosoftNetCompilersVersion.Contains('-'))">$(RestoreSources);https://dotnet.myget.org/F/roslyn/api/v3/index.json</RestoreSources>
    <RestoreSources Condition="'$(UsingToolNetFrameworkReferenceAssemblies)' == 'true'">$(RestoreSources);https://dotnet.myget.org/F/roslyn-tools/api/v3/index.json</RestoreSources>
    <RestoreSources Condition="$(XUnitVersion.Contains('-')) or $(XUnitRunnerVisualStudioVersion.Contains('-')) or $(XUnitRunnerVisualStudioVersion.Contains('-'))">$(RestoreSources);https://www.myget.org/F/xunit/api/v3/index.json</RestoreSources>
    <RestoreSources Condition="$(MicrosoftSourceLinkVersion.Contains('-'))">$(RestoreSources);https://dotnet.myget.org/F/sourcelink/api/v3/index.json</RestoreSources>
    <!-- Using a private build of Microsoft.Net.Test.SDK to work around issue https://github.com/Microsoft/vstest/issues/373 -->
    <RestoreSources Condition="'$(MicrosoftNETTestSdkVersion)' == '15.6.0-dev'">$(RestoreSources);https://dotnet.myget.org/F/roslyn-tools/api/v3/index.json</RestoreSources>
    <RestoreSources Condition="'$(DotNetRestoreSources)' != ''">$(DotNetRestoreSources);$(RestoreSources)</RestoreSources>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="StrongName.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\StrongName.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup>
    <MicrosoftSharedPublicKey>0024000004800000940000000602000000240000525341310004000001000100b5fc90e7027f67871e773a8fde8938c81dd402ba65b9201d60593e96c492651e889cc13f1415ebb53fac1131ae0bd333c5ee6021672d9718ea31a8aebd0da0072f25d87dba6fc90ffd598ed4da35e44c398c454307e8e33b8426143daec9f596836f97c8f74750e5975c64e2189f45def46b2a2b1247adc3652bf5c308055da9</MicrosoftSharedPublicKey>
    <MicrosoftPublicKey>002400000480000094000000060200000024000052534131000400000100010007d1fa57c4aed9f0a32e84aa0faefd0de9e8fd6aec8f87fb03766c834c99921eb23be79ad9d5dcc1dd9ad236132102900b723cf980957fc4e177108fc607774f29e8320e92ea05ece4e821c0a5efe8f1645c4c0c93c1ab99285d622caa652c1dfad63d745d6f2de5f17e5eaf0fc4963d261c8a12436518206dc093344d5ad293</MicrosoftPublicKey>
    <MicrosoftAspNetPublicKey>0024000004800000940000000602000000240000525341310004000001000100f33a29044fa9d740c9b3213a93e57c84b472c84e0b8a0e1ae48e67a9f8f6de9d5f7f3d52ac23e48ac51801f1dc950abe901da34d2a9e3baadb141a17c77ef3c565dd5ee5054b91cf63bb3c6ab83f72ab3aafe93d0fc3c2348b764fafb0b1c0733de51459aeab46580384bf9d74c4e28164b7cde247f891ba07891c9d872ad2bb</MicrosoftAspNetPublicKey>
    <ECMAPublicKey>00000000000000000400000000000000</ECMAPublicKey>
    <OpenPublicKey>00240000048000009400000006020000002400005253413100040000010001004b86c4cb78549b34bab61a3b1800e23bfeb5b3ec390074041536a7e3cbd97f5f04cf0f857155a8928eaa29ebfd11cfbbad3ba70efea7bda3226c6a8d370a4cd303f714486b6ebc225985a638471e6ef571cc92a4613c00b8fa65d61ccee0cbe5f36330c9a01f4183559f1bef24cc2917c6d913e3a541333a1d05d9bed22b38cb</OpenPublicKey>
    <SilverlightPlatformPublicKey>00240000048000009400000006020000002400005253413100040000010001008d56c76f9e8649383049f383c44be0ec204181822a6c31cf5eb7ef486944d032188ea1d3920763712ccb12d75fb77e9811149e6148e5d32fbaab37611c1878ddc19e20ef135d0cb2cff2bfec3d115810c3d9069638fe4be215dbf795861920e5ab6f7db2e2ceef136ac23d5dd2bf031700aec232f6c6b1c785b4305c123b37ab</SilverlightPlatformPublicKey>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="ProjectDefaults.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\ProjectDefaults.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup>
    <SignAssembly>true</SignAssembly>
    <StrongNameKeyId>MicrosoftShared</StrongNameKeyId>
    <ChecksumAlgorithm>SHA256</ChecksumAlgorithm>
    <HighEntropyVA>true</HighEntropyVA>
    <NeutralLanguage>en-US</NeutralLanguage>
    <Company>Microsoft Corporation</Company>
    <Copyright>© Microsoft Corporation. All rights reserved.</Copyright>
    <Authors>Microsoft</Authors>
    <Serviceable>true</Serviceable>
    <DevelopmentDependency>false</DevelopmentDependency>
    <PackageRequireLicenseAcceptance>true</PackageRequireLicenseAcceptance>
    <PackageLicenseUrl>http://go.microsoft.com/fwlink/?LinkId=529443</PackageLicenseUrl>
    <PublishRepositoryUrl>true</PublishRepositoryUrl>
    <!-- Disable the message indicating we are using a preview SDK. That is understood and by design -->
    <SuppressNETCoreSdkPreviewMessage>true</SuppressNETCoreSdkPreviewMessage>
    <!-- By default do not build NuGet package for a project. Project may override. -->
    <IsPackable>false</IsPackable>
    <!--
      Official build:
       - Build standalone Portable PDBs to reduce the size of the binaries.
       - Convert Portable PDBs to Windows PDBs and publish the converted PDBs to Symbol Store to allow WinDBG, 
         Watson and other tools to find symbol format they understand.

      Jenkins build:
       - Embed PDBs to make it easier to debug Jenkins crash dumps.

      Developer build:
       - Embed PDBs to be consistent with Jenkins builds.    
    -->
    <DebugType>portable</DebugType>
    <DebugType Condition="'$(OfficialBuild)' != 'true'">embedded</DebugType>
    <!-- 
      This controls the places MSBuild will consult to resolve assembly references.  This is 
      kept as minimal as possible to make our build reliable from machine to machine.  Global
      locations such as GAC, AssemblyFoldersEx, etc ... are deliberately removed from this 
      list as they will not be the same from machine to machine.
    -->
    <AssemblySearchPaths>
      {HintPathFromItem};
      {TargetFrameworkDirectory};
      {RawFileName};
    </AssemblySearchPaths>
  </PropertyGroup>
  <PropertyGroup>
    <Language Condition="'$(MSBuildProjectExtension)' == '.csproj'">C#</Language>
    <Language Condition="'$(MSBuildProjectExtension)' == '.vbproj'">VB</Language>
    <Language Condition="'$(MSBuildProjectExtension)' == '.fsproj'">F#</Language>
    <Language Condition="'$(MSBuildProjectExtension)' == '.vcxproj'">C++</Language>
  </PropertyGroup>
  <!--
    When building WPF / VSIX projects MSBuild will create a temporary project with an extension of
    tmp_proj.  In that case the SDK is unable to determine the target language and cannot pick
    the correct import. Need to set it explicitly here.
    See https://github.com/dotnet/project-system/issues/1467
  -->
  <Choose>
    <When Condition="'$(MSBuildProjectExtension)' != '.csproj' and '$(MSBuildProjectExtension)' != '.vbproj' and '$(MSBuildProjectExtension)' != '.shproj'">
      <Choose>
        <When Condition="'$(Language)' == 'C#' or Exists('$(MSBuildProjectDirectory)\$(AssemblyName).csproj')">
          <PropertyGroup>
            <Language>C#</Language>
            <LanguageTargets>$(MSBuildToolsPath)\Microsoft.CSharp.targets</LanguageTargets>
          </PropertyGroup>
        </When>
        <When Condition="'$(Language)' == 'VB' or Exists('$(MSBuildProjectDirectory)\$(AssemblyName).vbproj')">
          <PropertyGroup>
            <Language>VB</Language>
            <LanguageTargets>$(MSBuildToolsPath)\Microsoft.VisualBasic.targets</LanguageTargets>
          </PropertyGroup>
        </When>
      </Choose>
    </When>
  </Choose>
  <Choose>
    <!-- C# specific settings -->
    <When Condition="'$(Language)' == 'C#'">
      <PropertyGroup>
        <CheckForOverflowUnderflow>true</CheckForOverflowUnderflow>
        <NoWarn>$(NoWarn);1701;1702;1705;1591</NoWarn>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)' == 'Debug'">
        <DebugSymbols>true</DebugSymbols>
        <DefineConstants>DEBUG;TRACE</DefineConstants>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)' == 'Release'">
        <DefineConstants>TRACE</DefineConstants>
        <Optimize>true</Optimize>
      </PropertyGroup>
    </When>
    <!-- VB specific settings -->
    <When Condition="'$(Language)' == 'VB'">
      <PropertyGroup>
        <MyType>Empty</MyType>
        <OptionCompare>Binary</OptionCompare>
        <OptionExplicit>On</OptionExplicit>
        <OptionInfer>On</OptionInfer>
        <OptionStrict>On</OptionStrict>
        <VBRuntime>Embed</VBRuntime>
        <RemoveIntegerChecks>true</RemoveIntegerChecks>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)' == 'Debug'">
        <DebugSymbols>true</DebugSymbols>
        <DefineDebug>true</DefineDebug>
        <DefineTrace>true</DefineTrace>
      </PropertyGroup>
      <PropertyGroup Condition="'$(Configuration)' == 'Release'">
        <DefineTrace>true</DefineTrace>
        <Optimize>true</Optimize>
      </PropertyGroup>
    </When>
    <!-- F# specific settings -->
    <When Condition="'$(Language)' == 'F#'">
      <PropertyGroup>
        <!-- F# compiler doesn't support PathMap (see https://github.com/Microsoft/visualfsharp/issues/3812) -->
        <DeterministicSourcePaths>false</DeterministicSourcePaths>
      </PropertyGroup>
    </When>
  </Choose>
  <!-- 
    Implements proposal https://github.com/dotnet/designs/pull/33.
  -->
  <ItemGroup Condition="'$(UsingToolNetFrameworkReferenceAssemblies)' == 'true'">
    <PackageReference Include="Microsoft.NETFramework.ReferenceAssemblies" Version="$(MicrosoftNetFrameworkReferenceAssembliesVersion)" PrivateAssets="all" IsImplicitlyDefined="true" />
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="Tests.props">

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Tests.props
============================================================================================================================================
-->
  <!-- All Rights Reserved. Licensed to the .NET Foundation under one or more agreements. The .NET Foundation licenses this file to you under the MIT license. See the LICENSE file in the project root for more information. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup Condition="'$(IsPerformanceTestProject)' == ''">
    <IsPerformanceTestProject>false</IsPerformanceTestProject>
    <IsPerformanceTestProject Condition="$(MSBuildProjectName.EndsWith('.PerformanceTests'))">true</IsPerformanceTestProject>
  </PropertyGroup>
  <PropertyGroup Condition="'$(IsIntegrationTestProject)' == ''">
    <IsIntegrationTestProject>false</IsIntegrationTestProject>
    <IsIntegrationTestProject Condition="$(MSBuildProjectName.EndsWith('.IntegrationTests'))">true</IsIntegrationTestProject>
  </PropertyGroup>
  <PropertyGroup Condition="'$(IsUnitTestProject)' == ''">
    <IsUnitTestProject>false</IsUnitTestProject>
    <IsUnitTestProject Condition="$(MSBuildProjectName.EndsWith('.UnitTests')) or $(MSBuildProjectName.EndsWith('.Tests'))">true</IsUnitTestProject>
  </PropertyGroup>
  <PropertyGroup>
    <IsTestProject>false</IsTestProject>
    <IsTestProject Condition="'$(IsUnitTestProject)' == 'true' or '$(IsIntegrationTestProject)' == 'true' or '$(IsPerformanceTestProject)' == 'true'">true</IsTestProject>
    <!-- Disable building Integration Test projects in LUT. -->
    <BuildForLiveUnitTesting Condition="'$(BuildForLiveUnitTesting)' == '' and '$(IsIntegrationTestProject)' == 'true'">false</BuildForLiveUnitTesting>
  </PropertyGroup>
  <ItemGroup Condition="'$(IsTestProject)' == 'true'">
    <!-- VS TestExplorer uses this to identify a test project -->
    <Service Include="{82a7f48d-3b50-4b1e-b82e-3ada8210c358}" />
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="$(MicrosoftNETTestSdkVersion)" IsImplicitlyDefined="true" />
  </ItemGroup>
  <PropertyGroup Condition="'$(IsTestProject)' == 'true'">
    <!-- Treat test assemblies as non-shipping (do not publish or sign them). -->
    <IsShipping Condition="'$(IsShipping)' == ''">false</IsShipping>
    <!-- Default test runner -->
    <TestRunnerName Condition="'$(UsingToolXUnit)' == 'true'">XUnit</TestRunnerName>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\tools\Settings.props
============================================================================================================================================
-->
  <!--<Import Project="Compiler.props" Condition="'$(UsingToolMicrosoftNetCompilers)' == 'true'" />-->
  <!--<Import Project="VisualStudio.props" Condition="'$(UsingToolVSSDK)' == 'true'" />-->
  <!-- Directory.Build.props are imported next by .NET SDK (via Common.targets) -->
  <!--<Import Project="Sdk.props" Sdk="Microsoft.NET.Sdk" Condition="'$(ImportNetSdkFromRepoToolset)' == 'true'" />-->
  <!--
============================================================================================================================================
  </Import>

C:\Users\chcosta\.nuget\packages\microsoft.dotnet.arcade.sdk\1.0.0-beta.18524.2\Sdk\Sdk.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\Directory.Build.props
============================================================================================================================================
-->
  <!--  
  <PropertyGroup>
    <MajorVersion>3</MajorVersion>
    <MinorVersion>0</MinorVersion>
    <PatchVersion>0</PatchVersion>
  </PropertyGroup>
-->
  <!--
    $(OS) is set to Unix/Windows_NT. This comes from an environment variable on Windows and MSBuild on Unix.
  -->
  <PropertyGroup>
    <!-- Temp change to make OS X build behave as a Linux build -->
    <OsEnvironment Condition="'$(OsEnvironment)'=='' AND '$(OS)'=='OSX'">Unix</OsEnvironment>
    <OsEnvironment Condition="'$(OsEnvironment)'==''">$(OS)</OsEnvironment>
  </PropertyGroup>
  <PropertyGroup>
    <OSGroup Condition="'$(OSGroup)' == ''">$(OsEnvironment)</OSGroup>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.props
============================================================================================================================================
-->
  <!-- 
        Prepare to import project extensions which usually come from packages.  Package management systems will create a file at:
          $(MSBuildProjectExtensionsPath)\$(MSBuildProjectFile).<SomethingUnique>.props
          
        Each package management system should use a unique moniker to avoid collisions.  It is a wild-card import so the package
        management system can write out multiple files but the order of the import is alphabetic because MSBuild sorts the list.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
            The declaration of $(BaseIntermediateOutputPath) had to be moved up from Microsoft.Common.CurrentVersion.targets
            in order for the $(MSBuildProjectExtensionsPath) to use it as a default.
        -->
    <BaseIntermediateOutputPath Condition="'$(BaseIntermediateOutputPath)'=='' ">obj\</BaseIntermediateOutputPath>
    <BaseIntermediateOutputPath Condition="!HasTrailingSlash('$(BaseIntermediateOutputPath)')">$(BaseIntermediateOutputPath)\</BaseIntermediateOutputPath>
    <_InitialBaseIntermediateOutputPath>$(BaseIntermediateOutputPath)</_InitialBaseIntermediateOutputPath>
    <MSBuildProjectExtensionsPath Condition="'$(MSBuildProjectExtensionsPath)' == '' ">$(BaseIntermediateOutputPath)</MSBuildProjectExtensionsPath>
    <!--
        Import paths that are relative default to be relative to the importing file.  However, since MSBuildExtensionsPath
        defaults to BaseIntermediateOutputPath we expect it to be relative to the project directory.  So if the path is relative
        it needs to be made absolute based on the project directory.
      -->
    <MSBuildProjectExtensionsPath Condition="'$([System.IO.Path]::IsPathRooted($(MSBuildProjectExtensionsPath)))' == 'false'">$([System.IO.Path]::Combine('$(MSBuildProjectDirectory)', '$(MSBuildProjectExtensionsPath)'))</MSBuildProjectExtensionsPath>
    <MSBuildProjectExtensionsPath Condition="!HasTrailingSlash('$(MSBuildProjectExtensionsPath)')">$(MSBuildProjectExtensionsPath)\</MSBuildProjectExtensionsPath>
    <ImportProjectExtensionProps Condition="'$(ImportProjectExtensionProps)' == ''">true</ImportProjectExtensionProps>
    <_InitialMSBuildProjectExtensionsPath Condition=" '$(ImportProjectExtensionProps)' == 'true' ">$(MSBuildProjectExtensionsPath)</_InitialMSBuildProjectExtensionsPath>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildProjectExtensionsPath)$(MSBuildProjectFile).*.props" Condition="'$(ImportProjectExtensionProps)' == 'true' and exists('$(MSBuildProjectExtensionsPath)')">

E:\gh\shawnro\core-setup\artifacts\obj\build\build.proj.nuget.g.props
============================================================================================================================================
-->
  <PropertyGroup Condition=" '$(ExcludeRestorePackageImports)' != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RestoreSuccess Condition=" '$(RestoreSuccess)' == '' ">True</RestoreSuccess>
    <RestoreTool Condition=" '$(RestoreTool)' == '' ">NuGet</RestoreTool>
    <ProjectAssetsFile Condition=" '$(ProjectAssetsFile)' == '' ">E:\gh\shawnro\core-setup\artifacts\obj\build\project.assets.json</ProjectAssetsFile>
    <NuGetPackageRoot Condition=" '$(NuGetPackageRoot)' == '' ">$(UserProfile)\.nuget\packages\</NuGetPackageRoot>
    <NuGetPackageFolders Condition=" '$(NuGetPackageFolders)' == '' ">C:\Users\chcosta\.nuget\packages\;E:\gh\shawnro\core-setup\.dotnet\sdk\NuGetFallbackFolder</NuGetPackageFolders>
    <NuGetProjectStyle Condition=" '$(NuGetProjectStyle)' == '' ">PackageReference</NuGetProjectStyle>
    <NuGetToolVersion Condition=" '$(NuGetToolVersion)' == '' ">4.7.0</NuGetToolVersion>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!--<ImportGroup Condition=" '$(ExcludeRestorePackageImports)' != 'true' ">-->
  <!--
============================================================================================================================================
  <Import Project="$(NuGetPackageRoot)microsoft.netcore.app\2.1.0\build\netcoreapp2.1\Microsoft.NETCore.App.props" Condition="Exists('$(NuGetPackageRoot)microsoft.netcore.app\2.1.0\build\netcoreapp2.1\Microsoft.NETCore.App.props')">

C:\Users\chcosta\.nuget\packages\microsoft.netcore.app\2.1.0\build\netcoreapp2.1\Microsoft.NETCore.App.props
============================================================================================================================================
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageConflictPreferredPackages>Microsoft.NETCore.App;runtime.linux-x64.Microsoft.NETCore.App;runtime.linux-x64.Microsoft.NETCore.App;runtime.linux-musl-x64.Microsoft.NETCore.App;runtime.linux-musl-x64.Microsoft.NETCore.App;runtime.rhel.6-x64.Microsoft.NETCore.App;runtime.rhel.6-x64.Microsoft.NETCore.App;runtime.osx-x64.Microsoft.NETCore.App;runtime.osx-x64.Microsoft.NETCore.App;runtime.win-x86.Microsoft.NETCore.App;runtime.win-x86.Microsoft.NETCore.App;runtime.win-arm.Microsoft.NETCore.App;runtime.win-arm.Microsoft.NETCore.App;runtime.win-arm64.Microsoft.NETCore.App;runtime.win-arm64.Microsoft.NETCore.App;runtime.linux-arm.Microsoft.NETCore.App;runtime.linux-arm.Microsoft.NETCore.App;runtime.linux-arm64.Microsoft.NETCore.App;runtime.linux-arm64.Microsoft.NETCore.App;runtime.tizen.4.0.0-armel.Microsoft.NETCore.App;runtime.tizen.4.0.0-armel.Microsoft.NETCore.App;runtime.win-x64.Microsoft.NETCore.App;runtime.win-x64.Microsoft.NETCore.App</PackageConflictPreferredPackages>
    <_Microsoft_NETCore_App_Version>2.1.0</_Microsoft_NETCore_App_Version>
  </PropertyGroup>
  <ItemGroup Condition="'$(RuntimeIdentifier)' == '' or '$(SelfContained)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageConflictPlatformManifests Include="$(MSBuildThisFileDirectory)Microsoft.NETCore.App.PlatformManifest.txt" />
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\artifacts\obj\build\build.proj.nuget.g.props
============================================================================================================================================
-->
  <!--</ImportGroup>-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.props
============================================================================================================================================
-->
  <!-- 
        Import wildcard "ImportBefore" props files if we're actually in a 12.0+ project (rather than a project being
        treated as 4.0)
    -->
  <!--<ImportGroup Condition="'$(MSBuildAssemblyVersion)' != ''">-->
  <!-- 
            Wildcard imports come from $(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props.d folder.
            This is very similar to the same extension point used in Microsoft.Common.targets, which is located in
            the $(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ directory. Unfortunately, there
            is already a file named "Microsoft.Common.props" in this directory so we have to have a slightly different
            directory name to hold extensions.
        -->
  <!--<Import Project="$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportBefore\*" Condition="'$(ImportUserLocationsByWildcardBeforeMicrosoftCommonProps)' == 'true' and exists('$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportBefore')" />-->
  <!--<Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportBefore\*" Condition="'$(ImportByWildcardBeforeMicrosoftCommonProps)' == 'true' and exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportBefore')" />-->
  <!--</ImportGroup>-->
  <!-- 
        In VS 2010 SP1 and VS 2012, both supported for asset compatibility, the MSBuild installed 
        as part of them did not enforce using the local ToolsVersion (4.0) in all cases, but instead 
        just used whatever ToolsVersion was in the project file if it existed on the machine, and 
        only forced 4.0 if that ToolsVersion did not exist.  

        Moving forward, we do want to enforce a single acting ToolsVersion per version of Visual Studio, 
        but in order to approximate this behavior on VS 2010 SP1 and VS 2012 as well, we've redirected 
        the targets:  If we're building using 4.X MSBuild (which doesn't define the new reserved 
        property, MSBuildAssemblyVersion), we'll point right back at the 4.0 targets, which still exist 
        as part of the .NET Framework.  Only if we're using the new MSBuild will we point to the current
        targets. 
   -->
  <PropertyGroup Condition="'$(MSBuildAssemblyVersion)' == '' and ('$(VisualStudioVersion)' != '' and '$(VisualStudioVersion)' &gt;= '12.0')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
           Reset VisualStudioVersion if it's 12.0+: Should be 10.0 if VS 2010 is installed or 11.0 otherwise, 
           but since we don't have a good way of telling whether VS 2010 is installed, make it 11.0 if 
           VS 2012 is installed or 10.0 otherwise.  The reset should be safe because if it was already 
           set to something (e.g. 11.0 in a VS 2012 command prompt) then MSBuild's internal 
           VisualStudioVersion-defaulting code should never come into the picture, so the only way it could 
           be 12.0+ when building a TV 12.0 project (because we're in this file) using MSBuild 4.5 (because 
           MSBuildAssemblyVersion hasn't been set) is if it's a TV 12.0 project on an empty command prompt. 
      -->
    <VisualStudioVersion Condition="Exists('$(MSBuildExtensionsPath)\4.0\Microsoft.Common.props')">11.0</VisualStudioVersion>
    <VisualStudioVersion Condition="!Exists('$(MSBuildExtensionsPath)\4.0\Microsoft.Common.props')">10.0</VisualStudioVersion>
  </PropertyGroup>
  <!-- If building using 4.X MSBuild, we want to act like this project is TV 4.0, so override 
         the custom extensibility target locations with the hard-coded 4.0 equivalent. -->
  <PropertyGroup Condition="'$(MSBuildAssemblyVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CustomBeforeMicrosoftCommonProps Condition="'$(CustomBeforeMicrosoftCommonProps)'==''">$(MSBuildExtensionsPath)\v4.0\Custom.Before.$(MSBuildThisFile)</CustomBeforeMicrosoftCommonProps>
    <CustomAfterMicrosoftCommonProps Condition="'$(CustomAfterMicrosoftCommonProps)'==''">$(MSBuildExtensionsPath)\v4.0\Custom.After.$(MSBuildThisFile)</CustomAfterMicrosoftCommonProps>
  </PropertyGroup>
  <!-- If building using 4.X MSBuild, we want to act like this project is TV 4.0, so import
         Microsoft.Common.props from the 4.0 location, and make sure everything else in here is 
         set up such that if it's defaulted to something there, it won't be overridden here. -->
  <!--<Import Project="$(MSBuildExtensionsPath)\4.0\Microsoft.Common.props" Condition="'$(MSBuildAssemblyVersion)' == '' and Exists('$(MSBuildExtensionsPath)\4.0\Microsoft.Common.props')" />-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CustomBeforeMicrosoftCommonProps Condition="'$(CustomBeforeMicrosoftCommonProps)'==''">$(MSBuildExtensionsPath)\v$(MSBuildToolsVersion)\Custom.Before.$(MSBuildThisFile)</CustomBeforeMicrosoftCommonProps>
    <CustomAfterMicrosoftCommonProps Condition="'$(CustomAfterMicrosoftCommonProps)'==''">$(MSBuildExtensionsPath)\v$(MSBuildToolsVersion)\Custom.After.$(MSBuildThisFile)</CustomAfterMicrosoftCommonProps>
  </PropertyGroup>
  <!-- 
         Only import the extension targets if we're actually in a 12.0 project here (rather than one we're attempting 
         to treat as 4.0) OR if the Dev11 Microsoft.Common.props don't exist.  If it's a 12.0 project we're redirecting 
         to 4.0 and the Dev11 Microsoft.Common.props do exist, the extension targets will have been imported already 
         so there's no need to import them twice.
     -->
  <!--<Import Project="$(CustomBeforeMicrosoftCommonProps)" Condition="'$(CustomBeforeMicrosoftCommonProps)' != '' and Exists('$(CustomBeforeMicrosoftCommonProps)') and ('$(MSBuildAssemblyVersion)' != '' or !Exists('$(MSBuildExtensionsPath)\4.0\Microsoft.Common.props'))" />-->
  <!-- This is used to determine whether Microsoft.Common.targets needs to import 
         Microsoft.Common.props itself, or whether it has been imported previously,
         e.g. by the project itself. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MicrosoftCommonPropsHasBeenImported>true</MicrosoftCommonPropsHasBeenImported>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Configuration Condition=" '$(Configuration)' == '' and '$(DefaultProjectConfiguration)' != '' ">$(DefaultProjectConfiguration)</Configuration>
    <Platform Condition=" '$(Platform)' == '' and '$(DefaultProjectPlatform)' != '' ">$(DefaultProjectPlatform)</Platform>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WMSJSProject Condition="'$(WMSJSProject)' == ''">WJProject</WMSJSProject>
    <WMSJSProjectDirectory Condition="'$(WMSJSProjectDirectory)' == ''">JavaScript</WMSJSProjectDirectory>
  </PropertyGroup>
  <!--<Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.VisualStudioVersion.v*.Common.props" Condition="'$(VisualStudioVersion)' == ''" />-->
  <!-- 
         Only import the extension targets if we're actually in a 12.0 project here (rather than one we're attempting 
         to treat as 4.0) OR if the Dev11 Microsoft.Common.props don't exist.  If it's a 12.0 project we're redirecting 
         to 4.0 and the Dev11 Microsoft.Common.props do exist, the extension targets will have been imported already 
         so there's no need to import them twice.
     -->
  <!--<Import Project="$(CustomAfterMicrosoftCommonProps)" Condition="'$(CustomAfterMicrosoftCommonProps)' != '' and Exists('$(CustomAfterMicrosoftCommonProps)') and ('$(MSBuildAssemblyVersion)' != '' or !Exists('$(MSBuildExtensionsPath)\4.0\Microsoft.Common.props'))" />-->
  <!-- 
        Import wildcard "ImportAfter" props files if we're actually in a 12.0+ project (rather than a project being
        treated as 4.0)
    -->
  <!--<ImportGroup Condition="'$(MSBuildAssemblyVersion)' != ''">-->
  <!--<Import Project="$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportAfter\*" Condition="'$(ImportUserLocationsByWildcardAfterMicrosoftCommonProps)' == 'true' and exists('$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportAfter')" />-->
  <!--<Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportAfter\*" Condition="'$(ImportByWildcardAfterMicrosoftCommonProps)' == 'true' and exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Imports\Microsoft.Common.props\ImportAfter')" />-->
  <!--</ImportGroup>-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)..\targets\Microsoft.NET.Sdk.props">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Sdk.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <!-- This property disables the conflict resolution logic from the Microsoft.Packaging.Tools package, which is superceded by the logic here in the SDK -->
    <DisableHandlePackageFileConflicts>true</DisableHandlePackageFileConflicts>
  </PropertyGroup>
  <!-- Default configuration and platform to Debug|AnyCPU-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Configurations Condition=" '$(Configurations)' == '' ">Debug;Release</Configurations>
    <Platforms Condition=" '$(Platforms)' == '' ">AnyCPU</Platforms>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
  </PropertyGroup>
  <!-- User-facing configuration-agnostic defaults -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <OutputType Condition=" '$(OutputType)' == '' ">Library</OutputType>
    <FileAlignment Condition=" '$(FileAlignment)' == '' ">512</FileAlignment>
    <ErrorReport Condition=" '$(ErrorReport)' == '' ">prompt</ErrorReport>
    <AssemblyName Condition=" '$(AssemblyName)' == '' ">$(MSBuildProjectName)</AssemblyName>
    <RootNamespace Condition=" '$(RootNamespace)' == '' ">$(MSBuildProjectName)</RootNamespace>
    <Deterministic Condition=" '$(Deterministic)' == '' ">true</Deterministic>
  </PropertyGroup>
  <!-- User-facing configuration-specific defaults -->
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DebugSymbols Condition=" '$(DebugSymbols)' == '' ">true</DebugSymbols>
    <Optimize Condition=" '$(Optimize)' == '' ">false</Optimize>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Optimize Condition=" '$(Optimize)' == '' ">true</Optimize>
  </PropertyGroup>
  <!-- User-facing platform-specific defaults -->
  <!-- 
    NOTE:
    
     * We cannot compare against $(Platform) directly as that will give VS cause to instantiate extra 
       configurations, for each combination, which leads to performance problems and clutter in the sln
       in the common AnyCPU-only case.

     * We cannot just set $(PlatformTarget) to $(Platform) here because $(Platform) can be set to anything
       at the solution level, but there are a fixed set valid $(PlatformTarget) values that can be passed
       to the compiler. It is up to the user to explicitly set PlatformTarget to non-AnyCPU (if desired)
       outside the 1:1 defaults below.
  -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_PlatformWithoutConfigurationInference>$(Platform)</_PlatformWithoutConfigurationInference>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(_PlatformWithoutConfigurationInference)' == 'x64' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PlatformTarget Condition=" '$(PlatformTarget)' == '' ">x64</PlatformTarget>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(_PlatformWithoutConfigurationInference)' == 'x86' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PlatformTarget Condition=" '$(PlatformTarget)' == '' ">x86</PlatformTarget>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(_PlatformWithoutConfigurationInference)' == 'ARM' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PlatformTarget Condition=" '$(PlatformTarget)' == '' ">ARM</PlatformTarget>
  </PropertyGroup>
  <!-- Default settings for all projects built with this Sdk package -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DebugType Condition=" '$(DebugType)' == '' ">portable</DebugType>
    <!-- This will turn off the base UWP-specific 'ResolveNuGetPackages' target -->
    <ResolveNuGetPackages>false</ResolveNuGetPackages>
    <!-- Skip import of Microsoft.NuGet.props and Microsoft.NuGet.targets -->
    <SkipImportNuGetProps>true</SkipImportNuGetProps>
    <SkipImportNuGetBuildTargets>true</SkipImportNuGetBuildTargets>
    <!-- NuGet should always restore .NET SDK projects with "PackageReference" style restore.  Setting this property will
         cause the right thing to happen even if there aren't any PackageReference items in the project, such as when
         a project targets .NET Framework and doesn't have any direct package dependencies. -->
    <RestoreProjectStyle>PackageReference</RestoreProjectStyle>
    <!-- Exclude GAC, registry, output directory from search paths. -->
    <AssemblySearchPaths Condition=" '$(AssemblySearchPaths)' == '' ">{CandidateAssemblyFiles};{HintPathFromItem};{TargetFrameworkDirectory};{RawFileName}</AssemblySearchPaths>
    <DesignTimeAssemblySearchPaths Condition=" '$(DesignTimeAssemblySearchPaths)' == '' ">$(AssemblySearchPaths)</DesignTimeAssemblySearchPaths>
    <AllowUnsafeBlocks Condition="'$(AllowUnsafeBlocks)'==''">false</AllowUnsafeBlocks>
    <TreatWarningsAsErrors Condition="'$(TreatWarningsAsErrors)'==''">false</TreatWarningsAsErrors>
    <Prefer32Bit Condition="'$(Prefer32Bit)'==''">false</Prefer32Bit>
    <SignAssembly Condition="'$(SignAssembly)'==''">false</SignAssembly>
    <DelaySign Condition="'$(DelaySign)'==''">false</DelaySign>
    <GeneratePackageOnBuild Condition="'$(GeneratePackageOnBuild)'==''">false</GeneratePackageOnBuild>
    <PackageRequireLicenseAcceptance Condition="'$(PackageRequireLicenseAcceptance)'==''">false</PackageRequireLicenseAcceptance>
    <DebugSymbols Condition="'$(DebugSymbols)'==''">false</DebugSymbols>
    <CheckForOverflowUnderflow Condition="'$(CheckForOverflowUnderflow)'==''">false</CheckForOverflowUnderflow>
    <!-- Uncomment this once https://github.com/Microsoft/visualfsharp/issues/3207 gets fixed -->
    <!-- <WarningsAsErrors Condition=" '$(WarningsAsErrors)' == '' ">NU1605</WarningsAsErrors> -->
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Path to project that the .NET CLI will build in order to generate deps.json files for .NET CLI tools -->
    <ToolDepsJsonGeneratorProject>$(MSBuildThisFileDirectory)GenerateDeps\GenerateDeps.proj</ToolDepsJsonGeneratorProject>
  </PropertyGroup>
  <!-- Default item includes (globs and implicit references) -->
  <!--
============================================================================================================================================
  <Import Project="Microsoft.NET.Sdk.DefaultItems.props">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.DefaultItems.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Sdk.DefaultItems.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup Condition="'$(NETCoreSdkBundledVersionsProps)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETCoreSdkBundledVersionsProps>$(MSBuildThisFileDirectory)..\..\..\Microsoft.NETCoreSdk.BundledVersions.props</NETCoreSdkBundledVersionsProps>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(NETCoreSdkBundledVersionsProps)" Condition="Exists('$(NETCoreSdkBundledVersionsProps)')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft.NETCoreSdk.BundledVersions.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NETCoreSdk.BundledVersions.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <PropertyGroup>
    <BundledNETCoreAppTargetFrameworkVersion>2.1</BundledNETCoreAppTargetFrameworkVersion>
    <BundledNETCoreAppPackageVersion>2.1.0</BundledNETCoreAppPackageVersion>
    <BundledNETStandardTargetFrameworkVersion>2.0</BundledNETStandardTargetFrameworkVersion>
    <BundledNETStandardPackageVersion>2.0.3</BundledNETStandardPackageVersion>
    <BundledNETCorePlatformsPackageVersion>2.1.0</BundledNETCorePlatformsPackageVersion>
    <BundledAspNetCoreAllTargetFrameworkVersion>2.1</BundledAspNetCoreAllTargetFrameworkVersion>
    <BundledAspNetCoreAllPackageVersion>2.1.0</BundledAspNetCoreAllPackageVersion>
    <BundledAspNetCoreAppTargetFrameworkVersion>2.1</BundledAspNetCoreAppTargetFrameworkVersion>
    <BundledAspNetCoreAppPackageVersion>2.1.0</BundledAspNetCoreAppPackageVersion>
    <NETCoreSdkVersion>2.1.300</NETCoreSdkVersion>
    <_NETCoreSdkIsPreview />
    <!-- Latest patch versions for each minor version of .NET Core -->
    <LatestPatchVersionForNetCore1_0 Condition="'' == ''">1.0.11</LatestPatchVersionForNetCore1_0>
    <LatestPatchVersionForNetCore1_1 Condition="'' == ''">1.1.8</LatestPatchVersionForNetCore1_1>
    <LatestPatchVersionForNetCore2_0 Condition="'' == ''">2.0.7</LatestPatchVersionForNetCore2_0>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.DefaultItems.props
============================================================================================================================================
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <ItemGroup Condition=" '$(EnableDefaultItems)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Compile Include="**/*$(DefaultLanguageSourceExtension)" Exclude="$(DefaultItemExcludes);$(DefaultExcludesInProjectFolder)" Condition=" '$(EnableDefaultCompileItems)' == 'true' " />
    <EmbeddedResource Include="**/*.resx" Exclude="$(DefaultItemExcludes);$(DefaultExcludesInProjectFolder)" Condition=" '$(EnableDefaultEmbeddedResourceItems)' == 'true' " />
  </ItemGroup>
  <ItemGroup Condition=" '$(EnableDefaultItems)' == 'true' And '$(EnableDefaultNoneItems)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <None Include="**/*" Exclude="$(DefaultItemExcludes);$(DefaultExcludesInProjectFolder)" />
    <None Remove="**/*$(DefaultLanguageSourceExtension)" />
    <None Remove="**/*.resx" />
  </ItemGroup>
  <!-- Automatically reference NETStandard.Library or Microsoft.NETCore.App package if targeting the corresponding target framework.
      We can refer here in the .props file to properties set in the .targets files because items and their conditions are
      evaluated in the second pass of evaluation, after all properties have been evaluated. -->
  <ItemGroup Condition=" '$(DisableImplicitFrameworkReferences)' != 'true' and '$(TargetFrameworkIdentifier)' == '.NETStandard'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageReference Include="NETStandard.Library" Version="$(NETStandardImplicitPackageVersion)" IsImplicitlyDefined="true" />
    <!-- If targeting .NET Standard 2.0 or higher, then don't include a dependency on NETStandard.Library in the package produced by pack -->
    <PackageReference Update="NETStandard.Library" Condition=" ('$(_TargetFrameworkVersionWithoutV)' != '') And ('$(_TargetFrameworkVersionWithoutV)' &gt;= '2.0') " PrivateAssets="All" Publish="true" />
  </ItemGroup>
  <ItemGroup Condition=" '$(DisableImplicitFrameworkReferences)' != 'true' and '$(TargetFrameworkIdentifier)' == '.NETCoreApp'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageReference Include="Microsoft.NETCore.App" Version="$(RuntimeFrameworkVersion)" IsImplicitlyDefined="true" />
    <!-- For libraries targeting .NET Core 2.0 or higher, don't include a dependency on Microsoft.NETCore.App in the package produced by pack.
         Packing an app (for example a .NET CLI tool) should include the Microsoft.NETCore.App package dependency. -->
    <PackageReference Update="Microsoft.NETCore.App" Condition="('$(OutputType)' != 'Exe') And ('$(_TargetFrameworkVersionWithoutV)' != '') And ('$(_TargetFrameworkVersionWithoutV)' &gt;= '2.0')" PrivateAssets="All" Publish="true" />
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.props
============================================================================================================================================
-->
  <!-- List of supported .NET Core and .NET Standard TFMs -->
  <!--
============================================================================================================================================
  <Import Project="Microsoft.NET.SupportedTargetFrameworks.props">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.SupportedTargetFrameworks.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.SupportedTargetFrameworks.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!-- This file contains a list of the TFMs that are supported by this SDK for .NET Core and .NET Standard.
     This is used by VS to show the list of frameworks to which projects can be retargeted. -->
  <PropertyGroup>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!-- .NET Core -->
  <ItemGroup>
    <SupportedTargetFramework Include=".NETCoreApp,Version=v1.0" DisplayName=".NET Core 1.0" />
    <SupportedTargetFramework Include=".NETCoreApp,Version=v1.1" DisplayName=".NET Core 1.1" />
    <SupportedTargetFramework Include=".NETCoreApp,Version=v2.0" DisplayName=".NET Core 2.0" />
    <SupportedTargetFramework Include=".NETCoreApp,Version=v2.1" DisplayName=".NET Core 2.1" />
  </ItemGroup>
  <!-- .NET Standard -->
  <ItemGroup>
    <SupportedTargetFramework Include=".NETStandard,Version=v1.0" DisplayName=".NET Standard 1.0" />
    <SupportedTargetFramework Include=".NETStandard,Version=v1.1" DisplayName=".NET Standard 1.1" />
    <SupportedTargetFramework Include=".NETStandard,Version=v1.2" DisplayName=".NET Standard 1.2" />
    <SupportedTargetFramework Include=".NETStandard,Version=v1.3" DisplayName=".NET Standard 1.3" />
    <SupportedTargetFramework Include=".NETStandard,Version=v1.4" DisplayName=".NET Standard 1.4" />
    <SupportedTargetFramework Include=".NETStandard,Version=v1.5" DisplayName=".NET Standard 1.5" />
    <SupportedTargetFramework Include=".NETStandard,Version=v1.6" DisplayName=".NET Standard 1.6" />
    <SupportedTargetFramework Include=".NETStandard,Version=v2.0" DisplayName=".NET Standard 2.0" />
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.props
============================================================================================================================================
-->
  <!--<Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Sdk.CSharp.props" Condition="'$(MSBuildProjectExtension)' == '.csproj'" />-->
  <!--<Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Sdk.VisualBasic.props" Condition="'$(MSBuildProjectExtension)' == '.vbproj'" />-->
  <!--<Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Sdk.FSharp.props" Condition="'$(MSBuildProjectExtension)' == '.fsproj'" />-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.PackTool.props">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.PackTool.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.PackTool.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetsForTfmSpecificContentInPackage>$(TargetsForTfmSpecificContentInPackage);PackTool</TargetsForTfmSpecificContentInPackage>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.props
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\src\corehost\build.proj
============================================================================================================================================
-->
  <PropertyGroup>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <SkipCopyBuildProduct>true</SkipCopyBuildProduct>
  </PropertyGroup>
  <!-- Target that builds dotnet, hostfxr and hostpolicy with the same version as what NetCoreApp will be built for
       since the build produced artifacts should always version the same (even if they may not get used).
  -->
  <Target Name="Build" DependsOnTargets="BuildCoreHostUnix;BuildCoreHostWindows" />
  <PropertyGroup Condition="'$(OSGroup)' != 'Windows_NT'">
    <GenerateVersionSourceFile>true</GenerateVersionSourceFile>
    <NativeVersionSourceFile>$(BaseIntermediateOutputPath)version.cpp</NativeVersionSourceFile>
  </PropertyGroup>
  <Target Name="BuildCoreHostUnix" Condition="'$(OSGroup)' != 'Windows_NT'" DependsOnTargets="GetLatestCommitHash;GenerateVersionSourceFile">
    <PropertyGroup>
      <CMakeBuildDir>$(IntermediateOutputRootPath)corehost\cmake\</CMakeBuildDir>
      <BuildArgs>--arch $(TargetArchitecture) --apphostver $(AppHostVersion) --hostver $(HostVersion) --fxrver $(HostResolverVersion) --policyver $(HostPolicyVersion) --commithash $(LatestCommit)</BuildArgs>
      <BuildArgs Condition="'$(PortableBuild)' == 'true'">$(BuildArgs) -portable</BuildArgs>
      <BuildArgs Condition="'$(CrossBuild)' == 'true'">$(BuildArgs) --cross</BuildArgs>
      <BuildArgs Condition="'$(StripSymbols)' == 'true'">$(BuildArgs) --stripsymbols</BuildArgs>
    </PropertyGroup>
    <RemoveDir Directories="$(CMakeBuildDir)" Condition="Exists('$(CMakeBuildDir)') And '$(IncrementalNativeBuild)' != 'true'" />
    <MakeDir Directories="$(CMakeBuildDir)" Condition="!(Exists('$(CMakeBuildDir)'))" />
    <Message Text="$(MSBuildProjectDirectory)\build.sh $(BuildArgs)" Importance="High" />
    <Exec Command="$(MSBuildProjectDirectory)\build.sh $(BuildArgs)" WorkingDirectory="$(CMakeBuildDir)" />
    <ItemGroup>
      <CMakeOutput Include="$(CMakeBuildDir)cli\dotnet\dotnet" />
      <CMakeOutput Include="$(CMakeBuildDir)cli\apphost\apphost" />
      <CMakeOutput Include="$(CMakeBuildDir)cli\hostpolicy\$(HostPolicyBaseName)" />
      <CMakeOutput Include="$(CMakeBuildDir)cli\fxr\$(DotnetHostFxrBaseName)" />
    </ItemGroup>
    <ItemGroup Condition="'$(StripSymbols)' == 'true'">
      <CMakeOutput Include="@(CmakeOutput -> '%(Identity)$(SymbolFileExtension)')" />
    </ItemGroup>
    <Copy SourceFiles="@(CMakeOutput)" DestinationFolder="$(CoreHostOutputDir)" />
  </Target>
  <Target Name="GetLatestCommitHash" />
  <Target Name="CreateManifestResourceNames" />
  <Target Name="CoreCompile" />
  <Target Name="BuildCoreHostWindows" Condition="'$(OSGroup)' == 'Windows_NT'" DependsOnTargets="GetLatestCommitHash">
    <!-- Generate Version files -->
    <ItemGroup>
      <HostFiles Include="dotnet">
        <FileDescription>.NET Core Host</FileDescription>
      </HostFiles>
      <HostFiles Include="hostfxr">
        <FileDescription>.NET Core Host Resolver - $(HostResolverVersion)</FileDescription>
      </HostFiles>
      <HostFiles Include="hostpolicy">
        <FileDescription>.NET Core Host Policy - $(HostPolicyVersion)</FileDescription>
      </HostFiles>
    </ItemGroup>
    <MSBuild Projects="$(MSBuildProjectFullPath)" Properties="GenerateNativeVersionInfo=true;FileDescription=%(HostFiles.FileDescription);NativeVersionFileDir=$(IntermediateOutputRootPath)hostResourceFiles\%(HostFiles.Identity);NativeVersionHeaderFile=$(IntermediateOutputRootPath)hostResourceFiles\%(HostFiles.Identity)\version_info.h" Targets="GenerateNativeVersionFile" Condition="'$(IncrementalNativeBuild)' != 'true'" />
    <PropertyGroup>
      <BuildArgs>$(ConfigurationGroup) $(TargetArchitecture) apphostver $(AppHostVersion) hostver $(HostVersion) fxrver $(HostResolverVersion) policyver $(HostPolicyVersion) commit $(LatestCommit) rid $(OutputRid)</BuildArgs>
      <BuildArgs Condition="'$(PortableBuild)' == 'true'">$(BuildArgs) portable</BuildArgs>
      <BuildArgs Condition="'$(IncrementalNativeBuild)' == 'true'">$(BuildArgs) incremental-native-build</BuildArgs>
      <CustomNativeToolsetDir Condition="'$(TargetArchitecture)' == 'arm64'"> toolsetdir $(NativeToolsetDir)</CustomNativeToolsetDir>
    </PropertyGroup>
    <!-- Run script that invokes Cmake to create VS files, and then calls msbuild to compile them -->
    <Message Text="$(MSBuildProjectDirectory)\build.cmd $(BuildArgs)" Importance="High" />
    <Exec Command="$(MSBuildProjectDirectory)\build.cmd $(BuildArgs)$(CustomNativeToolsetDir)" />
    <ItemGroup>
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\dotnet\$(ConfigurationGroup)\dotnet.exe" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\dotnet\$(ConfigurationGroup)\dotnet.pdb" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\apphost\$(ConfigurationGroup)\apphost.exe" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\apphost\$(ConfigurationGroup)\apphost.pdb" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\hostpolicy\$(ConfigurationGroup)\$(HostPolicyBaseName)" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\hostpolicy\$(ConfigurationGroup)\hostpolicy.pdb" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\fxr\$(ConfigurationGroup)\$(DotnetHostFxrBaseName)" />
      <CMakeOutput Include="$(IntermediateOutputRootPath)corehost\cli\fxr\$(ConfigurationGroup)\hostfxr.pdb" />
    </ItemGroup>
    <Copy SourceFiles="@(CMakeOutput)" DestinationFolder="$(CoreHostOutputDir)" />
  </Target>
  <!--
============================================================================================================================================
  <Import Project="Sdk.targets" Sdk="Microsoft.NET.Sdk">
  This import was added implicitly because the Project element's Sdk attribute specified "Microsoft.NET.Sdk".

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Sdk.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!-- Using the same property as Microsoft.CSharp.targets and presumably Microsoft.VisualBasic.targets here -->
  <PropertyGroup Condition="'$(TargetFrameworks)' != '' and '$(TargetFramework)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IsCrossTargetingBuild>true</IsCrossTargetingBuild>
  </PropertyGroup>
  <!--<Import Project="$(MSBuildThisFileDirectory)..\targets\Microsoft.NET.Sdk.BeforeCommonCrossTargeting.targets" Condition="'$(IsCrossTargetingBuild)' == 'true'" />-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)..\targets\Microsoft.NET.Sdk.BeforeCommon.targets" Condition="'$(IsCrossTargetingBuild)' != 'true'">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.BeforeCommon.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Sdk.BeforeCommon.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <_IsExecutable Condition="'$(OutputType)' == 'Exe' or '$(OutputType)'=='WinExe'">true</_IsExecutable>
  </PropertyGroup>
  <PropertyGroup Condition="'$(HasRuntimeOutput)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <HasRuntimeOutput>$(_IsExecutable)</HasRuntimeOutput>
    <_UsingDefaultForHasRuntimeOutput>true</_UsingDefaultForHasRuntimeOutput>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.DefaultAssemblyInfo.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.DefaultAssemblyInfo.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.DefaultAssemblyInfo.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Version)' == '' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <VersionPrefix Condition=" '$(VersionPrefix)' == '' ">1.0.0</VersionPrefix>
    <Version Condition=" '$(VersionSuffix)' != '' ">$(VersionPrefix)-$(VersionSuffix)</Version>
    <Version Condition=" '$(Version)' == '' ">$(VersionPrefix)</Version>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Authors Condition=" '$(Authors)'=='' ">$(AssemblyName)</Authors>
    <Company Condition=" '$(Company)'=='' ">$(Authors)</Company>
    <AssemblyTitle Condition=" '$(AssemblyTitle)' == '' ">$(AssemblyName)</AssemblyTitle>
    <Product Condition=" '$(Product)' == ''">$(AssemblyName)</Product>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.BeforeCommon.targets
============================================================================================================================================
-->
  <!-- Set default intermediate and output paths -->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.DefaultOutputPaths.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.DefaultOutputPaths.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.DefaultOutputPaths.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!--
    Apply the same default output paths as Microsoft.Common.targets now since we're running before them,
    but need to adjust them and/or make decisions in terms of them.

    Also note that common targets only set a default OutputPath if neither configuration nor 
    platform were set by the user. This was used to validate that a valid configuration is passed, 
    assuming the convention maintained by VS that every Configuration|Platform combination had 
    an explicit OutputPath. Since we now want to support leaner project files with less 
    duplication and more automatic defaults, we always set a default OutputPath and can no
    longer depend on that convention for validation. Getting validation re-enabled with a 
    different mechanism is tracked by https://github.com/dotnet/sdk/issues/350
   -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <Configuration Condition="'$(Configuration)'==''">Debug</Configuration>
    <Platform Condition="'$(Platform)'==''">AnyCPU</Platform>
    <PlatformName Condition="'$(PlatformName)' == ''">$(Platform)</PlatformName>
    <BaseOutputPath Condition="'$(BaseOutputPath)' == ''">bin\</BaseOutputPath>
    <BaseOutputPath Condition="!HasTrailingSlash('$(BaseOutputPath)')">$(BaseOutputPath)\</BaseOutputPath>
    <OutputPath Condition="'$(OutputPath)' == '' and '$(PlatformName)' == 'AnyCPU'">$(BaseOutputPath)$(Configuration)\</OutputPath>
    <OutputPath Condition="'$(OutputPath)' == '' and '$(PlatformName)' != 'AnyCPU'">$(BaseOutputPath)$(PlatformName)\$(Configuration)\</OutputPath>
    <OutputPath Condition="!HasTrailingSlash('$(OutputPath)')">$(OutputPath)\</OutputPath>
    <BaseIntermediateOutputPath Condition="'$(BaseIntermediateOutputPath)' == ''">obj\</BaseIntermediateOutputPath>
    <BaseIntermediateOutputPath Condition="!HasTrailingSlash('$(BaseIntermediateOutputPath)')">$(BaseIntermediateOutputPath)\</BaseIntermediateOutputPath>
    <IntermediateOutputPath Condition=" $(IntermediateOutputPath) == '' and '$(PlatformName)' == 'AnyCPU' ">$(BaseIntermediateOutputPath)$(Configuration)\</IntermediateOutputPath>
    <IntermediateOutputPath Condition=" $(IntermediateOutputPath) == '' and '$(PlatformName)' != 'AnyCPU' ">$(BaseIntermediateOutputPath)$(PlatformName)\$(Configuration)\</IntermediateOutputPath>
    <IntermediateOutputPath Condition="!HasTrailingSlash('$(IntermediateOutputPath)')">$(IntermediateOutputPath)\</IntermediateOutputPath>
  </PropertyGroup>
  <!-- Set the package output path (for nuget pack target) now, before the TargetFramework is appended -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageOutputPath Condition="'$(PackageOutputPath)' == ''">$(OutputPath)</PackageOutputPath>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.BeforeCommon.targets
============================================================================================================================================
-->
  <!-- 
    Expand TargetFramework to TargetFrameworkIdentifier and TargetFrameworkVersion,
    and adjust intermediate and output paths to include it.
  -->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.TargetFrameworkInference.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.TargetFrameworkInference.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.TargetFrameworkInference.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!-- 
    Note that this file is only included when $(TargetFramework) is set and so we do not need to check that here.

    Common targets require that $(TargetFrameworkIdentifier) and $(TargetFrameworkVersion) are set by static evaluation
    before they are imported. In common cases (currently netstandard, netcoreapp, or net), we infer them from the short
    names given via TargetFramework to allow for terseness and lack of duplication in project files.

    For other cases, the user must supply them manually.

    For cases where inference is supported, the user need only specify the targets in TargetFrameworks, e.g:
      <PropertyGroup>
        <TargetFrameworks>net45;netstandard1.0</TargetFrameworks>
      </PropertyGroup>

    For cases where inference is not supported, identifier, version and profile can be specified explicitly as follows:
       <PropertyGroup>
         <TargetFrameworks>portable-net451+win81;xyz1.0</TargetFrameworks>
       <PropertyGroup>
       <PropertyGroup Condition="'$(TargetFramework)' == 'portable-net451+win81'">
         <TargetFrameworkIdentifier>.NETPortable</TargetFrameworkIdentifier>
         <TargetFrameworkVersion>v4.6</TargetFrameworkVersion>
         <TargetFrameworkProfile>Profile44</TargetFrameworkProfile>
       </PropertyGroup>
       <PropertyGroup Condition="'$(TargetFramework)' == 'xyz1.0'">
         <TargetFrameworkIdentifier>Xyz</TargetFrameworkVersion>
       <PropertyGroup>

    Note in the xyz1.0 case, which is meant to demonstrate a framework we don't yet recognize, we can still
    infer the version of 1.0. The user can also override it as always we honor a TargetFrameworkIdentifier
    or TargetFrameworkVersion that is already set.
   -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!-- Split $(TargetFramework) (e.g. net45) into short identifier and short version (e.g. 'net' and '45'). -->
  <PropertyGroup Condition="'$(TargetFramework)' != '' and !$(TargetFramework.Contains(',')) and !$(TargetFramework.Contains('+'))" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_ShortFrameworkIdentifier>$(TargetFramework.TrimEnd('.0123456789'))</_ShortFrameworkIdentifier>
    <_ShortFrameworkVersion>$(TargetFramework.Substring($(_ShortFrameworkIdentifier.Length)))</_ShortFrameworkVersion>
  </PropertyGroup>
  <!-- Map short name to long name. See earlier comment for example of how to work with identifiers that are not recognized here. -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkIdentifier Condition="'$(_ShortFrameworkIdentifier)' == 'netstandard'">.NETStandard</TargetFrameworkIdentifier>
    <TargetFrameworkIdentifier Condition="'$(_ShortFrameworkIdentifier)' == 'netcoreapp'">.NETCoreApp</TargetFrameworkIdentifier>
    <TargetFrameworkIdentifier Condition="'$(_ShortFrameworkIdentifier)' == 'net'">.NETFramework</TargetFrameworkIdentifier>
  </PropertyGroup>
  <!-- Versions with dots are taken as is and just given leading 'v'. -->
  <PropertyGroup Condition="'$(TargetFrameworkVersion)' == '' and '$(_ShortFrameworkVersion)' != '' and $(_ShortFrameworkVersion.Contains('.'))" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkVersion>v$(_ShortFrameworkVersion)</TargetFrameworkVersion>
  </PropertyGroup>
  <!-- Versions with no dots and up to 3 characters get leading 'v' and implicit dots between characters. -->
  <PropertyGroup Condition="'$(TargetFrameworkVersion)' == '' and '$(_ShortFrameworkVersion)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkVersion Condition="$(_ShortFrameworkVersion.Length) == 1">v$(_ShortFrameworkVersion[0]).0</TargetFrameworkVersion>
    <TargetFrameworkVersion Condition="$(_ShortFrameworkVersion.Length) == 2">v$(_ShortFrameworkVersion[0]).$(_ShortFrameworkVersion[1])</TargetFrameworkVersion>
    <TargetFrameworkVersion Condition="$(_ShortFrameworkVersion.Length) == 3">v$(_ShortFrameworkVersion[0]).$(_ShortFrameworkVersion[1]).$(_ShortFrameworkVersion[2])</TargetFrameworkVersion>
  </PropertyGroup>
  <!-- 
    Trigger an error if we're unable to infer the framework identifier and version. 

    We have to evaluate this here and not in the target because by the time the target runs,
    Microsoft.Common.targets will have defaulted to .NETFramework,Version=v4.0
  -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '' or '$(TargetFrameworkVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_UnsupportedTargetFrameworkError>true</_UnsupportedTargetFrameworkError>
  </PropertyGroup>
  <!--
    NOTE: We must not validate the TFM before restore target runs as it prevents adding additional TFM 
          support from being provided by a nuget package such as MSBuild.Sdk.Extras.

          We run before RunResolvePackageDependencies and GetReferenceAssemblyPaths so that design-time builds
          which do not currently invoke _CheckForInvalidConfigurationAndPlatform, will not trigger spurious 
          errors that are only consequences of the root cause identified here.
  -->
  <Target Name="_CheckForUnsupportedTargetFramework" BeforeTargets="_CheckForInvalidConfigurationAndPlatform;RunResolvePackageDependencies;GetReferenceAssemblyPaths" Condition="'$(_UnsupportedTargetFrameworkError)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkError Condition="!$(TargetFramework.Contains(';'))" ResourceName="CannotInferTargetFrameworkIdentiferAndVersion" FormatArguments="$([MSBuild]::Escape('$(TargetFramework)'))" />
    <NETSdkError Condition="$(TargetFramework.Contains(';'))" ResourceName="TargetFrameworkWithSemicolon" FormatArguments="$([MSBuild]::Escape('$(TargetFramework)'))" />
  </Target>
  <Target Name="_CollectTargetFrameworkForTelemetry" AfterTargets="_CheckForUnsupportedTargetFramework" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Telemetry EventName="targetframeworkeval" EventData="TargetFrameworkVersion=$([MSBuild]::Escape('$(TargetFrameworkMoniker)'))" />
  </Target>
  <!-- 
    Don't leave TargetFrameworkVersion empty if it still hasn't been determined. We will trigger the error above,
    but we need this to be a valid version so that our error message does not get pre-empted by failure to interpret
    version comparison expressions, which is currently unrecoverable in VS.

    Also don't leave TargetFrameworkIdentifier unset as it will be defaulted to .NETFramework by common targets, which
    can cause restore (which we cannot block, see above) to silently succeed for empty TargetFramework.
  -->
  <PropertyGroup Condition="'$(TargetFrameworkVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkVersion>v0.0</TargetFrameworkVersion>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkIdentifier>_</TargetFrameworkIdentifier>
  </PropertyGroup>
  <!--
    Trigger an error if targeting a higher version of .NET Core or .NET Standard than is supported by the current SDK.
  -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(NETCoreAppMaximumVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Once we've bundled a 2.1 version of .NET Core with the CLI, reset this property to use $(BundledNETCoreAppTargetFrameworkVersion) -->
    <NETCoreAppMaximumVersion>2.1</NETCoreAppMaximumVersion>
    <!--<NETCoreAppMaximumVersion>$(BundledNETCoreAppTargetFrameworkVersion)</NETCoreAppMaximumVersion>-->
  </PropertyGroup>
  <Target Name="_CheckForUnsupportedNETCoreVersion" BeforeTargets="_CheckForInvalidConfigurationAndPlatform;Restore;CollectPackageReferences" Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(NETCoreAppMaximumVersion)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkError Condition="'$(_TargetFrameworkVersionWithoutV)' &gt; '$(NETCoreAppMaximumVersion)'" ResourceName="UnsupportedTargetFrameworkVersion" FormatArguments=".NET Core;$(_TargetFrameworkVersionWithoutV);$(NETCoreAppMaximumVersion)" />
  </Target>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETStandard' And '$(NETStandardMaximumVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETStandardMaximumVersion>$(BundledNETStandardTargetFrameworkVersion)</NETStandardMaximumVersion>
  </PropertyGroup>
  <Target Name="_CheckForUnsupportedNETStandardVersion" BeforeTargets="_CheckForInvalidConfigurationAndPlatform;Restore;CollectPackageReferences" Condition="'$(TargetFrameworkIdentifier)' == '.NETStandard' And '$(NETStandardMaximumVersion)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkError Condition="'$(_TargetFrameworkVersionWithoutV)' &gt; '$(NETStandardMaximumVersion)'" ResourceName="UnsupportedTargetFrameworkVersion" FormatArguments=".NET Standard;$(_TargetFrameworkVersionWithoutV);$(NETStandardMaximumVersion)" />
  </Target>
  <!-- Exclude files from OutputPath and IntermediateOutputPath from default item globs.  Use the value
       of these properties before the TargetFramework is appended, so that if these values are specified
       in the project file, the specified value will be used for the exclude.
       
       We may be able to move this to Microsoft.NET.Sdk.DefaultItems.targets (where the other DefaultItemExcludes
       are defined) if we fix https://github.com/dotnet/sdk/issues/550
       -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DefaultItemExcludes>$(DefaultItemExcludes);$(OutputPath)/**</DefaultItemExcludes>
    <DefaultItemExcludes>$(DefaultItemExcludes);$(IntermediateOutputPath)/**</DefaultItemExcludes>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AppendTargetFrameworkToOutputPath Condition="'$(AppendTargetFrameworkToOutputPath)' == ''">true</AppendTargetFrameworkToOutputPath>
  </PropertyGroup>
  <!--
    Append $(TargetFramework) directory to output and intermediate paths to prevent bin clashes between
    targets.
   -->
  <PropertyGroup Condition="'$(AppendTargetFrameworkToOutputPath)' == 'true' and '$(TargetFramework)' != '' and '$(_UnsupportedTargetFrameworkError)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IntermediateOutputPath>$(IntermediateOutputPath)$(TargetFramework.ToLowerInvariant())\</IntermediateOutputPath>
    <OutputPath>$(OutputPath)$(TargetFramework.ToLowerInvariant())\</OutputPath>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.BeforeCommon.targets
============================================================================================================================================
-->
  <!--
    Use RuntimeIdentifier to determine PlatformTarget.
    Also, enforce that RuntimeIdentifier is always specified for .NETFramework executables.
  -->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.RuntimeIdentifierInference.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.RuntimeIdentifierInference.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.RuntimeIdentifierInference.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!--
    .NETFramework cannot load native package dependencies dynamically
    based on the current architecture.  We have must have a RID to
    resolve and copy native dependencies to the output directory.

     When building a .NETFramework exe on Windows and not given a RID,
     we'll pick either win7-x64 or win7-x86 (based on PlatformTarget)
     if we're not given an explicit RID. However, if after resolving
     NuGet assets we find no copy-local native dependencies, we will
     emit the binary as AnyCPU.

     Note that we must set the RID here early (to be seen during NuGet
     restore) in order for the project.assets.json to include the
     native dependencies that will let us make the final call on
     AnyCPU or platform-specific.

     This allows these common cases to work without requiring mention
     of RuntimeIdentifier in the user project PlatformTarget:

      1. Building an AnyCPU .NETFramework application on any host OS
         with no native NuGet dependencies. (*)

      2. Building an x86 or x64 NETFramework application on and for
         Windows with native NuGet dependencies that do not require
         greater than win7.

     However, any other combination of host operating system, CPU
     architecture, and minimum Windows version will require some
     manual intervention in the project file to set up the right
     RID. (**)

     (*) Building NET4x from non-Windows is still not fully supported:
         https://github.com/dotnet/sdk/issues/335) The point above is
         that this code would not have to change to make the first
         scenario work on non-Windows hosts.

     (**) https://github.com/dotnet/sdk/issues/840 tracks improving
          the default RID selection here to make more non-AnyCPU scenarios
          work without user intervention. The current static evaluation
          requirement limits us.
   -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETFramework' and                              '$(HasRuntimeOutput)' == 'true' and                              '$(OS)' == 'Windows_NT' and                             '$(RuntimeIdentifier)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_UsingDefaultRuntimeIdentifier>true</_UsingDefaultRuntimeIdentifier>
    <RuntimeIdentifier Condition="'$(PlatformTarget)' == 'x64'">win7-x64</RuntimeIdentifier>
    <RuntimeIdentifier Condition="'$(PlatformTarget)' == 'x86' or '$(PlatformTarget)' == ''">win7-x86</RuntimeIdentifier>
  </PropertyGroup>
  <PropertyGroup Condition="'$(PlatformTarget)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_UsingDefaultPlatformTarget>true</_UsingDefaultPlatformTarget>
  </PropertyGroup>
  <!-- Determine PlatformTarget (if not already set) from runtime identifier. -->
  <Choose xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <When Condition="'$(PlatformTarget)' != '' or '$(RuntimeIdentifier)' == ''" />
    <When Condition="$(RuntimeIdentifier.EndsWith('-x86')) or $(RuntimeIdentifier.Contains('-x86-'))">
      <PropertyGroup>
        <PlatformTarget>x86</PlatformTarget>
      </PropertyGroup>
    </When>
    <When Condition="$(RuntimeIdentifier.EndsWith('-x64')) or $(RuntimeIdentifier.Contains('-x64-'))">
      <PropertyGroup>
        <PlatformTarget>x64</PlatformTarget>
      </PropertyGroup>
    </When>
    <When Condition="$(RuntimeIdentifier.EndsWith('-arm')) or $(RuntimeIdentifier.Contains('-arm-'))">
      <PropertyGroup>
        <PlatformTarget>arm</PlatformTarget>
      </PropertyGroup>
    </When>
    <!-- NOTE: PlatformTarget=arm64 is not currently supported and therefore no inference of that here. -->
    <Otherwise>
      <PropertyGroup>
        <PlatformTarget>AnyCPU</PlatformTarget>
      </PropertyGroup>
    </Otherwise>
  </Choose>
  <!--
    SelfContained was not an option in .NET Core SDK 1.0. 
    Default SelfContained based on the RuntimeIdentifier, so projects don't have to explicitly set SelfContained.
    This avoids a breaking change from 1.0 behavior.
    -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' and '$(HasRuntimeOutput)' == 'true' and '$(SelfContained)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SelfContained Condition="'$(RuntimeIdentifier)' == ''">false</SelfContained>
    <SelfContained Condition="'$(RuntimeIdentifier)' != ''">true</SelfContained>
  </PropertyGroup>
  <Target Name="_CheckForUnsupportedSelfContained" BeforeTargets="_CheckForInvalidConfigurationAndPlatform" Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' and '$(HasRuntimeOutput)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkError Condition="'$(SelfContained)' == 'true' and '$(RuntimeIdentifier)' == ''" ResourceName="CannotHaveSelfContainedWithoutRuntimeIdentifier" />
  </Target>
  <Target Name="_CheckForMismatchingPlatform" BeforeTargets="_CheckForInvalidConfigurationAndPlatform" Condition="'$(RuntimeIdentifier)' != '' and '$(PlatformTarget)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkError Condition="'$(PlatformTarget)' != 'AnyCPU' and !$(RuntimeIdentifier.ToUpper().Contains($(PlatformTarget.ToUpper())))" ResourceName="CannotHaveRuntimeIdentifierPlatformMismatchPlatformTarget" FormatArguments="$(RuntimeIdentifier);$(PlatformTarget)" />
  </Target>
  <Target Name="_CheckForNETCoreSdkIsPreview" BeforeTargets="_CheckForInvalidConfigurationAndPlatform" Condition=" '$(_NETCoreSdkIsPreview)' == 'true' AND '$(SuppressNETCoreSdkPreviewMessage)' != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ShowPreviewMessage />
  </Target>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Projects can opt out of having the RID appended to the output path by setting this to false. -->
    <AppendRuntimeIdentifierToOutputPath Condition="'$(AppendRuntimeIdentifierToOutputPath)' == ''">true</AppendRuntimeIdentifierToOutputPath>
  </PropertyGroup>
  <!--
    Append $(RuntimeIdentifier) directory to output and intermediate paths to prevent bin clashes between
    targets. 

    But do not append the implicit default runtime identifier for .NET Framework apps as that would 
    append a RID the user never mentioned in the path and do so even in the AnyCPU case.
   -->
  <PropertyGroup Condition="'$(AppendRuntimeIdentifierToOutputPath)' == 'true' and '$(RuntimeIdentifier)' != '' and '$(_UsingDefaultRuntimeIdentifier)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IntermediateOutputPath>$(IntermediateOutputPath)$(RuntimeIdentifier)\</IntermediateOutputPath>
    <OutputPath>$(OutputPath)$(RuntimeIdentifier)\</OutputPath>
  </PropertyGroup>
  <!-- 
    Switch our default .NETFramework CPU architecture choice back to AnyCPU before 
    compiling the exe if no copy-local native dependencies were resolved from NuGet 
  -->
  <Target Name="AdjustDefaultPlatformTargetForNetFrameworkExeWithNoNativeCopyLocalItems" AfterTargets="ResolvePackageAssets" BeforeTargets="CoreCompile" Condition="'$(_UsingDefaultPlatformTarget)' == 'true' and                      '$(_UsingDefaultRuntimeIdentifier)' == 'true' and                       '@(NativeCopyLocalItems)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <PlatformTarget>AnyCPU</PlatformTarget>
    </PropertyGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.BeforeCommon.targets
============================================================================================================================================
-->
  <PropertyGroup Condition="'$(_IsNETCoreOrNETStandard)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_IsNETCoreOrNETStandard Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp'">true</_IsNETCoreOrNETStandard>
    <_IsNETCoreOrNETStandard Condition="'$(TargetFrameworkIdentifier)' == '.NETStandard'">true</_IsNETCoreOrNETStandard>
  </PropertyGroup>
  <!-- Unification / automatic binding redirect logic -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DesignTimeAutoUnify Condition="'$(DesignTimeAutoUnify)' == ''">true</DesignTimeAutoUnify>
    <AutoUnifyAssemblyReferences Condition="'$(AutoUnifyAssemblyReferences)' == '' and $(OutputType) == 'Library'">true</AutoUnifyAssemblyReferences>
    <AutoUnifyAssemblyReferences Condition="'$(AutoUnifyAssemblyReferences)' == '' and '$(_IsNETCoreOrNETStandard)' == 'true'">true</AutoUnifyAssemblyReferences>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETFramework' and '$(HasRuntimeOutput)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AutoGenerateBindingRedirects Condition="'$(AutoGenerateBindingRedirects)' == ''">true</AutoGenerateBindingRedirects>
  </PropertyGroup>
  <!-- Default settings for .NET Core and .NET Standard build logic -->
  <PropertyGroup Condition="'$(_IsNETCoreOrNETStandard)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateDependencyFile Condition=" '$(GenerateDependencyFile)' == '' ">true</GenerateDependencyFile>
    <!-- Assembly and file versions of runtime assets should be written to the deps.json by default, to support
         runtime minor version roll-forward: https://github.com/dotnet/core-setup/issues/3546 -->
    <IncludeFileVersionsInDependencyFile Condition="'$(IncludeFileVersionsInDependencyFile)' == ''">true</IncludeFileVersionsInDependencyFile>
    <!-- Force .dll extension for .NETCoreApp and .NETStandard projects even if output type is exe. -->
    <TargetExt Condition="'$(TargetExt)' == ''">.dll</TargetExt>
    <!-- dependencies coming from the package manager lock file should not be copied locally for .NET Core and .NETStandard projects -->
    <CopyLocalLockFileAssemblies Condition="'$(CopyLocalLockFileAssemblies)' == ''">false</CopyLocalLockFileAssemblies>
    <!-- Disable the use of FrameworkPathOverride in Microsoft.Common.CurrentVersion.targets which can slow down evaluation.  FrameworkPathOverride
    is not needed for NETStandard or NETCore since references come from NuGet packages-->
    <EnableFrameworkPathOverride Condition="'$(EnableFrameworkPathOverride)' == ''">false</EnableFrameworkPathOverride>
  </PropertyGroup>
  <!-- Regardless of platform, enable dependency file generation if PreserveCompilatioContext is set. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateDependencyFile Condition="'$(GenerateDependencyFile)' == ''">$(PreserveCompilationContext)</GenerateDependencyFile>
  </PropertyGroup>
  <!-- Set PublishDir here, before Microsoft.Common.targets, to avoid a competing default there. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PublishDirName Condition="'$(PublishDirName)' == ''">publish</PublishDirName>
    <!-- ensure the PublishDir is RID specific-->
    <PublishDir Condition="'$(PublishDir)' == '' and                            '$(AppendRuntimeIdentifierToOutputPath)' != 'true' and                            '$(RuntimeIdentifier)' != '' and                            '$(_UsingDefaultRuntimeIdentifier)' != 'true'">$(OutputPath)$(RuntimeIdentifier)\$(PublishDirName)\</PublishDir>
    <PublishDir Condition="'$(PublishDir)' == ''">$(OutputPath)$(PublishDirName)\</PublishDir>
  </PropertyGroup>
  <!-- For .NET Framework, reference core assemblies -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_TargetFrameworkVersionWithoutV>$(TargetFrameworkVersion.TrimStart('vV'))</_TargetFrameworkVersionWithoutV>
  </PropertyGroup>
  <!--
    Sets RestoreAdditionalProjectSources or RestoreAdditionalProjectFallbackFolders to the SDK Offline Cache based
    on the TargetFramework.
  -->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.NuGetOfflineCache.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.NuGetOfflineCache.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.NuGetOfflineCache.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_NugetFallbackFolder>$(MSBuildThisFileDirectory)..\..\..\..\NuGetFallbackFolder</_NugetFallbackFolder>
    <_IsNETCore1x Condition=" '$(TargetFrameworkIdentifier)' == '.NETCoreApp' and '$(_TargetFrameworkVersionWithoutV)' &lt; '2.0' ">true</_IsNETCore1x>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(DisableImplicitNuGetFallbackFolder)' != 'true' and Exists($(_NugetFallbackFolder)) " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RestoreAdditionalProjectSources Condition=" '$(_IsNETCore1x)' == 'true' ">$(RestoreAdditionalProjectSources);$(_NugetFallbackFolder)</RestoreAdditionalProjectSources>
    <RestoreAdditionalProjectFallbackFoldersExcludes Condition=" '$(_IsNETCore1x)' == 'true' ">$(RestoreAdditionalProjectFallbackFoldersExcludes);$(_NugetFallbackFolder)</RestoreAdditionalProjectFallbackFoldersExcludes>
    <RestoreAdditionalProjectFallbackFolders Condition=" '$(_IsNETCore1x)' != 'true' ">$(RestoreAdditionalProjectFallbackFolders);$(_NugetFallbackFolder)</RestoreAdditionalProjectFallbackFolders>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.BeforeCommon.targets
============================================================================================================================================
-->
  <ItemGroup Condition=" '$(DisableImplicitFrameworkReferences)' != 'true' and '$(TargetFrameworkIdentifier)' == '.NETFramework'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_SDKImplicitReference Include="System" />
    <_SDKImplicitReference Include="System.Data" />
    <_SDKImplicitReference Include="System.Drawing" />
    <_SDKImplicitReference Include="System.Xml" />
    <!-- When doing greater than/less than comparisons between strings, MSBuild will try to parse the strings as Version objects and compare them as
         such if the parse succeeds. -->
    <!-- Framework assemblies introduced in .NET 3.5 -->
    <_SDKImplicitReference Include="System.Core" Condition=" '$(_TargetFrameworkVersionWithoutV)' &gt;= '3.5' " />
    <_SDKImplicitReference Include="System.Runtime.Serialization" Condition=" '$(_TargetFrameworkVersionWithoutV)' &gt;= '3.5' " />
    <_SDKImplicitReference Include="System.Xml.Linq" Condition=" '$(_TargetFrameworkVersionWithoutV)' &gt;= '3.5' " />
    <!-- Framework assemblies introduced in .NET 4.0 -->
    <_SDKImplicitReference Include="System.Numerics" Condition=" '$(_TargetFrameworkVersionWithoutV)' &gt;= '4.0' " />
    <!-- Framework assemblies introduced in .NET 4.5 -->
    <_SDKImplicitReference Include="System.IO.Compression.FileSystem" Condition=" '$(_TargetFrameworkVersionWithoutV)' &gt;= '4.5' " />
    <!-- Don't automatically reference System.IO.Compression or System.Net.Http to help avoid hitting https://github.com/Microsoft/msbuild/issues/1329. -->
    <!--<Reference Include="System.IO.Compression" Condition=" '$(_TargetFrameworkVersionWithoutV)' >= '4.5' "/>
    <_SDKImplicitReference Include="System.Net.Http" Condition=" '$(_TargetFrameworkVersionWithoutV)' >= '4.5' "/>-->
    <!-- Set Pack=false on implicit references so they don't get added to NuGet packages as framework assemblies -->
    <_SDKImplicitReference Update="@(_SDKImplicitReference)" Pack="false" />
    <!-- Don't duplicate any references that are explicit in the project file.  This means that if you do want to include a framework assembly in your
         NuGet package, you can just add the Reference to your project file. -->
    <_SDKImplicitReference Remove="@(Reference)" />
    <!-- Add the implicit references to @(Reference) -->
    <Reference Include="@(_SDKImplicitReference)" />
  </ItemGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Prevent System.Core reference from being added separately (see Microsoft.NETFramework.CurrentVersion.props) -->
    <AddAdditionalExplicitAssemblyReferences>false</AddAdditionalExplicitAssemblyReferences>
  </PropertyGroup>
  <PropertyGroup Condition="'$(DisableImplicitAssetTargetFallback)' != 'true' and '$(_IsNETCoreOrNETStandard)' == 'true' and '$(_TargetFrameworkVersionWithoutV)' &gt;= '2.0'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AssetTargetFallback>$(AssetTargetFallback);net461</AssetTargetFallback>
  </PropertyGroup>
  <!-- Add conditional compilation symbols for the target framework (for example NET461, NETSTANDARD2_0, NETCOREAPP1_0) -->
  <PropertyGroup Condition=" '$(DisableImplicitFrameworkDefines)' != 'true' and '$(TargetFrameworkIdentifier)' != '.NETPortable' and '$(TargetFrameworkIdentifier)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_FrameworkIdentifierForImplicitDefine>$(TargetFrameworkIdentifier.Replace('.', '').ToUpperInvariant())</_FrameworkIdentifierForImplicitDefine>
    <VersionlessImplicitFrameworkDefine>$(_FrameworkIdentifierForImplicitDefine)</VersionlessImplicitFrameworkDefine>
    <_FrameworkIdentifierForImplicitDefine Condition=" '$(TargetFrameworkIdentifier)' == '.NETFramework'">NET</_FrameworkIdentifierForImplicitDefine>
    <_FrameworkVersionForImplicitDefine>$(TargetFrameworkVersion.TrimStart('vV'))</_FrameworkVersionForImplicitDefine>
    <_FrameworkVersionForImplicitDefine>$(_FrameworkVersionForImplicitDefine.Replace('.', '_'))</_FrameworkVersionForImplicitDefine>
    <_FrameworkVersionForImplicitDefine Condition=" '$(TargetFrameworkIdentifier)' == '.NETFramework'">$(_FrameworkVersionForImplicitDefine.Replace('_', ''))</_FrameworkVersionForImplicitDefine>
    <ImplicitFrameworkDefine>$(_FrameworkIdentifierForImplicitDefine)$(_FrameworkVersionForImplicitDefine)</ImplicitFrameworkDefine>
  </PropertyGroup>
  <!-- Handle XML documentation file settings -->
  <PropertyGroup Condition="'$(GenerateDocumentationFile)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateDocumentationFile Condition="'$(DocumentationFile)' == ''">false</GenerateDocumentationFile>
    <GenerateDocumentationFile Condition="'$(DocumentationFile)' != ''">true</GenerateDocumentationFile>
  </PropertyGroup>
  <PropertyGroup Condition="'$(GenerateDocumentationFile)' == 'true' and '$(DocumentationFile)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DocumentationFile Condition="'$(MSBuildProjectExtension)' == '.vbproj'">$(AssemblyName).xml</DocumentationFile>
    <DocumentationFile Condition="'$(MSBuildProjectExtension)' != '.vbproj'">$(IntermediateOutputPath)$(AssemblyName).xml</DocumentationFile>
  </PropertyGroup>
  <PropertyGroup Condition="'$(GenerateDocumentationFile)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DocumentationFile />
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PublishDocumentationFiles Condition="'$(PublishDocumentationFiles)' == ''">true</PublishDocumentationFiles>
    <PublishDocumentationFile Condition="'$(PublishDocumentationFile)' == '' and '$(PublishDocumentationFiles)' == 'true'">true</PublishDocumentationFile>
    <PublishReferencesDocumentationFiles Condition="'$(PublishReferencesDocumentationFiles)' == '' and '$(PublishDocumentationFiles)' == 'true'">true</PublishReferencesDocumentationFiles>
  </PropertyGroup>
  <!-- Add a project capability so that the project properties in the IDE can show the option to generate an XML documentation file without specifying the filename -->
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectCapability Include="GenerateDocumentationFile" />
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.targets
============================================================================================================================================
-->
  <PropertyGroup Condition="'$(LanguageTargets)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <LanguageTargets Condition="'$(MSBuildProjectExtension)' == '.csproj'">$(MSBuildToolsPath)\Microsoft.CSharp.targets</LanguageTargets>
    <LanguageTargets Condition="'$(MSBuildProjectExtension)' == '.vbproj'">$(MSBuildToolsPath)\Microsoft.VisualBasic.targets</LanguageTargets>
    <LanguageTargets Condition="'$(MSBuildProjectExtension)' == '.fsproj'">$(MSBuildThisFileDirectory)..\targets\Microsoft.NET.Sdk.FSharpTargetsShim.targets</LanguageTargets>
    <!-- If LanguageTargets isn't otherwise set, then just import the common targets.  This should allow the restore target to run,
         which could bring in NuGet packages that set the LanguageTargets to something else.  This means support for different
         languages could either be supplied via an SDK or via a NuGet package. -->
    <LanguageTargets Condition="'$(LanguageTargets)' == ''">$(MSBuildToolsPath)\Microsoft.Common.CurrentVersion.targets</LanguageTargets>
  </PropertyGroup>
  <!-- REMARK: Dont remove/rename, the LanguageTargets property is used by F# to hook inside the project's sdk 
               using Sdk attribute (from .NET Core Sdk 1.0.0-preview4) -->
  <!--
============================================================================================================================================
  <Import Project="$(LanguageTargets)">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft.Common.CurrentVersion.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.Common.CurrentVersion.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

This file defines the steps in the standard build process for .NET projects.  It
contains all the steps that are common among the different .NET languages, such as
Visual Basic, and Visual C#.

Copyright (C) Microsoft Corporation. All rights reserved.
***********************************************************************************************
-->
  <!--<Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="'$(MicrosoftCommonPropsHasBeenImported)' != 'true' and Exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props')" />-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ImportByWildcardBeforeMicrosoftCommonTargets Condition="'$(ImportByWildcardBeforeMicrosoftCommonTargets)' == ''">true</ImportByWildcardBeforeMicrosoftCommonTargets>
    <ImportByWildcardAfterMicrosoftCommonTargets Condition="'$(ImportByWildcardAfterMicrosoftCommonTargets)' == ''">true</ImportByWildcardAfterMicrosoftCommonTargets>
    <ImportUserLocationsByWildcardBeforeMicrosoftCommonTargets Condition="'$(ImportUserLocationsByWildcardBeforeMicrosoftCommonTargets)' == ''">true</ImportUserLocationsByWildcardBeforeMicrosoftCommonTargets>
    <ImportUserLocationsByWildcardAfterMicrosoftCommonTargets Condition="'$(ImportUserLocationsByWildcardAfterMicrosoftCommonTargets)' == ''">true</ImportUserLocationsByWildcardAfterMicrosoftCommonTargets>
  </PropertyGroup>
  <!--<Import Project="$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportBefore\*" Condition="'$(ImportUserLocationsByWildcardBeforeMicrosoftCommonTargets)' == 'true' and exists('$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportBefore')" />-->
  <!--<Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportBefore\*" Condition="'$(ImportByWildcardBeforeMicrosoftCommonTargets)' == 'true' and exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportBefore')" />-->
  <!--<Import Project="$(MSBuildProjectFullPath).user" Condition="Exists('$(MSBuildProjectFullPath).user')" />-->
  <!-- VS10 without SP1 and without VS11 will not have VisualStudioVersion set, so do that here -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <VisualStudioVersion Condition="'$(VisualStudioVersion)' == ''">10.0</VisualStudioVersion>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CustomBeforeMicrosoftCommonTargets Condition="'$(CustomBeforeMicrosoftCommonTargets)'==''">$(MSBuildExtensionsPath)\v$(MSBuildToolsVersion)\Custom.Before.Microsoft.Common.targets</CustomBeforeMicrosoftCommonTargets>
    <CustomAfterMicrosoftCommonTargets Condition="'$(CustomAfterMicrosoftCommonTargets)'==''">$(MSBuildExtensionsPath)\v$(MSBuildToolsVersion)\Custom.After.Microsoft.Common.targets</CustomAfterMicrosoftCommonTargets>
    <ReportingServicesTargets Condition="'$(ReportingServicesTargets)'==''">$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v$(VisualStudioVersion)\ReportingServices\Microsoft.ReportingServices.targets</ReportingServicesTargets>
  </PropertyGroup>
  <!--<Import Project="$(CustomBeforeMicrosoftCommonTargets)" Condition="'$(CustomBeforeMicrosoftCommonTargets)' != '' and Exists('$(CustomBeforeMicrosoftCommonTargets)')" />-->
  <!-- By default, we are creating a managed app because .NET 2.0 projects did not have this property. -->
  <PropertyGroup Condition="'$(TargetRuntime)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetRuntime>Managed</TargetRuntime>
  </PropertyGroup>
  <!-- Because .NET 2.0 apps did not set TargetFrameworkIdentifier, we need to set it for them here by default.  If
       the runtime is set to Managed, we also need to set these.  Otherwise they should be blank (for instance Javascript or
       Native apps) because they do not target a .NET Framework. -->
  <PropertyGroup Condition="'$(TargetRuntime)' == 'Managed'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkIdentifier Condition="'$(TargetFrameworkIdentifier)' == ''">.NETFramework</TargetFrameworkIdentifier>
    <TargetFrameworkVersion Condition=" '$(TargetFrameworkVersion)' == '' ">v4.0</TargetFrameworkVersion>
  </PropertyGroup>
  <!-- AvailablePlatforms is the list of platform targets available. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AvailablePlatforms Condition="'$(VisualStudioVersion)' == '10.0' or '$(VisualStudioVersion)' == ''">Any CPU,x86,x64,Itanium</AvailablePlatforms>
    <AvailablePlatforms Condition="'$(VisualStudioVersion)' != '' and '$(VisualStudioVersion)' &gt; '10.0'">Any CPU,x86,x64</AvailablePlatforms>
  </PropertyGroup>
  <!-- Import does NOT apply to .NETCore -->
  <!--<Import Project="Microsoft.NETFramework.props" Condition="'$(TargetFrameworkIdentifier)' == '.NETFramework' or '$(TargetFrameworkIdentifier)' == 'Silverlight'" />-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Yield optimization properties -->
    <YieldDuringToolExecution Condition="'$(YieldDuringToolExecution)' == ''">true</YieldDuringToolExecution>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' != '' and '$(TargetFrameworkVersion)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkMoniker Condition="'$(TargetFrameworkMoniker)' == '' and '$(TargetFrameworkProfile)' != ''">$(TargetFrameworkIdentifier),Version=$(TargetFrameworkVersion),Profile=$(TargetFrameworkProfile)</TargetFrameworkMoniker>
    <TargetFrameworkMoniker Condition="'$(TargetFrameworkMoniker)' == ''">$(TargetFrameworkIdentifier),Version=$(TargetFrameworkVersion)</TargetFrameworkMoniker>
    <!-- When working off a packaged reference assemblies, do not go to machine-global locations. This property is target-framework-specific, so it cannot be overridden in msbuild.exe.config once and for all. -->
    <FrameworkPathOverride Condition="'$(EnableFrameworkPathOverride)' != 'false' And '$(FrameworkPathOverride)' == '' And Exists('$(TargetFrameworkRootPath)$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)')">$(TargetFrameworkRootPath)$(TargetFrameworkIdentifier)\$(TargetFrameworkVersion)</FrameworkPathOverride>
    <!-- The FrameworkPathOverride is required for the inproc visual basic compiler to initialize when targeting target frameworks less than 4.0. If .net 2.0 is not installed then the property value above will not provide the location
             of mscorlib. This is also true if the build author overrides this property to some other directory which does not contain mscorlib.dll. In the case we cannot find mscorlib.dll at the correct location
             we need to find a directory which does contain mscorlib to allow the inproc compiler to initialize and give us the chance to show certain dialogs in the IDE (which only happen after initialization).-->
    <FrameworkPathOverride Condition="'$(EnableFrameworkPathOverride)' != 'false' And '$(FrameworkPathOverride)' == ''">$([Microsoft.Build.Utilities.ToolLocationHelper]::GetPathToStandardLibraries($(TargetFrameworkIdentifier), $(TargetFrameworkVersion), $(TargetFrameworkProfile), $(PlatformTarget), $(TargetFrameworkRootPath)))</FrameworkPathOverride>
    <FrameworkPathOverride Condition="'$(EnableFrameworkPathOverride)' != 'false' And !Exists('$(FrameworkPathOverride)\mscorlib.dll')">$(MSBuildFrameworkToolsPath)</FrameworkPathOverride>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetPlatformIdentifier Condition="'$(TargetPlatformIdentifier)' == ''">Windows</TargetPlatformIdentifier>
    <TargetPlatformVersion Condition="'$(TargetPlatformVersion)' == ''">7.0</TargetPlatformVersion>
    <TargetPlatformSdkPath Condition="'$(TargetPlatformSdkPath)' == '' and '$(TargetPlatformSdkRootOverride)' != ''">$(TargetPlatformSdkRootOverride)\</TargetPlatformSdkPath>
    <TargetPlatformSdkPath Condition="'$(TargetPlatformSdkPath)' == '' and '$(TargetPlatformIdentifier)' == 'Windows' and '$(OS)' == 'Windows_NT' and '$(MSBuildRuntimeType)' != 'Core'">$([MSBuild]::GetRegistryValueFromView('HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft SDKs\Windows\v$(TargetPlatformVersion)', InstallationFolder, null, RegistryView.Registry32, RegistryView.Default))</TargetPlatformSdkPath>
    <TargetPlatformSdkPath Condition="'$(TargetPlatformSdkPath)' == ''">$([Microsoft.Build.Utilities.ToolLocationHelper]::GetPlatformSDKLocation($(TargetPlatformIdentifier), $(TargetPlatformVersion)))</TargetPlatformSdkPath>
    <TargetPlatformSdkMetadataLocation Condition="'$(TargetPlatformSdkMetadataLocation)' == '' and Exists('$(TargetPlatformSdkPath)')">$(TargetPlatformSdkPath)Windows Metadata</TargetPlatformSdkMetadataLocation>
    <TargetPlatformSdkMetadataLocation Condition="Exists('$(TargetPlatformSdkPath)') and ('$(TargetPlatformSdkMetadataLocation)' == '' or !Exists('$(TargetPlatformSdkMetadataLocation)'))">$(TargetPlatformSdkPath)References\CommonConfiguration\Neutral</TargetPlatformSdkMetadataLocation>
    <TargetPlatformWinMDLocation Condition="'$(TargetPlatformWinMDLocation)' == '' and Exists('$(TargetPlatformSdkMetadataLocation)')">$(TargetPlatformSdkMetadataLocation)</TargetPlatformWinMDLocation>
    <UseOSWinMdReferences Condition="'$(UseOSWinMdReferences)' == '' and ('$(TargetPlatformWinMDLocation)' == '' and '$(TargetPlatformIdentifier)' == 'Windows' and '$(TargetPlatformVersion)' &gt; '7.0')">true</UseOSWinMdReferences>
    <TargetPlatformWinMDLocation Condition="'$(UseOsWinMdReferences)' == 'true'">$(WinDir)\System32\WinMetadata</TargetPlatformWinMDLocation>
    <TargetPlatformMoniker Condition="'$(TargetPlatformMoniker)' == ''">$(TargetPlatformIdentifier),Version=$(TargetPlatformVersion)</TargetPlatformMoniker>
    <TargetPlatformDisplayName Condition="'$(TargetPlatformDisplayName)' == ''">$([Microsoft.Build.Utilities.ToolLocationHelper]::GetPlatformSDKDisplayName($(TargetPlatformIdentifier), $(TargetPlatformVersion)))</TargetPlatformDisplayName>
  </PropertyGroup>
  <!--
    Several properties must be set in the main project file, before using this .TARGETS file.
    However, if the properties are not set, we pick some defaults.

    OutDir:
    Indicates the final output location for the project or solution. When building a solution,
    OutDir can be used to gather multiple project outputs in one location. In addition,
    OutDir is included in AssemblySearchPaths used for resolving references.

    OutputPath:
    This property is usually specified in the project file and is used to initialize OutDir.
    OutDir and OutputPath are distinguished for legacy reasons, and OutDir should be used if at all possible.

    BaseIntermediateOutputPath:
    This is the top level folder where all configuration specific intermediate output folders will be created.
    Default value is obj\

    IntermediateOutputPath:
    This is the full intermediate Output Path, and is derived from BaseIntermediateOutputPath, if none specified
    (eg. obj\debug). If this property is overridden, then setting BaseIntermediateOutputPath has no effect.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Ensure any OutputPath has a trailing slash, so it can be concatenated -->
    <OutputPath Condition="'$(OutputPath)' != '' and !HasTrailingSlash('$(OutputPath)')">$(OutputPath)\</OutputPath>
    <AssemblyName Condition=" '$(AssemblyName)'=='' ">$(MSBuildProjectName)</AssemblyName>
    <!--
        Be careful not to give OutputPath a default value in the case of an invalid Configuration/Platform.
        We use OutputPath specifically to check for invalid configurations/platforms.
        -->
    <OutputPath Condition=" '$(Platform)'=='' and '$(Configuration)'=='' and '$(OutputPath)'=='' ">bin\Debug\</OutputPath>
    <_OriginalConfiguration>$(Configuration)</_OriginalConfiguration>
    <_OriginalPlatform>$(Platform)</_OriginalPlatform>
    <Configuration Condition=" '$(Configuration)'=='' ">Debug</Configuration>
    <ConfigurationName Condition=" '$(ConfigurationName)' == '' ">$(Configuration)</ConfigurationName>
    <!-- Example, Debug -->
    <Platform Condition=" '$(Platform)'=='' ">AnyCPU</Platform>
    <OutputType Condition=" '$(TargetType)' != ''">$(TargetType)</OutputType>
    <OutputType Condition=" '$(TargetType)' == 'Container' or '$(TargetType)' == 'DocumentContainer' ">library</OutputType>
    <OutputType Condition=" '$(OutputType)' == '' ">exe</OutputType>
    <DebugSymbols Condition=" '$(ConfigurationName)' == 'Debug' and '$(DebugSymbols)' == '' and '$(DebugType)'==''">true</DebugSymbols>
    <!-- Whether or not a .pdb file is produced. -->
    <_DebugSymbolsProduced>false</_DebugSymbolsProduced>
    <_DebugSymbolsProduced Condition="'$(DebugSymbols)'=='true'">true</_DebugSymbolsProduced>
    <_DebugSymbolsProduced Condition="'$(DebugType)'=='none'">false</_DebugSymbolsProduced>
    <_DebugSymbolsProduced Condition="'$(DebugType)'=='pdbonly'">true</_DebugSymbolsProduced>
    <_DebugSymbolsProduced Condition="'$(DebugType)'=='full'">true</_DebugSymbolsProduced>
    <_DebugSymbolsProduced Condition="'$(DebugType)'=='portable'">true</_DebugSymbolsProduced>
    <_DebugSymbolsProduced Condition="'$(DebugType)'=='embedded'">false</_DebugSymbolsProduced>
    <!-- Whether or not a .xml file is produced. -->
    <_DocumentationFileProduced>true</_DocumentationFileProduced>
    <_DocumentationFileProduced Condition="'$(DocumentationFile)'==''">false</_DocumentationFileProduced>
    <!-- Whether or not a reference assembly is produced. -->
    <ProduceReferenceAssembly Condition="'$(ProduceReferenceAssembly)' == ''">false</ProduceReferenceAssembly>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(OutputPath)' == '' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        A blank OutputPath at this point means that the user passed in an invalid Configuration/Platform
        combination.  Whether this is considered an error or a warning depends on the value of
        $(SkipInvalidConfigurations).
        -->
    <_InvalidConfigurationError Condition=" '$(SkipInvalidConfigurations)' != 'true' ">true</_InvalidConfigurationError>
    <_InvalidConfigurationWarning Condition=" '$(SkipInvalidConfigurations)' == 'true' ">true</_InvalidConfigurationWarning>
  </PropertyGroup>
  <!--
    IDE Macros available from both integrated builds and from command line builds.
    The following properties are 'macros' that are available via IDE for
    pre and post build steps.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetExt Condition="'$(TargetExt)' == '' and '$(OutputType)'=='exe'">.exe</TargetExt>
    <TargetExt Condition="'$(TargetExt)' == '' and '$(OutputType)'=='winexe'">.exe</TargetExt>
    <TargetExt Condition="'$(TargetExt)' == '' and '$(OutputType)'=='appcontainerexe'">.exe</TargetExt>
    <TargetExt Condition="'$(TargetExt)' == '' and '$(OutputType)'=='library'">.dll</TargetExt>
    <TargetExt Condition="'$(TargetExt)' == '' and '$(OutputType)'=='module'">.netmodule</TargetExt>
    <TargetExt Condition="'$(TargetExt)' == '' and '$(OutputType)'=='winmdobj'">.winmdobj</TargetExt>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Required for enabling Team Build for packaging app package-generating projects -->
    <OutDirWasSpecified Condition=" '$(OutDir)'!='' and '$(OutDirWasSpecified)'=='' ">true</OutDirWasSpecified>
    <OutDir Condition=" '$(OutDir)' == '' ">$(OutputPath)</OutDir>
    <!-- Example, bin\Debug\ -->
    <!-- Ensure OutDir has a trailing slash, so it can be concatenated -->
    <OutDir Condition="'$(OutDir)' != '' and !HasTrailingSlash('$(OutDir)')">$(OutDir)\</OutDir>
    <ProjectName Condition=" '$(ProjectName)' == '' ">$(MSBuildProjectName)</ProjectName>
    <!-- Example, MyProject -->
    <!-- For projects that generate app packages or ones that want a per-project output directory, update OutDir to include the project name -->
    <OutDir Condition="'$(OutDir)' != '' and '$(OutDirWasSpecified)' == 'true' and (('$(WindowsAppContainer)' == 'true' and '$(GenerateProjectSpecificOutputFolder)' != 'false') or '$(GenerateProjectSpecificOutputFolder)' == 'true')">$(OutDir)$(ProjectName)\</OutDir>
    <TargetName Condition="'$(TargetName)' == '' and '$(OutputType)' == 'winmdobj' and '$(RootNamespace)' != ''">$(RootNamespace)</TargetName>
    <TargetName Condition=" '$(TargetName)' == '' ">$(AssemblyName)</TargetName>
    <!-- Example, MyAssembly -->
    <ProjectFileName Condition=" '$(ProjectFileName)' == '' ">$(MSBuildProjectFile)</ProjectFileName>
    <!-- Example, MyProject.csproj -->
    <ProjectExt Condition=" '$(ProjectExt)' == '' ">$(MSBuildProjectExtension)</ProjectExt>
    <!-- Example, .csproj -->
    <WinMDExpOutputWindowsMetadataFilename Condition="'$(WinMDExpOutputWindowsMetadataFilename)' == '' and '$(OutputType)' == 'winmdobj'">$(TargetName).winmd</WinMDExpOutputWindowsMetadataFilename>
    <TargetFileName Condition=" '$(TargetFileName)' == '' and '$(OutputType)' == 'winmdobj'">$(WinMDExpOutputWindowsMetadataFilename)</TargetFileName>
    <TargetFileName Condition=" '$(TargetFileName)' == '' ">$(TargetName)$(TargetExt)</TargetFileName>
    <!-- Example, MyAssembly.dll -->
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        The PublishableProject property is used when invoking the publish target on a solution that
        contains multiple projects. The property determines which projects should be published, and
        which projects should be skipped in the publish target. By default any "Windows Application"
        or "Console Application" project type is publishable. However, a project that would otherwise
        be published can be skipped by defining the PublishableProject property in the project itself.
        -->
    <_DeploymentPublishableProjectDefault Condition="'$(OutputType)'=='winexe' or '$(OutputType)'=='exe' or '$(OutputType)'=='appcontainerexe'">true</_DeploymentPublishableProjectDefault>
    <PublishableProject Condition="'$(PublishableProject)'==''">$(_DeploymentPublishableProjectDefault)</PublishableProject>
    <_DeploymentTargetApplicationManifestFileName Condition="'$(OutputType)'=='library'">Native.$(AssemblyName).manifest</_DeploymentTargetApplicationManifestFileName>
    <!-- Example, Native.MyAssembly.manifest -->
    <_DeploymentTargetApplicationManifestFileName Condition="'$(OutputType)'=='winexe'">$(TargetFileName).manifest</_DeploymentTargetApplicationManifestFileName>
    <!-- Example, MyAssembly.exe.manifest -->
    <_DeploymentTargetApplicationManifestFileName Condition="'$(OutputType)'=='exe'">$(TargetFileName).manifest</_DeploymentTargetApplicationManifestFileName>
    <!-- Example, MyAssembly.exe.manifest -->
    <_DeploymentTargetApplicationManifestFileName Condition="'$(OutputType)'=='appcontainerexe'">$(TargetFileName).manifest</_DeploymentTargetApplicationManifestFileName>
    <!-- Example, MyAssembly.exe.manifest -->
    <TargetDeployManifestFileName Condition="'$(TargetDeployManifestFileName)' == '' and '$(HostInBrowser)' != 'true'">$(AssemblyName).application</TargetDeployManifestFileName>
    <!-- Example, MyAssembly.application -->
    <TargetDeployManifestFileName Condition="'$(TargetDeployManifestFileName)' == '' and '$(HostInBrowser)' == 'true'">$(AssemblyName).xbap</TargetDeployManifestFileName>
    <!-- Example, MyAssembly.xbap -->
    <GenerateClickOnceManifests Condition="'$(OutputType)'=='winexe' or '$(OutputType)'=='exe' or '$(OutputType)'=='appcontainerexe'">$(GenerateManifests)</GenerateClickOnceManifests>
    <_DeploymentApplicationManifestIdentity Condition="'$(OutputType)'=='library'">Native.$(AssemblyName)</_DeploymentApplicationManifestIdentity>
    <_DeploymentApplicationManifestIdentity Condition="'$(OutputType)'=='winexe'">$(AssemblyName).exe</_DeploymentApplicationManifestIdentity>
    <_DeploymentApplicationManifestIdentity Condition="'$(OutputType)'=='exe'">$(AssemblyName).exe</_DeploymentApplicationManifestIdentity>
    <_DeploymentApplicationManifestIdentity Condition="'$(OutputType)'=='appcontainerexe'">$(AssemblyName).exe</_DeploymentApplicationManifestIdentity>
    <_DeploymentDeployManifestIdentity Condition="'$(HostInBrowser)' != 'true'">$(AssemblyName).application</_DeploymentDeployManifestIdentity>
    <_DeploymentDeployManifestIdentity Condition="'$(HostInBrowser)' == 'true'">$(AssemblyName).xbap</_DeploymentDeployManifestIdentity>
    <_DeploymentFileMappingExtension Condition="'$(MapFileExtensions)'=='true'">.deploy</_DeploymentFileMappingExtension>
    <_DeploymentFileMappingExtension Condition="'$(MapFileExtensions)'!='true'" />
    <_DeploymentBuiltUpdateInterval Condition="'$(UpdatePeriodically)'=='true'">$(UpdateInterval)</_DeploymentBuiltUpdateInterval>
    <_DeploymentBuiltUpdateIntervalUnits Condition="'$(UpdatePeriodically)'=='true'">$(UpdateIntervalUnits)</_DeploymentBuiltUpdateIntervalUnits>
    <_DeploymentBuiltUpdateInterval Condition="'$(UpdatePeriodically)'!='true'">0</_DeploymentBuiltUpdateInterval>
    <_DeploymentBuiltUpdateIntervalUnits Condition="'$(UpdatePeriodically)'!='true'">Days</_DeploymentBuiltUpdateIntervalUnits>
    <_DeploymentBuiltMinimumRequiredVersion Condition="'$(UpdateRequired)'=='true' and '$(Install)'=='true'">$(MinimumRequiredVersion)</_DeploymentBuiltMinimumRequiredVersion>
    <MaxTargetPath Condition="'$(MaxTargetPath)'==''">100</MaxTargetPath>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        By default, GenerateApplicationManifest puts all satellite assemblies to the manifest
        record by default by setting TargetCulture to *.
        -->
    <TargetCulture Condition="'$(TargetCulture)'==''">*</TargetCulture>
    <FallbackCulture Condition="'$(UICulture)'!='' and '$(FallbackCulture)'==''">$(UICulture)</FallbackCulture>
  </PropertyGroup>
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Not used any more-->
    <_OutputPathItem Include="$(OutDir)" />
    <_UnmanagedRegistrationCache Include="$(BaseIntermediateOutputPath)$(MSBuildProjectFile).UnmanagedRegistration.cache" />
    <_ResolveComReferenceCache Include="$(IntermediateOutputPath)$(MSBuildProjectFile).ResolveComReference.cache" />
  </ItemGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Example, c:\MyProjects\MyProject\bin\debug\ -->
    <!--
        Condition intentionally omitted on this one, because it causes problems
        when we pick up the value of an environment variable named TargetDir
        -->
    <TargetDir Condition="'$(OutDir)' != ''">$([MSBuild]::Escape($([System.IO.Path]::GetFullPath(`$([System.IO.Path]::Combine(`$(MSBuildProjectDirectory)`, `$(OutDir)`))`))))</TargetDir>
    <!-- Example, c:\MyProjects\MyProject\bin\debug\MyAssembly.dll -->
    <TargetPath Condition=" '$(TargetPath)' == '' ">$(TargetDir)$(TargetFileName)</TargetPath>
    <TargetRefPath Condition=" '$(TargetRefPath)' == '' and '$(ProduceReferenceAssembly)' == 'true' ">$([MSBuild]::NormalizePath($(TargetDir), 'ref', $(TargetFileName)))</TargetRefPath>
    <!-- Example, c:\MyProjects\MyProject\ -->
    <ProjectDir Condition=" '$(ProjectDir)' == '' ">$(MSBuildProjectDirectory)\</ProjectDir>
    <!-- Example, c:\MyProjects\MyProject\MyProject.csproj -->
    <ProjectPath Condition=" '$(ProjectPath)' == '' ">$(ProjectDir)$(ProjectFileName)</ProjectPath>
    <!-- Example, AnyCPU -->
    <PlatformName Condition=" '$(PlatformName)' == '' ">$(Platform)</PlatformName>
  </PropertyGroup>
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This is not used here but remains for backwards compatibility -->
    <AppConfigFileDestination Include="$(OutDir)$(TargetFileName).config" />
  </ItemGroup>
  <!--
    IDE Macros available only from integrated builds.
    The following properties are 'macros' that are available via IDE for
    pre and post build steps. However, they are not defined when directly building
    a project from the command line, only when building a solution.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DevEnvDir Condition="'$(DevEnvDir)'==''">*Undefined*</DevEnvDir>
    <SolutionName Condition="'$(SolutionName)'==''">*Undefined*</SolutionName>
    <!-- Example, MySolution -->
    <SolutionFileName Condition="'$(SolutionFileName)'==''">*Undefined*</SolutionFileName>
    <!-- Example, MySolution.sln -->
    <SolutionPath Condition="'$(SolutionPath)'==''">*Undefined*</SolutionPath>
    <!-- Example, f:\MySolutions\MySolution\MySolution.sln -->
    <SolutionDir Condition="'$(SolutionDir)'==''">*Undefined*</SolutionDir>
    <!-- Example, f:\MySolutions\MySolution\ -->
    <SolutionExt Condition="'$(SolutionExt)'==''">*Undefined*</SolutionExt>
    <!-- Example, .sln -->
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateBindingRedirectsOutputType Condition="'$(OutputType)'=='exe' or '$(OutputType)'=='winexe'">true</GenerateBindingRedirectsOutputType>
    <!-- It would be a breaking change to automatically turn on binding redirects for existing projects, so turn them on only when opting into a new framework. -->
    <AutoGenerateBindingRedirects Condition="'$(AutoGenerateBindingRedirects)' == '' and '$(TargetFrameworkIdentifier)' == '.NETFramework' and '$(TargetFrameworkVersion.TrimStart(vV))' &gt;= '4.7.2'">true</AutoGenerateBindingRedirects>
  </PropertyGroup>
  <PropertyGroup Condition="'$(AutoUnifyAssemblyReferences)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AutoUnifyAssemblyReferences>true</AutoUnifyAssemblyReferences>
    <AutoUnifyAssemblyReferences Condition="'$(GenerateBindingRedirectsOutputType)' == 'true' and '$(AutoGenerateBindingRedirects)' != 'true'">false</AutoUnifyAssemblyReferences>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BaseIntermediateOutputPath Condition="!HasTrailingSlash('$(BaseIntermediateOutputPath)')">$(BaseIntermediateOutputPath)\</BaseIntermediateOutputPath>
    <CleanFile Condition="'$(CleanFile)'==''">$(MSBuildProjectFile).FileListAbsolute.txt</CleanFile>
    <!-- During DesignTime Builds, skip project reference build as Design time is only queueing information.-->
    <BuildProjectReferences Condition="'$(BuildProjectReferences)' == '' and '$(DesignTimeBuild)' == 'true'">false</BuildProjectReferences>
    <!-- By default we will build (and if applicable, clean) all project references. But this can be used to disable that-->
    <BuildProjectReferences Condition="'$(BuildProjectReferences)' == ''">true</BuildProjectReferences>
    <BuildInParallel Condition="'$(BuildInParallel)' == ''">true</BuildInParallel>
    <_ResolveReferenceDependencies Condition="'$(_ResolveReferenceDependencies)' == ''">false</_ResolveReferenceDependencies>
    <_GetChildProjectCopyToOutputDirectoryItems Condition="'$(_GetChildProjectCopyToOutputDirectoryItems)' == ''">true</_GetChildProjectCopyToOutputDirectoryItems>
    <OverwriteReadOnlyFiles Condition="'$(OverwriteReadOnlyFiles)' == ''">false</OverwriteReadOnlyFiles>
    <ComReferenceNoClassMembers Condition="'$(ComReferenceNoClassMembers)' == ''">false</ComReferenceNoClassMembers>
  </PropertyGroup>
  <PropertyGroup Condition=" $(IntermediateOutputPath) == '' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IntermediateOutputPath Condition=" '$(PlatformName)' == 'AnyCPU' ">$(BaseIntermediateOutputPath)$(Configuration)\</IntermediateOutputPath>
    <IntermediateOutputPath Condition=" '$(PlatformName)' != 'AnyCPU' ">$(BaseIntermediateOutputPath)$(PlatformName)\$(Configuration)\</IntermediateOutputPath>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IntermediateOutputPath Condition="!HasTrailingSlash('$(IntermediateOutputPath)')">$(IntermediateOutputPath)\</IntermediateOutputPath>
    <_GenerateBindingRedirectsIntermediateAppConfig>$(IntermediateOutputPath)$(TargetFileName).config</_GenerateBindingRedirectsIntermediateAppConfig>
  </PropertyGroup>
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IntermediateAssembly Include="$(IntermediateOutputPath)$(TargetName)$(TargetExt)" />
    <FinalDocFile Include="@(DocFileItem->'$(OutDir)%(Filename)%(Extension)')" />
    <CopyUpToDateMarker Include="$([MSBuild]::NormalizePath('$(MSBuildProjectDirectory)', '$(IntermediateOutputPath)', '$(MSBuildProjectFile).CopyComplete'))" />
  </ItemGroup>
  <ItemGroup Condition="'$(ProduceReferenceAssembly)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IntermediateRefAssembly Include="$(IntermediateOutputPath)ref\$(TargetName)$(TargetExt)" Condition="'@(IntermediateRefAssembly)' == ''" />
    <CreateDirectory Include="@(IntermediateRefAssembly->'%(RootDir)%(Directory)')" />
    <CreateDirectory Include="$(OutDir)ref" />
  </ItemGroup>
  <ItemGroup Condition="'$(_DebugSymbolsProduced)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_DebugSymbolsIntermediatePath Include="$(IntermediateOutputPath)$(TargetName).compile.pdb" Condition="'$(OutputType)' == 'winmdobj' and '@(_DebugSymbolsIntermediatePath)' == ''" />
    <_DebugSymbolsIntermediatePath Include="$(IntermediateOutputPath)$(TargetName).pdb" Condition="'$(OutputType)' != 'winmdobj' and '@(_DebugSymbolsIntermediatePath)' == ''" />
    <_DebugSymbolsOutputPath Include="@(_DebugSymbolsIntermediatePath->'$(OutDir)%(Filename)%(Extension)')" />
  </ItemGroup>
  <PropertyGroup Condition="'$(_DebugSymbolsProduced)' == 'true' and '$(OutputType)' == 'winmdobj'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WinMDExpOutputPdb Condition="'$(WinMDExpOutputPdb)' == ''">$(IntermediateOutputPath)$(TargetName).pdb</WinMDExpOutputPdb>
    <_WinMDDebugSymbolsOutputPath>$([System.IO.Path]::Combine('$(OutDir)', $([System.IO.Path]::GetFileName('$(WinMDExpOutputPdb)'))))</_WinMDDebugSymbolsOutputPath>
  </PropertyGroup>
  <PropertyGroup Condition="'$(OutputType)' == 'winmdobj' and '$(DocumentationFile)'!=''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WinMDOutputDocumentationFile Condition="'$(WinMDOutputDocumentationFile)' == ''">$(IntermediateOutputPath)$(TargetName).xml</WinMDOutputDocumentationFile>
    <_WinMDDocFileOutputPath>$([System.IO.Path]::Combine('$(OutDir)', $([System.IO.Path]::GetFileName('$(WinMDOutputDocumentationFile)'))))</_WinMDDocFileOutputPath>
  </PropertyGroup>
  <PropertyGroup Condition="'$(WinMDExpOutputWindowsMetadataFilename)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_IntermediateWindowsMetadataPath>$(IntermediateOutputPath)$(WinMDExpOutputWindowsMetadataFilename)</_IntermediateWindowsMetadataPath>
    <_WindowsMetadataOutputPath>$(OutDir)$(WinMDExpOutputWindowsMetadataFilename)</_WindowsMetadataOutputPath>
  </PropertyGroup>
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Create an item for entry point of the ClickOnce application (Example: WindowsApplication1.exe) -->
    <_DeploymentManifestEntryPoint Include="@(IntermediateAssembly)">
      <TargetPath>$(TargetFileName)</TargetPath>
    </_DeploymentManifestEntryPoint>
    <!-- Create an item for the application icon if one exists in the project (Example: app.ico) -->
    <!-- NOTE: The item Include and the Exists function are operating relative to the PROJECT (.csproj, .vbproj etc.) directory in this case -->
    <_DeploymentManifestIconFile Include="$(ApplicationIcon)" Condition="Exists('$(ApplicationIcon)')">
      <TargetPath>$(ApplicationIcon)</TargetPath>
    </_DeploymentManifestIconFile>
    <!-- Create an item for the output application manifest (Example: WindowsApplication1.exe.manifeset) -->
    <ApplicationManifest Include="$(IntermediateOutputPath)$(_DeploymentTargetApplicationManifestFileName)">
      <TargetPath>$(_DeploymentTargetApplicationManifestFileName)</TargetPath>
    </ApplicationManifest>
    <!-- Create an item for the final application manifest (Example: WindowsApplication1.exe.manifeset)
             This item represents the final output application manifest used for project-to-project
             references and for copying to the publish output location. -->
    <_ApplicationManifestFinal Include="$(OutDir)$(_DeploymentTargetApplicationManifestFileName)">
      <TargetPath>$(_DeploymentTargetApplicationManifestFileName)</TargetPath>
    </_ApplicationManifestFinal>
    <!-- Create an item for the output deploy manifest (Example: WindowsApplication1.application) -->
    <DeployManifest Include="$(IntermediateOutputPath)$(TargetDeployManifestFileName)">
      <TargetPath>$(TargetDeployManifestFileName)</TargetPath>
    </DeployManifest>
    <!-- Create an item for the intermediate trust info file -->
    <_DeploymentIntermediateTrustInfoFile Include="$(IntermediateOutputPath)$(TargetName).TrustInfo.xml" Condition="'$(TargetZone)'!=''" />
  </ItemGroup>
  <!--
    Determine the <deploymentProvider> (_DeploymentUrl) for the ClickOnce deployment manifest.
    Prefer the UpdateUrl, falling back to InstallUrl or PublishUrl if not specified.
    If the UpdateUrl is specified then _DeploymentUrl is always set to the UpdateUrl.
    Otherwise, only set the _DeploymentUrl if it's an installed app and updates are enabled.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_DeploymentUrl Condition="'$(_DeploymentUrl)'==''">$(UpdateUrl)</_DeploymentUrl>
    <_DeploymentUrl Condition="'$(_DeploymentUrl)'==''">$(InstallUrl)</_DeploymentUrl>
    <_DeploymentUrl Condition="'$(_DeploymentUrl)'==''">$(PublishUrl)</_DeploymentUrl>
    <_DeploymentUrl Condition="!('$(UpdateUrl)'=='') and '$(Install)'=='false'" />
    <_DeploymentUrl Condition="'$(_DeploymentUrl)'!=''">$(_DeploymentUrl)$(TargetDeployManifestFileName)</_DeploymentUrl>
    <!--
        Need to explicitly blank out the _DeploymentUrl when it's not used. Otherwise an
        inappropriate value may be used. For example a local path from the PublishUrl
        is something we never want to see in the manifest because it means you could
        only install the app from that machine.
        -->
    <_DeploymentUrl Condition="'$(UpdateUrl)'=='' and !('$(Install)'=='true' and '$(UpdateEnabled)'=='true')" />
    <_DeploymentUrl Condition="'$(ExcludeDeploymentUrl)'=='true'" />
  </PropertyGroup>
  <!-- Determine the URLs for the bootstrapper. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_DeploymentApplicationUrl Condition="'$(IsWebBootstrapper)'=='true'">$(InstallUrl)</_DeploymentApplicationUrl>
    <_DeploymentApplicationUrl Condition="'$(IsWebBootstrapper)'=='true' and '$(InstallUrl)'==''">$(PublishUrl)</_DeploymentApplicationUrl>
    <_DeploymentComponentsUrl Condition="'$(BootstrapperComponentsLocation)'=='Absolute'">$(BootstrapperComponentsUrl)</_DeploymentComponentsUrl>
  </PropertyGroup>
  <!-- Output location for publish target. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PublishDir Condition="'$(PublishDir)' != '' and !HasTrailingSlash('$(PublishDir)')">$(PublishDir)\</PublishDir>
    <PublishDir Condition="'$(PublishDir)'==''">$(OutputPath)app.publish\</PublishDir>
  </PropertyGroup>
  <!--
    ProcessorArchitecture is the target processor architecture.
    -->
  <PropertyGroup Condition="'$(ProcessorArchitecture)'==''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        If ProcessorArchitecture is not set, set it to PlatformTarget
        Note: if $(PlatformTarget) is also blank resolve assembly reference defaults to msil which is the
        desired behavior in this case
        -->
    <ProcessorArchitecture>$(PlatformTarget)</ProcessorArchitecture>
    <!--
        If Processor architecture is not set and PlatformTarget is a known target translate the
        PlatformTarget into something ResolveAssemblyReference knows about
        -->
    <ProcessorArchitecture Condition=" '$(PlatformTarget)' == 'AnyCpu' ">msil</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(PlatformTarget)' == 'x64' ">amd64</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(PlatformTarget)' == 'Itanium' ">ia64</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(PlatformTarget)' == 'x86' ">x86</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(PlatformTarget)' == 'ARM' ">arm</ProcessorArchitecture>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ConsiderPlatformAsProcessorArchitecture Condition="'$(ConsiderPlatformAsProcessorArchitecture)' == ''">true</ConsiderPlatformAsProcessorArchitecture>
  </PropertyGroup>
  <PropertyGroup Condition="'$(ProcessorArchitecture)' == '' and '$(ConsiderPlatformAsProcessorArchitecture)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- We need to do this here because if we were to just compare against platform visual would parse them out as available platforms which may not be the case -->
    <ProcessorArchitectureAsPlatform>$(Platform)</ProcessorArchitectureAsPlatform>
    <ProcessorArchitecture Condition=" '$(ProcessorArchitectureAsPlatform)' == 'AnyCpu' or '$(ProcessorArchitectureAsPlatform)' == 'Any Cpu'">msil</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(ProcessorArchitectureAsPlatform)' == 'x64' or '$(ProcessorArchitectureAsPlatform)' == 'amd64'">amd64</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(ProcessorArchitectureAsPlatform)' == 'Itanium' ">ia64</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(ProcessorArchitectureAsPlatform)' == 'x86' or '$(ProcessorArchitectureAsPlatform)' == 'win32'">x86</ProcessorArchitecture>
    <ProcessorArchitecture Condition=" '$(ProcessorArchitectureAsPlatform)' == 'ARM' ">arm</ProcessorArchitecture>
    <!--For compatibility with the 4.0 behavior, if not set above, default to the environment. To override this, set ProcessorArchitecture explicitly. We also need to disable the warning since we do not know if what the environment is set to is correct-->
    <ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch Condition="'$(ProcessorArchitecture)'==''">None</ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch>
    <ProcessorArchitecture Condition="'$(ProcessorArchitecture)'==''">$(PROCESSOR_ARCHITECTURE)</ProcessorArchitecture>
  </PropertyGroup>
  <!-- Sensible defaults for the most-commonly-desired MSBuildRuntime and MSBuildArchitecture values -->
  <PropertyGroup Condition="'$(DisableOutOfProcTaskHost)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetFrameworkAsMSBuildRuntime Condition="'$(TargetFrameworkVersion)' == 'v2.0' or '$(TargetFrameworkVersion)' == 'v3.0' or '$(TargetFrameworkVersion)' == 'v3.5'">CLR2</TargetFrameworkAsMSBuildRuntime>
    <TargetFrameworkAsMSBuildRuntime Condition="'$(TargetFrameworkVersion)' == 'v4.0' or '$(TargetFrameworkVersion)' == 'v4.5'">CLR4</TargetFrameworkAsMSBuildRuntime>
    <TargetFrameworkAsMSBuildRuntime Condition="'$(TargetFrameworkAsMSBuildRuntime)' == ''">CurrentRuntime</TargetFrameworkAsMSBuildRuntime>
    <PlatformTargetAsMSBuildArchitectureExplicitlySet Condition="'$(PlatformTargetAsMSBuildArchitecture)' != ''">true</PlatformTargetAsMSBuildArchitectureExplicitlySet>
    <PlatformTargetAsMSBuildArchitectureExplicitlySet Condition="'$(PlatformTargetAsMSBuildArchitecture)' == ''">false</PlatformTargetAsMSBuildArchitectureExplicitlySet>
    <PlatformTargetAsMSBuildArchitecture Condition="'$(PlatformTarget)' == 'x86' or ('$(PlatformTarget)' == 'x64' and '$(MSBuildExtensionsPath64)' != '')">$(PlatformTarget)</PlatformTargetAsMSBuildArchitecture>
    <PlatformTargetAsMSBuildArchitecture Condition="'$(PlatformTarget)' == 'arm'">x86</PlatformTargetAsMSBuildArchitecture>
    <PlatformTargetAsMSBuildArchitecture Condition="('$(PlatformTarget)' == 'ia64' and '$(MSBuildExtensionsPath64)' != '')">x64</PlatformTargetAsMSBuildArchitecture>
    <PlatformTargetAsMSBuildArchitecture Condition="'$(PlatformTargetAsMSBuildArchitecture)' == ''">CurrentArchitecture</PlatformTargetAsMSBuildArchitecture>
  </PropertyGroup>
  <!-- Flavor is the project flavor. For example, Client, Smart Devices, SQL Server, etc. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectFlavor Condition="'$(ProjectFlavor)'==''">Client</ProjectFlavor>
  </PropertyGroup>
  <!--
    The default for compilers is to not delay-sign. If $(DelaySign) is false, let the compiler
    use its default rather than forcing a no-delay-sign flag to be passed in. This is so that
    attributes in the source code can override this decision.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DelaySign Condition="'$(SignAssembly)' != 'true'">false</DelaySign>
    <DelaySign Condition="'$(DelaySign)'!='true'" />
  </PropertyGroup>
  <!-- These properties control web reference proxy generation. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WebReference_EnableProperties Condition=" '$(WebReference_EnableProperties)' == '' ">true</WebReference_EnableProperties>
    <WebReference_EnableSQLTypes Condition=" '$(WebReference_EnableSQLTypes)' == '' ">true</WebReference_EnableSQLTypes>
    <WebReference_EnableLegacyEventingModel Condition=" '$(WebReference_EnableLegacyEventingModel)' == '' ">false</WebReference_EnableLegacyEventingModel>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildProjectFullPath);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <MSBuildAllProjects Condition="Exists('$(MSBuildProjectFullPath).user')">$(MSBuildAllProjects);$(MSBuildProjectFullPath).user</MSBuildAllProjects>
  </PropertyGroup>
  <!--
    These parameters control where to look in the registry for directories to search for
    assemblies in the assembly resolution tasks.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AssemblyFoldersSuffix Condition=" '$(AssemblyFoldersSuffix)' == '' ">AssemblyFoldersEx</AssemblyFoldersSuffix>
    <FrameworkRegistryBase Condition=" '$(FrameworkRegistryBase)' == '' ">Software\Microsoft\$(TargetFrameworkIdentifier)</FrameworkRegistryBase>
    <TargetPlatformRegistryBase Condition="'$(TargetPlatformRegistryBase)' == ''">Software\Microsoft\Microsoft SDKs\$(TargetPlatformIdentifier)</TargetPlatformRegistryBase>
    <AssemblyFoldersConfigFile Condition="'$(AssemblyFoldersConfigFile)' == ''">$(MSBuildToolsPath32)\AssemblyFolders.config</AssemblyFoldersConfigFile>
    <AssemblyFoldersConfigFileSearchPath Condition="Exists('$(AssemblyFoldersConfigFile)')">{AssemblyFoldersFromConfig:$(AssemblyFoldersConfigFile),$(TargetFrameworkVersion)};</AssemblyFoldersConfigFileSearchPath>
    <!--
        The SearchPaths property is set to find assemblies in the following order:

            (1) Files from current project - indicated by {CandidateAssemblyFiles}
            (2) $(ReferencePath) - the reference path property, which comes from the .USER file.
            (3) The hintpath from the referenced item itself, indicated by {HintPathFromItem}.
            (4) The directory of MSBuild's "target" runtime from GetFrameworkPath.
                The "target" runtime folder is the folder of the runtime that MSBuild is a part of.
            (5) Registered assembly folders, indicated by {Registry:*,*,*}
            (6) Assembly folders from AssemblyFolders.config file (provided by Visual Studio Dev15+).
            (7) Legacy registered assembly folders, indicated by {AssemblyFolders}
            (8) Resolve to the GAC.
            (9) Treat the reference's Include as if it were a real file name.
            (10) Look in the application's output folder (like bin\debug)
        -->
    <AssemblySearchPaths Condition=" '$(AssemblySearchPaths)' == ''">
      {CandidateAssemblyFiles};
      $(ReferencePath);
      {HintPathFromItem};
      {TargetFrameworkDirectory};
      $(AssemblyFoldersConfigFileSearchPath)
      {Registry:$(FrameworkRegistryBase),$(TargetFrameworkVersion),$(AssemblyFoldersSuffix)$(AssemblyFoldersExConditions)};
      {AssemblyFolders};
      {GAC};
      {RawFileName};
      $(OutDir)
    </AssemblySearchPaths>
    <!--
        These are the extensions that assembly reference resolution will consider for resolution.
        Add new extensions here if you want to add new file types to consider (for example, .metadata_dll).
        Put the most likely extensions first for reference resolution speed.
        -->
    <AllowedReferenceAssemblyFileExtensions Condition=" '$(AllowedReferenceAssemblyFileExtensions)' == '' ">
      .winmd;
      .dll;
      .exe
    </AllowedReferenceAssemblyFileExtensions>
    <!--
        These are the extensions that reference resolution will consider when looking for files related
        to resolved references.  Add new extensions here if you want to add new file types to consider.
        -->
    <AllowedReferenceRelatedFileExtensions Condition=" '$(AllowedReferenceRelatedFileExtensions)' == '' ">
      .pdb;
      .xml;
      .pri;
      .dll.config;
      .exe.config
    </AllowedReferenceRelatedFileExtensions>
    <!--
        These names are used when determining which TargetFramework subset to use. If the any of the FullReferenceAssemblyNames
        are seen in the list of client subsets, RAR will assume that no client subset is being used. The list is semicolon seperated
        For example :   Full;Complete;AllThere
        -->
    <FullReferenceAssemblyNames Condition="'$(FullReferenceAssemblyNames)' == ''">Full</FullReferenceAssemblyNames>
  </PropertyGroup>
  <!-- ContinueOnError takes 3 values:  WarnAndContinue (true), ErrorAndStop (false), and ErrorAndContinue.
         Default to ErrorAndStop, since that matches the behaviour in previous versions, and what users
         typically expect -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ContinueOnError Condition="'$(ContinueOnError)' == ''">false</ContinueOnError>
  </PropertyGroup>
  <!-- Common Project System support -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CommonXamlResourcesDirectory Condition=" '$(CommonXamlResourcesDirectory)' == '' ">$(MSBuildThisFileDirectory)$(LangName)\</CommonXamlResourcesDirectory>
  </PropertyGroup>
  <!-- We need to fallback to en-US in case the xaml rules are not localized (possibly happen on community languages).  -->
  <PropertyGroup Condition="!Exists('$(CommonXamlResourcesDirectory)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CommonXamlResourcesDirectory>$(MSBuildThisFileDirectory)en-US\</CommonXamlResourcesDirectory>
  </PropertyGroup>
  <ItemGroup Condition=" '$(DefineCommonItemSchemas)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)ProjectItemsSchema.xaml" />
    <PropertyPageSchema Include="                         $(CommonXamlResourcesDirectory)General.xaml;                         $(CommonXamlResourcesDirectory)Debugger_General.xaml">
      <Context>Project</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)General.BrowseObject.xaml">
      <Context>BrowseObject</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)General_File.xaml">
      <Context>File</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)SCC.xaml">
      <Context>Invisible</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="                         $(CommonXamlResourcesDirectory)Folder.xaml;                         $(CommonXamlResourcesDirectory)None.xaml;                         $(CommonXamlResourcesDirectory)Content.xaml;                         $(CommonXamlResourcesDirectory)EmbeddedResource.xaml;                         ">
      <Context>File;BrowseObject</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)SpecialFolder.xaml;">
      <Context>File;ProjectSubscriptionService</Context>
    </PropertyPageSchema>
  </ItemGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DefineCommonReferenceSchemas Condition=" '$(DefineCommonReferenceSchemas)' == '' ">$(DefineCommonItemSchemas)</DefineCommonReferenceSchemas>
  </PropertyGroup>
  <ItemGroup Condition=" '$(DefineCommonReferenceSchemas)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Assembly references -->
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)assemblyreference.xaml">
      <Context>;BrowseObject</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)ResolvedAssemblyReference.xaml">
      <Context>ProjectSubscriptionService;BrowseObject</Context>
    </PropertyPageSchema>
    <!-- COM references -->
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)COMReference.xaml">
      <Context>;BrowseObject</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)ResolvedCOMReference.xaml">
      <Context>ProjectSubscriptionService;BrowseObject</Context>
    </PropertyPageSchema>
    <!-- Project references -->
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)ProjectReference.xaml">
      <Context>;BrowseObject</Context>
    </PropertyPageSchema>
    <PropertyPageSchema Include="$(CommonXamlResourcesDirectory)ResolvedProjectReference.xaml">
      <Context>ProjectSubscriptionService;BrowseObject</Context>
    </PropertyPageSchema>
  </ItemGroup>
  <ItemGroup Condition=" '$(DefineCommonCapabilities)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectCapability Include="                           AssemblyReferences;                           COMReferences;                           ProjectReferences;                           SharedProjectReferences;                           OutputGroups;                           AllTargetOutputGroups;                           VisualStudioWellKnownOutputGroups;                           SingleFileGenerators;                           DeclaredSourceItems;                           UserSourceItems;                            " />
    <ProjectCapability Condition=" '$(TargetPlatformIdentifier)' == 'Windows' and '$(TargetPlatformVersion)' &lt; 8.0 " Include="BuildWindowsDesktopTarget" />
  </ItemGroup>
  <ItemDefinitionGroup Condition=" '$(DefineExplicitDefaults)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <None>
      <CopyToOutputDirectory>Never</CopyToOutputDirectory>
    </None>
    <Content>
      <CopyToOutputDirectory>Never</CopyToOutputDirectory>
    </Content>
    <Compile>
      <CopyToOutputDirectory>Never</CopyToOutputDirectory>
    </Compile>
    <EmbeddedResource>
      <CopyToOutputDirectory>Never</CopyToOutputDirectory>
    </EmbeddedResource>
  </ItemDefinitionGroup>
  <!--
    Target that allows targets consuming source control confirmation to establish a dependency on targets producing this information.

    Any target that reads SourceRevisionId, PrivateRepositoryUrl, SourceRoot, and other source control properties and items 
    should depend on this target and be conditioned on '$(SourceControlInformationFeatureSupported)' == 'true'.

    SourceRevisionId property uniquely identifies the source control revision of the repository the project belongs to.
    For Git repositories this id is a commit hash, for TFVC repositories it's the changeset number, etc.

    PrivateRepositoryUrl property stores the URL of the repository supplied by the CI server or retrieved from source control manager.
    Targets consuming this property shall not publish its value implicitly as it might inadvertently reveal an internal URL.
    Instead, they shall only do so if the project sets PublishRepositoryUrl property to true. For example, the NuGet Pack target
    may include the repository URL in the nuspec file generated for NuGet package produced by the project if PublishRepositoryUrl is true.

    SourceRoot item group lists all source roots that the project source files reside under and their mapping to source control server URLs,
    if available. This includes both source files under source control as well as source files in source packages. SourceRoot items are 
    used by compilers to determine path map in deterministic build and by SourceLink provider, which maps local paths to URLs of source files
    stored on the source control server.

    Source control information provider that sets these properties and items shall execute before this target (by including 
    InitializeSourceControlInformation in its BeforeTargets) and set source control properties and items that haven't been initialized yet.
  -->
  <Target Name="InitializeSourceControlInformation" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SourceControlInformationFeatureSupported>true</SourceControlInformationFeatureSupported>
  </PropertyGroup>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                Build Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        _CheckForInvalidConfigurationAndPlatform

    This target checks for errors in statically defined properties.  By setting BeforeTargets, we try
    to ensure that the target runs before any build related targets.
    If your target requires this check and is running as a BeforeTargets of one of the first targets
    of $(BuildDependsOn), $(RebuildDependsOn), or $(CleanDependsOn) you will need to set your DependsOn
    to this target.
    ============================================================
    -->
  <Target Name="_CheckForInvalidConfigurationAndPlatform" BeforeTargets="$(BuildDependsOn);Build;$(RebuildDependsOn);Rebuild;$(CleanDependsOn);Clean" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_InvalidConfigurationMessageText>The OutputPath property is not set for project '$(MSBuildProjectFile)'.  Please check to make sure that you have specified a valid combination of Configuration and Platform for this project.  Configuration='$(_OriginalConfiguration)'  Platform='$(_OriginalPlatform)'.</_InvalidConfigurationMessageText>
      <_InvalidConfigurationMessageText Condition="'$(BuildingInsideVisualStudio)' == 'true'">$(_InvalidConfigurationMessageText)  This error may also appear if some other project is trying to follow a project-to-project reference to this project, this project has been unloaded or is not included in the solution, and the referencing project does not build using the same or an equivalent Configuration or Platform.</_InvalidConfigurationMessageText>
      <_InvalidConfigurationMessageText Condition="'$(BuildingInsideVisualStudio)' != 'true'">$(_InvalidConfigurationMessageText)  You may be seeing this message because you are trying to build a project without a solution file, and have specified a non-default Configuration or Platform that doesn't exist for this project.</_InvalidConfigurationMessageText>
    </PropertyGroup>
    <Error Condition=" '$(_InvalidConfigurationError)' == 'true' " Text="$(_InvalidConfigurationMessageText)" />
    <Warning Condition=" '$(_InvalidConfigurationWarning)' == 'true' " Text="$(_InvalidConfigurationMessageText)" />
    <Message Condition="'$(DesignTimeBuild)' != 'true'" Text="Configuration=$(Configuration)" Importance="Low" />
    <Message Condition="'$(DesignTimeBuild)' != 'true'" Text="Platform=$(Platform)" Importance="Low" />
    <!-- Although we try to ensure a trailing slash, it's possible to circumvent this if the property is set on the command line -->
    <Error Condition="'$(OutDir)' != '' and !HasTrailingSlash('$(OutDir)')" Text="The OutDir property must end with a trailing slash." />
    <Error Condition="'$(BaseIntermediateOutputPath)' != '' and !HasTrailingSlash('$(BaseIntermediateOutputPath)')" Text="The BaseIntermediateOutputPath must end with a trailing slash." />
    <Error Condition="'$(IntermediateOutputPath)' != '' and !HasTrailingSlash('$(IntermediateOutputPath)')" Text="The IntermediateOutputPath must end with a trailing slash." />
    <!-- Also update the value of PlatformTargetAsMSBuildArchitecture per the value of Prefer32Bit.  We are doing
         this here because Prefer32Bit may be set anywhere in the targets, so we can't depend on it having the
         correct value when we're trying to figure out PlatformTargetAsMSBuildArchitecture -->
    <PropertyGroup Condition="'$(Prefer32Bit)' == 'true' and ('$(PlatformTarget)' == 'AnyCPU' or '$(PlatformTarget)' == '') and '$(PlatformTargetAsMSBuildArchitectureExplicitlySet)' != 'true'">
      <PlatformTargetAsMSBuildArchitecture>x86</PlatformTargetAsMSBuildArchitecture>
    </PropertyGroup>
    <!--
      Log an error if the user set MSBuildProjectExtensionsPath in the body of a project. In an SDK style project
      if you set a value in the body, the value is not used by the top implicit import but is used by the bottom.
      This can lead to confusing behavior and builds can fail for obscure reasons.
    -->
    <Error Condition=" '$(_InitialMSBuildProjectExtensionsPath)' != '' And '$(MSBuildProjectExtensionsPath)' != '$(_InitialMSBuildProjectExtensionsPath)' " Code="MSB3540" Text="The value of the property &quot;MSBuildProjectExtensionsPath&quot; was modified after it was used by MSBuild which can lead to unexpected build results.  To set this property, you must do so before Microsoft.Common.props is imported, for example by using Directory.Build.props.  For more information, please visit https://go.microsoft.com/fwlink/?linkid=869650" />
    <!--
      Log a warning if:
        1. $(EnableBaseIntermediateOutputPathMismatchWarning) is 'true'
        2. $(BaseIntermediateOutputPath) was set in the body of a project after its default value was set in Microsoft.Common.props
        3. $(BaseIntermediateOutputPath) is not the same as $(MSBuildProjectExtensionsPath)

      Similar to the error above, there are cases when users set $(BaseIntermediateOutputPath) in the body of their project and things build but only by coincidence.
      MSBuild does not know if $(BaseIntermediateOutputPath) changing would cause problems so tools like NuGet must set $(EnableBaseIntermediateOutputPathMismatchWarning)
      to 'true'.
    -->
    <Warning Condition=" '$(EnableBaseIntermediateOutputPathMismatchWarning)' == 'true' And '$(_InitialBaseIntermediateOutputPath)' != '$(BaseIntermediateOutputPath)' And '$(BaseIntermediateOutputPath)' != '$(MSBuildProjectExtensionsPath)' " Code="MSB3539" Text="The value of the property &quot;BaseIntermediateOutputPath&quot; was modified after it was used by MSBuild which can lead to unexpected build results. Tools such as NuGet will write outputs to the path specified by the &quot;MSBuildProjectExtensionsPath&quot; instead. To set this property, you must do so before Microsoft.Common.props is imported, for example by using Directory.Build.props.  For more information, please visit https://go.microsoft.com/fwlink/?linkid=869650" />
  </Target>
  <!--
    ============================================================
                                        Build

    The main build entry point.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuildDependsOn>
      BeforeBuild;
      CoreBuild;
      AfterBuild
    </BuildDependsOn>
  </PropertyGroup>
  <Target Name="Build" Condition=" '$(_InvalidConfigurationWarning)' != 'true' " DependsOnTargets="$(BuildDependsOn)" Returns="@(TargetPathWithTargetPlatformMoniker)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BeforeBuild

    Redefine this target in your project in order to run tasks just before Build
    ============================================================
    -->
  <Target Name="BeforeBuild" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterBuild

    Redefine this target in your project in order to run tasks just after Build
    ============================================================
    -->
  <Target Name="AfterBuild" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        CoreBuild

    The core build step calls each of the build targets.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CoreBuildDependsOn>
      BuildOnlySettings;
      PrepareForBuild;
      PreBuildEvent;
      ResolveReferences;
      PrepareResources;
      ResolveKeySource;
      Compile;
      ExportWindowsMDFile;
      UnmanagedUnregistration;
      GenerateSerializationAssemblies;
      CreateSatelliteAssemblies;
      GenerateManifests;
      GetTargetPath;
      PrepareForRun;
      UnmanagedRegistration;
      IncrementalClean;
      PostBuildEvent
    </CoreBuildDependsOn>
  </PropertyGroup>
  <Target Name="CoreBuild" DependsOnTargets="$(CoreBuildDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <OnError ExecuteTargets="_TimeStampAfterCompile;PostBuildEvent" Condition="'$(RunPostBuildEvent)'=='Always' or '$(RunPostBuildEvent)'=='OnOutputUpdated'" />
    <OnError ExecuteTargets="_CleanRecordFileWrites" />
  </Target>
  <!--
    ============================================================
                                        Rebuild

    Delete all intermediate and final build outputs, and then build the project from scratch.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_ProjectDefaultTargets Condition="'$(MSBuildProjectDefaultTargets)' != ''">$(MSBuildProjectDefaultTargets)</_ProjectDefaultTargets>
    <_ProjectDefaultTargets Condition="'$(MSBuildProjectDefaultTargets)' == ''">Build</_ProjectDefaultTargets>
    <RebuildDependsOn>
      BeforeRebuild;
      Clean;
      $(_ProjectDefaultTargets);
      AfterRebuild;
    </RebuildDependsOn>
    <RebuildDependsOn Condition=" '$(MSBuildProjectDefaultTargets)' == 'Rebuild' ">
      BeforeRebuild;
      Clean;
      Build;
      AfterRebuild;
    </RebuildDependsOn>
  </PropertyGroup>
  <Target Name="Rebuild" Condition=" '$(_InvalidConfigurationWarning)' != 'true' " DependsOnTargets="$(RebuildDependsOn)" Returns="$(TargetPath)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BeforeRebuild

    Redefine this target in your project in order to run tasks just before Rebuild
    ============================================================
    -->
  <Target Name="BeforeRebuild" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterRebuild

    Redefine this target in your project in order to run tasks just after Rebuild
    ============================================================
    -->
  <Target Name="AfterRebuild" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BuildGenerateSources

    Redefine this target in your project in order to run tasks for BuildGenerateSources

    Set BuildPassReferences to enable P2P builds
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuildGenerateSourcesAction>Build</BuildGenerateSourcesAction>
  </PropertyGroup>
  <Target Name="BuildGenerateSources" DependsOnTargets="BuildGenerateSourcesTraverse;$(BuildGenerateSourcesAction)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="BuildGenerateSourcesTraverse" DependsOnTargets="PrepareProjectReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="BuildGenerateSources" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework);" Condition="'$(BuildPassReferences)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and '@(_MSBuildProjectReferenceExistent)' != '' and '%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true'" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)" />
  </Target>
  <!--
    ============================================================
                                        BuildCompile

    Redefine this target in your project in order to run tasks for BuildCompile
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuildCompileAction>Build</BuildCompileAction>
  </PropertyGroup>
  <Target Name="BuildCompile" DependsOnTargets="BuildCompileTraverse;$(BuildCompileAction)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="BuildCompileTraverse" DependsOnTargets="PrepareProjectReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="BuildCompile" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'$(BuildPassReferences)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and '@(_MSBuildProjectReferenceExistent)' != ''  and '%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true'" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)" />
  </Target>
  <!--
    ============================================================
                                        BuildLink

    Redefine this target in your project in order to run tasks for BuildLink
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuildLinkAction>Build</BuildLinkAction>
  </PropertyGroup>
  <Target Name="BuildLink" DependsOnTargets="BuildLinkTraverse;$(BuildLinkAction)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="BuildLinkTraverse" DependsOnTargets="PrepareProjectReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="BuildLink" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'$(BuildPassReferences)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and '@(_MSBuildProjectReferenceExistent)' != ''  and '%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true'" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)" />
  </Target>
  <!--
    ============================================================
                                        CopyRunEnvironmentFiles

    Copy environment files necessary to run the user's app to the final directory.
    This is a public target that can be invoked by an IDE.

    This may be used by an IDE to make the app.config file available for running
    the target app.
    ============================================================
    -->
  <Target Name="CopyRunEnvironmentFiles" DependsOnTargets="PrepareForBuild;SetWin32ManifestProperties;_CopyAppConfigFile;_CleanRecordFileWrites" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        Run

    Run the final build output if it is a .EXE
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RunDependsOn />
  </PropertyGroup>
  <Target Name="Run" DependsOnTargets="$(RunDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Error Text="Cannot run '$(TargetPath)' because project output type is not '.exe'" Condition="'$(TargetExt)'!='.exe'" />
    <Exec Command="$(TargetPath) $(StartArguments)" WorkingDirectory="$(OutDir)" Condition=" '$(StartWorkingDirectory)' == '' " />
    <Exec Command="$(TargetPath) $(StartArguments)" WorkingDirectory="$(StartWorkingDirectory)" Condition=" '$(StartWorkingDirectory)' != '' " />
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                BuildOnlySettings Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        BuildOnlySettings

    This target is called only when doing a real build.  It is specifically not called during project load.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuildingProject>false</BuildingProject>
  </PropertyGroup>
  <Target Name="BuildOnlySettings" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <BuildingProject>true</BuildingProject>
    </PropertyGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                PrepareForBuild Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        PrepareForBuild

    Prepare the prerequisites for building.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PrepareForBuildDependsOn>GetFrameworkPaths;GetReferenceAssemblyPaths;AssignLinkMetadata</PrepareForBuildDependsOn>
  </PropertyGroup>
  <Target Name="PrepareForBuild" DependsOnTargets="$(PrepareForBuildDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <AppConfigWithTargetPath Include="$(AppConfig)" Condition="'$(AppConfig)'!=''">
        <TargetPath>$(TargetFileName).config</TargetPath>
      </AppConfigWithTargetPath>
    </ItemGroup>
    <FindAppConfigFile PrimaryList="@(None)" SecondaryList="@(Content)" TargetPath="$(TargetFileName).config" Condition="'$(AppConfig)'==''">
      <Output TaskParameter="AppConfigFile" ItemName="AppConfigWithTargetPath" />
      <Output TaskParameter="AppConfigFile" PropertyName="AppConfig" />
    </FindAppConfigFile>
    <!-- Create the directories for intermediate and final build products, and any other arbitrary directories. -->
    <!-- We are going to continue on error here so that if the tree is read only we will still get intellisense -->
    <MakeDir Directories="$(OutDir);$(IntermediateOutputPath);@(DocFileItem->'%(RelativeDir)');@(CreateDirectory)" ContinueOnError="True" />
  </Target>
  <!--
    ============================================================
                                        GetFrameworkPaths

    Get the paths for the .NET Framework installation directory

    These paths are not used directly by this .targets file but are available for pre and
    post build steps.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Framework40Dir>@(_TargetFramework40DirectoryItem)</Framework40Dir>
    <Framework35Dir>@(_TargetFramework35DirectoryItem)</Framework35Dir>
    <Framework30Dir>@(_TargetFramework30DirectoryItem)</Framework30Dir>
    <Framework20Dir>@(_TargetFramework20DirectoryItem)</Framework20Dir>
    <!-- Note we need to make the 4.0 FrameworkDir point to the 2.0 location by default since we shipped msbuild 4.0 that way and to change it would be a breaking change.-->
    <FrameworkDir Condition="'$(FrameworkDir)' == '' and ('$(TargetFrameworkVersion)' == 'v2.0' or '$(TargetFrameworkVersion)' == 'v3.5' or '$(TargetFrameworkVersion)' == 'v4.0')">@(_TargetFramework20DirectoryItem)</FrameworkDir>
    <FrameworkDir Condition="'$(FrameworkDir)' == ''">@(_TargetFramework40DirectoryItem)</FrameworkDir>
    <TargetedFrameworkDir Condition="'$(TargetedFrameworkDir)' == ''">@(_TargetedFrameworkDirectoryItem)</TargetedFrameworkDir>
    <FrameworkSDKDir Condition="'$(FrameworkSDKDir)' == ''">@(_TargetFrameworkSDKDirectoryItem)</FrameworkSDKDir>
    <GetFrameworkPathsDependsOn />
  </PropertyGroup>
  <!-- This is a generally overriden target, for example it is overriden in the Microsoft.NETFramework.targets file -->
  <Target Name="GetFrameworkPaths" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        GetReferenceAssemblyPaths

    Get the paths for the Reference Assemblies for the known versions of the
    .NET Framework.

    These paths are used by the build process in order to resolve the correct
    assemblies from the various directories, and to support multi-targeting
    ============================================================
    -->
  <Target Name="GetReferenceAssemblyPaths" DependsOnTargets="$(GetReferenceAssemblyPathsDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- if TargetFrameworkDirectory doesn't have a custom value, clear it out; that way we can get reference paths and target framework directories all in the right order -->
    <PropertyGroup>
      <TargetFrameworkDirectory Condition="'@(_CombinedTargetFrameworkDirectoriesItem)' == '$(TargetFrameworkDirectory)'" />
    </PropertyGroup>
    <!-- By default if there is no root path set then the task will assume it is Program Files\Reference Assemblies\Microsoft\Framework-->
    <GetReferenceAssemblyPaths Condition="'$(TargetFrameworkMoniker)' != '' and ('$(_TargetFrameworkDirectories)' == '' or '$(_FullFrameworkReferenceAssemblyPaths)' == '')" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" RootPath="$(TargetFrameworkRootPath)" BypassFrameworkInstallChecks="$(BypassFrameworkInstallChecks)">
      <Output TaskParameter="ReferenceAssemblyPaths" PropertyName="_TargetFrameworkDirectories" />
      <Output TaskParameter="FullFrameworkReferenceAssemblyPaths" PropertyName="_FullFrameworkReferenceAssemblyPaths" />
      <Output TaskParameter="TargetFrameworkMonikerDisplayName" PropertyName="TargetFrameworkMonikerDisplayName" Condition="'$(TargetFrameworkMonikerDisplayName)' == ''" />
    </GetReferenceAssemblyPaths>
    <PropertyGroup>
      <TargetFrameworkDirectory>$(_TargetFrameworkDirectories);$(TargetFrameworkDirectory);$(WinFXAssemblyDirectory)</TargetFrameworkDirectory>
      <TargetFrameworkDirectory Condition="'$(TargetPlatformWinMDLocation)' != '' and Exists('$(TargetPlatformWinMDLocation)')">$(TargetFrameworkDirectory);$(TargetPlatformWinMDLocation)</TargetFrameworkDirectory>
    </PropertyGroup>
    <!-- Remove the AssemblyFolders if no target framework directories could be found. This is to prevent us from
             resolving from the assemblyfolders global location if we are not acutally targeting a framework-->
    <PropertyGroup>
      <RemoveAssemblyFoldersIfNoTargetFramework Condition="'$(RemoveAssemblyFoldersIfNoTargetFramework)' == ''">true</RemoveAssemblyFoldersIfNoTargetFramework>
    </PropertyGroup>
    <PropertyGroup Condition="'$(_TargetFrameworkDirectories)' == '' and '$(AssemblySearchPaths)' != '' and '$(RemoveAssemblyFoldersIfNoTargetFramework)' == 'true'">
      <AssemblySearchPaths>$(AssemblySearchPaths.Replace('{AssemblyFolders}', '').Split(';'))</AssemblySearchPaths>
    </PropertyGroup>
    <ItemGroup Condition="'$(ImplicitlyExpandDesignTimeFacades)' == 'true'">
      <DesignTimeFacadeDirectoryRoots Include="$(TargetFrameworkDirectory)" />
      <DesignTimeFacadeDirectories Include="%(DesignTimeFacadeDirectoryRoots.Identity)Facades\" Condition="Exists('%(DesignTimeFacadeDirectoryRoots.Identity)Facades\')" />
    </ItemGroup>
    <PropertyGroup Condition="'@(DesignTimeFacadeDirectories)' != ''">
      <TargetFrameworkDirectory>$(TargetFrameworkDirectory);@(DesignTimeFacadeDirectories)</TargetFrameworkDirectory>
    </PropertyGroup>
    <PropertyGroup Condition="'$(_TargetFrameworkDirectories)' == ''">
      <TargetFrameworkProfile />
    </PropertyGroup>
  </Target>
  <!-- Returns target framework moniker. E.g. ".NETFramework,Version=v4.0.1" -->
  <Target Name="GetTargetFrameworkMoniker" Returns="$(TargetFrameworkMoniker)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!-- Returns target framework moniker display name. E.g. ".NET Framework 4 Platform Update 1 (KB2478063)" -->
  <Target Name="GetTargetFrameworkMonikerDisplayName" DependsOnTargets="GetFrameworkPaths;GetReferenceAssemblyPaths" Returns="$(TargetFrameworkMonikerDisplayName)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!-- Returns semicolon separated list of target framework directories.
  E.g "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0.1\;C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\" -->
  <Target Name="GetTargetFrameworkDirectories" DependsOnTargets="GetFrameworkPaths;GetReferenceAssemblyPaths" Returns="$(TargetFrameworkDirectory)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AssignLinkMetadata

       For items of a certain set of whitelisted types, make sure that
       if they are defined in a file other than the project file, that
       they have "Link" metadata set to an appropriate default.
    ============================================================
    -->
  <Target Name="AssignLinkMetadata" Condition=" '$(SynthesizeLinkMetadata)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- NONE ITEMS -->
    <AssignLinkMetadata Items="@(None)" Condition="'@(None)' != '' and '%(None.DefiningProjectFullPath)' != '$(MSBuildProjectFullPath)'">
      <Output TaskParameter="OutputItems" ItemName="_Temp" />
    </AssignLinkMetadata>
    <ItemGroup>
      <None Remove="@(_Temp)" />
      <None Include="@(_Temp)" />
      <_Temp Remove="@(_Temp)" />
    </ItemGroup>
    <!-- CONTENT ITEMS -->
    <AssignLinkMetadata Items="@(Content)" Condition="'@(Content)' != '' and '%(Content.DefiningProjectFullPath)' != '$(MSBuildProjectFullPath)'">
      <Output TaskParameter="OutputItems" ItemName="_Temp" />
    </AssignLinkMetadata>
    <ItemGroup>
      <Content Remove="@(_Temp)" />
      <Content Include="@(_Temp)" />
      <_Temp Remove="@(_Temp)" />
    </ItemGroup>
    <!-- PAGE ITEMS -->
    <AssignLinkMetadata Items="@(Page)" Condition="'@(Page)' != '' and '%(Page.DefiningProjectFullPath)' != '$(MSBuildProjectFullPath)'">
      <Output TaskParameter="OutputItems" ItemName="_Temp" />
    </AssignLinkMetadata>
    <ItemGroup>
      <Page Remove="@(_Temp)" />
      <Page Include="@(_Temp)" />
      <_Temp Remove="@(_Temp)" />
    </ItemGroup>
    <!-- APPLICATIONDEFINITION ITEMS -->
    <AssignLinkMetadata Items="@(ApplicationDefinition)" Condition="'@(ApplicationDefinition)' != '' and '%(ApplicationDefinition.DefiningProjectFullPath)' != '$(MSBuildProjectFullPath)'">
      <Output TaskParameter="OutputItems" ItemName="_Temp" />
    </AssignLinkMetadata>
    <ItemGroup>
      <ApplicationDefinition Remove="@(_Temp)" />
      <ApplicationDefinition Include="@(_Temp)" />
      <_Temp Remove="@(_Temp)" />
    </ItemGroup>
    <!-- EMBEDDEDRESOURCE ITEMS -->
    <AssignLinkMetadata Items="@(EmbeddedResource)" Condition="'@(EmbeddedResource)' != '' and '%(EmbeddedResource.DefiningProjectFullPath)' != '$(MSBuildProjectFullPath)'">
      <Output TaskParameter="OutputItems" ItemName="_Temp" />
    </AssignLinkMetadata>
    <ItemGroup>
      <EmbeddedResource Remove="@(_Temp)" />
      <EmbeddedResource Include="@(_Temp)" />
      <_Temp Remove="@(_Temp)" />
    </ItemGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                PreBuildEvent Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        PreBuildEvent

    Run the pre-build event if there is one.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PreBuildEventDependsOn />
  </PropertyGroup>
  <Target Name="PreBuildEvent" Condition="'$(PreBuildEvent)'!=''" DependsOnTargets="$(PreBuildEventDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Exec WorkingDirectory="$(OutDir)" Command="$(PreBuildEvent)" />
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                UnmanagedUnregistration Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        UnmanagedUnregistration

    If the main assembly had previously been registered for COM interop, unregister it now.
    We will re-register the new version after it has been built.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <UnmanagedUnregistrationDependsOn />
  </PropertyGroup>
  <Target Name="UnmanagedUnregistration" Condition="(('$(_AssemblyTimestampBeforeCompile)' != '$(_AssemblyTimestampAfterCompile)' or '$(RegisterForComInterop)' != 'true' or '$(OutputType)' != 'library') or                     ('$(_AssemblyTimestampBeforeCompile)' == '')) and                    Exists('@(_UnmanagedRegistrationCache)')" DependsOnTargets="$(UnmanagedUnregistrationDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <UnregisterAssemblyMSBuildArchitecture Condition="'$(UnregisterAssemblyMSBuildArchitecture)' == ''">$(PlatformTargetAsMSBuildArchitecture)</UnregisterAssemblyMSBuildArchitecture>
    </PropertyGroup>
    <PropertyGroup Condition="'$(TargetFrameworkAsMSBuildRuntime)' != '' and '$(UnregisterAssemblyMSBuildArchitecture)' != ''">
      <!-- Falling back to the current runtime if we are targeting CLR2 and the task host doesn't exist will lead to
           incorrect behavior in some cases, but it's the same incorrect behavior as Visual Studio 2010, and thus better
           than causing build breaks on upgrade to Win8 the way not doing so would.  For more details, see the
           corresponding comment in GenerateResource. -->
      <UnregisterAssemblyMSBuildRuntime Condition="'$(UnregisterAssemblyMSBuildRuntime)' == '' and                      $([MSBuild]::DoesTaskHostExist(`$(TargetFrameworkAsMSBuildRuntime)`, `$(UnregisterAssemblyMSBuildArchitecture)`))">$(TargetFrameworkAsMSBuildRuntime)</UnregisterAssemblyMSBuildRuntime>
      <!-- If the targeted runtime doesn't exist, fall back to current -->
      <UnregisterAssemblyMSBuildRuntime Condition="'$(UnregisterAssemblyMSBuildRuntime)' == ''">CurrentRuntime</UnregisterAssemblyMSBuildRuntime>
    </PropertyGroup>
    <UnregisterAssembly AssemblyListFile="@(_UnmanagedRegistrationCache)" MSBuildArchitecture="$(UnregisterAssemblyMSBuildArchitecture)" MSBuildRuntime="$(UnregisterAssemblyMSBuildRuntime)" />
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                ResolveReferences Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                     GetTargetFrameworkVersion

    This stand-alone target returns the target framework version (i.e. v3.5, v4.0, etc.)
    that would be used if we built this project.

    ============================================================
    -->
  <Target Name="GetTargetFrameworkVersion" Returns="$(TargetFrameworkVersion)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        ResolveReferences
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveReferencesDependsOn>
      BeforeResolveReferences;
      AssignProjectConfiguration;
      ResolveProjectReferences;
      FindInvalidProjectReferences;
      ResolveNativeReferences;
      ResolveAssemblyReferences;
      GenerateBindingRedirects;
      ResolveComReferences;
      AfterResolveReferences
    </ResolveReferencesDependsOn>
  </PropertyGroup>
  <Target Name="ResolveReferences" Returns="@(ReferencePath)" DependsOnTargets="$(ResolveReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BeforeResolveReferences

    Redefine this target in your project in order to run tasks just before ResolveReferences
    ============================================================
    -->
  <Target Name="BeforeResolveReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterResolveReferences

    Redefine this target in your project in order to run tasks just after ResolveReferences
    ============================================================
    -->
  <Target Name="AfterResolveReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AssignProjectConfiguration

    Assigns the appropriate configuration to each project in the list of project references passed in.
    Adds to the project references passed in any project references implied by dependencies expressed in the solution file, if any.

        [IN]
        @(ProjectReference) - the list of all project references

        [OUT]
        @(ProjectReferenceWithConfiguration) - the list of project references (MSBuild and potentially VSIP projects)
                                               with metadata values FullConfiguration, Configuration, Platform,
                                               SetConfiguration, and SetPlatform
    ============================================================
    -->
  <Target Name="AssignProjectConfiguration" Condition="'$(CurrentSolutionConfigurationContents)' != '' or '@(ProjectReference)'!=''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <OnlyReferenceAndBuildProjectsEnabledInSolutionConfiguration Condition="'$(OnlyReferenceAndBuildProjectsEnabledInSolutionConfiguration)' == ''">true</OnlyReferenceAndBuildProjectsEnabledInSolutionConfiguration>
      <ShouldUnsetParentConfigurationAndPlatform Condition="'$(ShouldUnsetParentConfigurationAndPlatform)' == '' and ('$(BuildingInsideVisualStudio)' == 'true' or '$(BuildingSolutionFile)' == 'true')">true</ShouldUnsetParentConfigurationAndPlatform>
      <ShouldUnsetParentConfigurationAndPlatform Condition="'$(ShouldUnsetParentConfigurationAndPlatform)' == ''">false</ShouldUnsetParentConfigurationAndPlatform>
      <!-- Web Application projects can "secretly" reference Silverlight projects, which can take project dependencies on that same Web Application.  If the project
           dependencies are promoted to project references, this ends up creating a situation where we have a circular reference between the two projects.  We don't
           want this to happen, so just turn off synthetic project reference generation for Silverlight projects. -->
      <AddSyntheticProjectReferencesForSolutionDependencies Condition="'$(AddSyntheticProjectReferencesForSolutionDependencies)' == '' and '$(TargetFrameworkIdentifier)' == 'Silverlight'">false</AddSyntheticProjectReferencesForSolutionDependencies>
      <!-- Inside VS, we do not need to add synthetic references, as VS already organizes the build per any solution-level dependencies; we only do this on the command line-->
      <AddSyntheticProjectReferencesForSolutionDependencies Condition="'$(AddSyntheticProjectReferencesForSolutionDependencies)' == '' and '$(BuildingInsideVisualStudio)' != 'true'">true</AddSyntheticProjectReferencesForSolutionDependencies>
    </PropertyGroup>
    <!-- Assign a project configuration to each project reference if we're building a solution file. -->
    <AssignProjectConfiguration ProjectReferences="@(ProjectReference)" CurrentProject="$(MSBuildProjectFullPath)" CurrentProjectConfiguration="$(Configuration)" CurrentProjectPlatform="$(Platform)" DefaultToVcxPlatformMapping="$(DefaultToVcxPlatformMapping)" VcxToDefaultPlatformMapping="$(VcxToDefaultPlatformMapping)" OutputType="$(OutputType)" ResolveConfigurationPlatformUsingMappings="false" SolutionConfigurationContents="$(CurrentSolutionConfigurationContents)" AddSyntheticProjectReferencesForSolutionDependencies="$(AddSyntheticProjectReferencesForSolutionDependencies)" OnlyReferenceAndBuildProjectsEnabledInSolutionConfiguration="$(OnlyReferenceAndBuildProjectsEnabledInSolutionConfiguration)" ShouldUnsetParentConfigurationAndPlatform="$(ShouldUnsetParentConfigurationAndPlatform)">
      <!-- EMITTED FOR COMPATIBILITY REASONS ONLY. CONSUME PROJECTREFERENCEWITHCONFIGURATION INSTEAD -->
      <Output TaskParameter="AssignedProjects" ItemName="_ProjectReferenceWithConfiguration" />
      <Output TaskParameter="UnassignedProjects" ItemName="_ProjectReferenceWithConfiguration" />
      <Output TaskParameter="AssignedProjects" ItemName="ProjectReferenceWithConfiguration" />
      <Output TaskParameter="UnassignedProjects" ItemName="ProjectReferenceWithConfiguration" />
    </AssignProjectConfiguration>
    <ItemGroup>
      <_ProjectReferenceWithConfiguration>
        <BuildReference Condition="'%(_ProjectReferenceWithConfiguration.BuildReference)' == ''">true</BuildReference>
        <ReferenceOutputAssembly Condition="'%(_ProjectReferenceWithConfiguration.ReferenceOutputAssembly)' == ''">true</ReferenceOutputAssembly>
      </_ProjectReferenceWithConfiguration>
      <ProjectReferenceWithConfiguration>
        <BuildReference Condition="'%(ProjectReferenceWithConfiguration.BuildReference)' == ''">true</BuildReference>
        <ReferenceOutputAssembly Condition="'%(ProjectReferenceWithConfiguration.ReferenceOutputAssembly)' == ''">true</ReferenceOutputAssembly>
      </ProjectReferenceWithConfiguration>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _SplitProjectReferencesByFileExistence

    Split referenced projects into two lists: those that exist on
    disk and those that don't.
    ============================================================
    -->
  <Target Name="_SplitProjectReferencesByFileExistence" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Use this task for matching projects with pre-resolved project outputs set by the IDE
        if building inside the IDE.  The IDE only includes non-MSBuild projects in the output list.  We'll
        use MSBuild to resolve MSBuild projects.
        This task will resolve VSIP (3rd party) project references and create a new item list with only project references
        to projects in the MSBuild format.
        -->
    <ResolveNonMSBuildProjectOutput ProjectReferences="@(ProjectReferenceWithConfiguration)" PreresolvedProjectOutputs="$(VSIDEResolvedNonMSBuildProjectOutputs)" Condition="'$(BuildingInsideVisualStudio)'=='true' and '@(ProjectReferenceWithConfiguration)'!=''">
      <Output TaskParameter="ResolvedOutputPaths" ItemName="_ResolvedProjectReferencePaths" />
      <Output TaskParameter="UnresolvedProjectReferences" ItemName="_MSBuildProjectReference" />
    </ResolveNonMSBuildProjectOutput>
    <!--
       If building from the command line, simply copy the ProjectReferenceWithConfiguration item list to _MSBuildProjectReference,
       since we have to assume all projects are in the MSBuild format. We have no way of building
       VSIP (3rd party) projects from the command line.
       -->
    <ItemGroup>
      <_MSBuildProjectReference Include="@(ProjectReferenceWithConfiguration)" Condition="'$(BuildingInsideVisualStudio)'!='true' and '@(ProjectReferenceWithConfiguration)'!=''" />
    </ItemGroup>
    <!-- Break the project list into two lists: those that exist on disk and those that don't. -->
    <ItemGroup>
      <_MSBuildProjectReferenceExistent Include="@(_MSBuildProjectReference)" Condition="Exists('%(Identity)')" />
      <_MSBuildProjectReferenceNonexistent Include="@(_MSBuildProjectReference)" Condition="!Exists('%(Identity)')" />
    </ItemGroup>
  </Target>
  <!--
    ====================================================================================
                                        _GetProjectReferenceTargetFrameworkProperties

    Builds the GetTargetFrameworks target of all existent project references to get a list
    of all supported TargetFrameworks of the referenced projects. Calls the
    GetReferenceNearestTargetFrameworkTask to determine the closest match for each project.
    This allows a cross-targeting project to select how it should be configured to build
    against the most appropriate target for the referring target framework.

    ======================================================================================
  -->
  <Target Name="_GetProjectReferenceTargetFrameworkProperties" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
      Select the moniker to send to each project reference  if not already set. NugetTargetMoniker (NTM) is preferred by default over
      TargetFrameworkMoniker (TFM) because it is required to disambiguate the UWP case where TFM is fixed at .NETCore,Version=v5.0 and
      has floating NTM=UAP,Version=vX.Y.Z. However, in other cases (classic PCLs), NTM contains multiple values and that will cause the MSBuild
      invocation below to fail by passing invalid properties. Therefore we do not use the NTM if it contains a semicolon.
    -->
    <PropertyGroup Condition="'$(ReferringTargetFrameworkForProjectReferences)' == ''">
      <ReferringTargetFrameworkForProjectReferences Condition="'$(NugetTargetMoniker)' != '' and !$(NuGetTargetMoniker.Contains(';'))">$(NugetTargetMoniker)</ReferringTargetFrameworkForProjectReferences>
      <ReferringTargetFrameworkForProjectReferences Condition="'$(NugetTargetMoniker)' == ''">$(TargetFrameworkMoniker)</ReferringTargetFrameworkForProjectReferences>
    </PropertyGroup>
    <!--
      Honor SkipGetTargetFrameworkProperties=true metadata on project references
      to mean that the project reference is known not to target multiple frameworks
      and the mechanism here for selecting the best one can be skipped as an optimization.

      We give this treatment to .vcxproj by default since no .vcxproj can target more
      than one framework.
   -->
    <ItemGroup>
      <_MSBuildProjectReferenceExistent Condition="'%(_MSBuildProjectReferenceExistent.SkipGetTargetFrameworkProperties)' == '' and ('%(Extension)' == '.vcxproj' or '%(Extension)' == '.nativeproj')">
        <SkipGetTargetFrameworkProperties>true</SkipGetTargetFrameworkProperties>
      </_MSBuildProjectReferenceExistent>
    </ItemGroup>
    <!--
       Allow project references to specify which target framework properties to set and their values
       without consulting the referenced project. This has two use cases:

       1. A caller may wish to pick a compatible but sub-optimal target framework. For example,
          to unit test the .NETStandard implementation using a .NETFramework caller even though
          there is also a .NETFramework implementation.

       2. As an escape hatch for cases where the compatibility check performed by
          GetTargetFrameworkProperties is faulty.
    -->
    <ItemGroup>
      <_MSBuildProjectReferenceExistent Condition="'%(_MSBuildProjectReferenceExistent.SetTargetFramework)' != ''">
        <SkipGetTargetFrameworkProperties>true</SkipGetTargetFrameworkProperties>
      </_MSBuildProjectReferenceExistent>
    </ItemGroup>
    <!--
       Get reference target framework lists.
       Note: A future optimization could cache the closest match and set the target framework on
       this MSBuild task invocation. This would (optimistically) save an evaluation of the referenced
       project when the answer is the same.
    -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="GetTargetFrameworks" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform)" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove);TargetFramework;RuntimeIdentifier" Condition="'%(_MSBuildProjectReferenceExistent.SkipGetTargetFrameworkProperties)' != 'true'" SkipNonexistentTargets="true">
      <Output TaskParameter="TargetOutputs" ItemName="_ProjectReferenceTargetFrameworkPossibilities" />
    </MSBuild>
    <ItemGroup>
      <!--
        Preserve the ItemSpec value on the _ProjectReferenceTargetFrameworkPossibilities. Because relative paths in another project
        context would be incorrect, the MSBuild task invocation needs expands the project reference paths in the MSBuild task above.
        This is generally OK, but if the list is copied the OriginalItemSpec can become the expanded value and cause issues correlating
        a project reference back to an Item instance.
      -->
      <_ProjectReferenceTargetFrameworkPossibilitiesOriginalItemSpec Include="@(_ProjectReferenceTargetFrameworkPossibilities->'%(OriginalItemSpec)')" />
      <_ProjectReferenceTargetFrameworkPossibilities Remove="@(_ProjectReferenceTargetFrameworkPossibilities)" />
      <_ProjectReferenceTargetFrameworkPossibilities Include="@(_ProjectReferenceTargetFrameworkPossibilitiesOriginalItemSpec)" />
    </ItemGroup>
    <!-- For each reference, get closest match -->
    <GetReferenceNearestTargetFrameworkTask AnnotatedProjectReferences="@(_ProjectReferenceTargetFrameworkPossibilities)" CurrentProjectTargetFramework="$(ReferringTargetFrameworkForProjectReferences)" CurrentProjectName="$(MSBuildProjectName)" Condition="'@(_ProjectReferenceTargetFrameworkPossibilities-&gt;Count())' != '0' and '$(ReferringTargetFrameworkForProjectReferences)' != ''">
      <Output ItemName="AnnotatedProjects" TaskParameter="AssignedProjects" />
    </GetReferenceNearestTargetFrameworkTask>
    <ItemGroup>
      <!--
         If the task was skipped or the current TargetFramework is empty, AnnotatedProjects will be empty.
         In this case, copy _ProjectReferenceTargetFrameworkPossibilities as is. See:
            https://github.com/dotnet/sdk/issues/416
      -->
      <AnnotatedProjects Include="@(_ProjectReferenceTargetFrameworkPossibilities)" Condition="'$(ReferringTargetFrameworkForProjectReferences)' == ''" />
      <!-- If the NearestTargetFramework property was set and the project multi-targets, SetTargetFramework must be set. -->
      <AnnotatedProjects Condition="'@(AnnotatedProjects)' == '%(Identity)' and '%(AnnotatedProjects.NearestTargetFramework)' != '' and '%(AnnotatedProjects.HasSingleTargetFramework)' != 'true'">
        <SetTargetFramework>TargetFramework=%(AnnotatedProjects.NearestTargetFramework)</SetTargetFramework>
      </AnnotatedProjects>
      <!--
         If the NearestTargetFramework property was not set or the project has a single TargetFramework, we need to Undefine
         TargetFramework to avoid another project evaluation.
      -->
      <AnnotatedProjects Condition="'@(AnnotatedProjects)' == '%(Identity)' and ('%(AnnotatedProjects.NearestTargetFramework)' == '' or '%(AnnotatedProjects.HasSingleTargetFramework)' == 'true')">
        <UndefineProperties>%(AnnotatedProjects.UndefineProperties);TargetFramework</UndefineProperties>
      </AnnotatedProjects>
      <!-- If the project is RID agnostic, undefine the RuntimeIdentifier property to avoid another evaluation. -->
      <AnnotatedProjects Condition="'@(AnnotatedProjects)' == '%(Identity)' and '%(AnnotatedProjects.IsRidAgnostic)' == 'true'">
        <UndefineProperties>%(AnnotatedProjects.UndefineProperties);RuntimeIdentifier</UndefineProperties>
      </AnnotatedProjects>
      <!--
         Remove the items we've touched from _MSBuildProjectReferenceExistent. This will leave all projects where
         SkipGetTargetFrameworkProperties was set. Then add all AnnotatedProjects back.
      -->
      <_MSBuildProjectReferenceExistent Remove="@(_MSBuildProjectReferenceExistent)" Condition="'%(_MSBuildProjectReferenceExistent.SkipGetTargetFrameworkProperties)' != 'true'" />
      <_MSBuildProjectReferenceExistent Include="@(AnnotatedProjects)" />
    </ItemGroup>
  </Target>
  <Target Name="GetTargetFrameworks" Returns="@(_ThisProjectBuildMetadata)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_ThisProjectBuildMetadata Include="$(MSBuildProjectFullPath)">
        <TargetFrameworks Condition="'$(TargetFrameworks)' != ''">$(TargetFrameworks)</TargetFrameworks>
        <TargetFrameworks Condition="'$(TargetFrameworks)' == ''">$(TargetFramework)</TargetFrameworks>
        <HasSingleTargetFramework>true</HasSingleTargetFramework>
        <HasSingleTargetFramework Condition="'$(IsCrossTargetingBuild)' == 'true'">false</HasSingleTargetFramework>
        <!-- indicate to caller that project is RID agnostic so that a global property RuntimeIdentifier value can be removed -->
        <IsRidAgnostic>false</IsRidAgnostic>
        <IsRidAgnostic Condition=" '$(RuntimeIdentifier)' == '' and '$(RuntimeIdentifiers)' == '' ">true</IsRidAgnostic>
      </_ThisProjectBuildMetadata>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                    GetTargetFrameworkProperties

    Overrridden by cross-targeting projects to return the set of
    properties (in the form "key1=value1;...keyN=valueN") needed
    to build it with the best target for the referring project's
    target framework.

    The referring project's $(TargetFrameworkMoniker) is passed
    in as $(ReferringTargetFramework)
  -->
  <Target Name="GetTargetFrameworkProperties" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        PrepareProjectReferences

    Prepares project references for consumption by other targets.

        [IN]
        @(ProjectReference) - The list of project references.

        [OUT]
        @(ProjectReferenceWithConfiguration)   - Project references with apporpriate metadata
        @(_MSBuildProjectReferenceExistent)    - Subset of @(ProjectReferenceWithConfiguration) that exist
                                                 with added SetTargetFramework metadata for cross-targeting
        @(_MSBuildProjectReferenceNonExistent) - Subset of  @(ProjectReferenceWithConfiguration) that do not exist
    ============================================================
  -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PrepareProjectReferencesDependsOn>
      AssignProjectConfiguration;
      _SplitProjectReferencesByFileExistence;
      _GetProjectReferenceTargetFrameworkProperties
    </PrepareProjectReferencesDependsOn>
  </PropertyGroup>
  <Target Name="PrepareProjectReferences" DependsOnTargets="$(PrepareProjectReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        ResolveProjectReferences

    Build referenced projects:

        [IN]
        @(ProjectReferenceWithConfiguration) - The list of project references.

        [OUT]
        @(_ResolvedNativeProjectReferencePaths) - Paths to referenced native projects.
        @(_ResolvedProjectReferencePaths) - Paths to referenced managed projects.
    ============================================================
    -->
  <!-- By default, the outputs of project references are passed to the compiler -->
  <ItemDefinitionGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectReference>
      <!-- Target to build in the project reference; by default, this property is blank, indicating the default targets-->
      <Targets>$(ProjectReferenceBuildTargets)</Targets>
      <!-- Extra item type to emit outputs of the destination into. Defaults to blank. To emit only into this list, set the ReferenceOutputAssembly metadata to false as well. -->
      <OutputItemType />
      <ReferenceSourceTarget>ProjectReference</ReferenceSourceTarget>
    </ProjectReference>
  </ItemDefinitionGroup>
  <Target Name="ResolveProjectReferences" DependsOnTargets="PrepareProjectReferences" Returns="@(_ResolvedNativeProjectReferencePaths);@(_ResolvedProjectReferencePaths)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        When building this project from the IDE, just gather the referenced build outputs.
        The IDE will already have built the project, so there's no need to do it again here.

        The ContinueOnError setting is here so that, during project load, as
        much information as possible will be passed to the compilers.
        -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="GetTargetPath" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and ('$(BuildingInsideVisualStudio)' == 'true' or '$(BuildProjectReferences)' != 'true') and '$(VisualStudioVersion)' != '10.0' and '@(_MSBuildProjectReferenceExistent)' != ''" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="_ResolvedProjectReferencePaths" Condition="'%(_MSBuildProjectReferenceExistent.ReferenceOutputAssembly)'=='true'" />
      <Output TaskParameter="TargetOutputs" ItemName="%(_MSBuildProjectReferenceExistent.OutputItemType)" Condition="'%(_MSBuildProjectReferenceExistent.OutputItemType)' != ''" />
    </MSBuild>
    <!--
        QUIRKING FOR DEV10

        In the 4.0 version of the targets, we built the targets specified in the Targets metadata in addition to
        GetTargetPath when building in the IDE.  In 4.5, we changed this to just GetTargetPath because it was
        causing performance trouble with certain systems that specified targets that did a significant amount of
        work in the Targets metadata, expecting them to only build when doing a real build.

        However, that change broke C++ unit testing in Dev10 + 4.5 scenarios, because they required use of the
        Targets metadata in order to get design time builds to work properly.  Thus, we need to make sure we
        restore the Dev10 behavior when building on Dev10.
        -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="%(_MSBuildProjectReferenceExistent.Targets);GetTargetPath" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and ('$(BuildingInsideVisualStudio)' == 'true' or '$(BuildProjectReferences)' != 'true') and '$(VisualStudioVersion)' == '10.0' and '@(_MSBuildProjectReferenceExistent)' != ''" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="_ResolvedProjectReferencePaths" Condition="'%(_MSBuildProjectReferenceExistent.ReferenceOutputAssembly)'=='true'" />
      <Output TaskParameter="TargetOutputs" ItemName="%(_MSBuildProjectReferenceExistent.OutputItemType)" Condition="'%(_MSBuildProjectReferenceExistent.OutputItemType)' != ''" />
    </MSBuild>
    <!--
        Build referenced projects when building from the command line.
        -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="%(_MSBuildProjectReferenceExistent.Targets)" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform);  %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and '$(BuildingInsideVisualStudio)' != 'true' and '$(BuildProjectReferences)' == 'true' and '@(_MSBuildProjectReferenceExistent)' != ''" ContinueOnError="$(ContinueOnError)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="_ResolvedProjectReferencePaths" Condition="'%(_MSBuildProjectReferenceExistent.ReferenceOutputAssembly)'=='true' or '$(DesignTimeBuild)' == 'true'" />
      <Output TaskParameter="TargetOutputs" ItemName="%(_MSBuildProjectReferenceExistent.OutputItemType)" Condition="'%(_MSBuildProjectReferenceExistent.OutputItemType)' != ''" />
    </MSBuild>
    <!--
        Get manifest items from the (non-exe) built project references (to feed them into ResolveNativeReference).
        -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="GetNativeManifest" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'%(_MSBuildProjectReferenceExistent.BuildReference)' == 'true' and '@(ProjectReferenceWithConfiguration)' != '' and '$(BuildingProject)' == 'true' and '@(_MSBuildProjectReferenceExistent)' != ''" ContinueOnError="$(ContinueOnError)" SkipNonexistentTargets="true" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="NativeReference" Condition="'%(_MSBuildProjectReferenceExistent.ReferenceOutputAssembly)' == 'true'" />
    </MSBuild>
    <ItemGroup>
      <_ResolvedProjectReferencePaths Remove="@(_ResolvedProjectReferencePaths)" Condition="'%(_ResolvedProjectReferencePaths.ResolveableAssembly)' == 'false'" />
      <!--
          Copy OriginalItemSpec to OriginalProjectReferenceItemSpec, so that when ResolveAssemblyReferences
          takes these items and resolves them to ReferencePath, we can still recover the _real_ OriginalItemSpec
          for the unresolved reference items.
          -->
      <_ResolvedProjectReferencePaths>
        <OriginalProjectReferenceItemSpec>%(_ResolvedProjectReferencePaths.OriginalItemSpec)</OriginalProjectReferenceItemSpec>
      </_ResolvedProjectReferencePaths>
    </ItemGroup>
    <!-- Issue a warning for each non-existent project. -->
    <Warning Text="The referenced project '%(_MSBuildProjectReferenceNonexistent.Identity)' does not exist." Condition="'@(ProjectReferenceWithConfiguration)' != '' and '@(_MSBuildProjectReferenceNonexistent)' != ''" />
  </Target>
  <Target Name="ResolveProjectReferencesDesignTime" Returns="@(_ProjectReferencesFromRAR);@(_ResolvedNativeProjectReferencePaths)" DependsOnTargets="ResolveProjectReferences;ResolveAssemblyReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- We need to do this here because we only want project references which have passed through rar and have not been unresolved due to violating some MT rule
        which means we need to pull the project references out of the referencepath item because they will only exist there if they were correctly resolved.
    -->
    <ItemGroup>
      <_ProjectReferencesFromRAR Include="@(ReferencePath-&gt;WithMetadataValue('ReferenceSourceTarget', 'ProjectReference'))">
        <OriginalItemSpec>%(ReferencePath.ProjectReferenceOriginalItemSpec)</OriginalItemSpec>
      </_ProjectReferencesFromRAR>
    </ItemGroup>
  </Target>
  <Target Name="ExpandSDKReferencesDesignTime" Returns="@(ReferencesFromSDK)" DependsOnTargets="ExpandSDKReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        GetTargetPath

    This target returns an item containing the build product (i.e. EXE, DLL)
    that would be produced if we built this project, with some relevant
    metadata.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetTargetPathDependsOn>$(GetTargetPathDependsOn)</GetTargetPathDependsOn>
  </PropertyGroup>
  <Target Name="GetTargetPath" DependsOnTargets="$(GetTargetPathDependsOn)" Returns="@(TargetPathWithTargetPlatformMoniker)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        GetTargetPathWithTargetPlatformMoniker

    This stand-alone target returns the name and version of the target platform for this project.

    NOTE: The ProjectReference protocol uses only GetTargetPath. Computing the item
    in this target allows projects to override GetTargetPath without having to reimplement
    the details of the metadata computation.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetTargetPathWithTargetPlatformMonikerDependsOn>$(GetTargetPathDependsOn)</GetTargetPathWithTargetPlatformMonikerDependsOn>
  </PropertyGroup>
  <!--NOTE: since an overridden GetTargetPath might not include a DependsOn
      for this target, it's safer to establish the dependency here with a
      BeforeTargets. -->
  <Target Name="GetTargetPathWithTargetPlatformMoniker" BeforeTargets="GetTargetPath" DependsOnTargets="$(GetTargetPathWithTargetPlatformMonikerDependsOn)" Returns="@(TargetPathWithTargetPlatformMoniker)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <TargetPathWithTargetPlatformMoniker Include="$(TargetPath)">
        <TargetPlatformMoniker>$(TargetPlatformMoniker)</TargetPlatformMoniker>
        <TargetPlatformIdentifier>$(TargetPlatformIdentifier)</TargetPlatformIdentifier>
        <TargetFrameworkIdentifier>$(TargetFrameworkIdentifier)</TargetFrameworkIdentifier>
        <TargetFrameworkVersion>$(TargetFrameworkVersion.TrimStart('vV'))</TargetFrameworkVersion>
        <ReferenceAssembly Condition="'$(ProduceReferenceAssembly)' == 'true'">$(TargetRefPath)</ReferenceAssembly>
        <CopyUpToDateMarker>@(CopyUpToDateMarker)</CopyUpToDateMarker>
      </TargetPathWithTargetPlatformMoniker>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GetNativeManifest

    Compute the manifest item for this project.

        [IN]
        $(_DeploymentApplicationManifestIdentity) - the manifest identity
        @(ApplicationManifest)         - the original application manifest item

        [OUT]
        @(ComputedApplicationManifest) - application manifest item with full hint path, if generated
    ============================================================
    -->
  <Target Name="GetNativeManifest" Returns="@(ComputedApplicationManifest)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <ComputedApplicationManifest Include="$(_DeploymentApplicationManifestIdentity)" Condition="'$(OutputType)'!='winexe' and '$(OutputType)'!='exe' and '$(OutputType)'!='appcontainerexe' and Exists('%(_ApplicationManifestFinal.FullPath)')">
        <HintPath>%(_ApplicationManifestFinal.FullPath)</HintPath>
      </ComputedApplicationManifest>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        ResolveNativeReferences

    Resolve native references

        [IN]
        @(NativeReference) - The manifest reference (or list of manifest references)

        [OUT]
        @(NativeReferenceFile)  - List of manifest files referenced.
        @(_DeploymentNativePrerequisite)   - List of native assembly prerequisites contained in the manifest.
        @(ComClassReference)    - List of COM components contained in the manifest.
        @(COMReferenceFromNative) List of type libraries contained in the manifest.
        @(COMFileReference)     - List of loose files contained in the manifest.
        @(_DeploymentLooseManifestFile)    - List of extra files that should be published.
    ============================================================
    -->
  <Target Name="ResolveNativeReferences" Condition="'@(NativeReference)'!=''" DependsOnTargets="ResolveProjectReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveNativeReference NativeReferences="@(NativeReference)" AdditionalSearchPaths="$(ReferencePath);$(OutDir)">
      <Output TaskParameter="ContainingReferenceFiles" ItemName="NativeReferenceFile" />
      <Output TaskParameter="ContainedPrerequisiteAssemblies" ItemName="_DeploymentNativePrerequisite" />
      <Output TaskParameter="ContainedComComponents" ItemName="ComClassReference" />
      <Output TaskParameter="ContainedTypeLibraries" ItemName="COMReferenceFromNative" />
      <Output TaskParameter="ContainedLooseTlbFiles" ItemName="COMFileReference" />
      <Output TaskParameter="ContainedLooseEtcFiles" ItemName="_DeploymentLooseManifestFile" />
    </ResolveNativeReference>
  </Target>
  <!--
    ============================================================

                                        ResolveAssemblyReferences

    Given the list of assemblies, find the closure of all assemblies that they depend on. These are
    what we need to copy to the output directory.

        [IN]
        @(Reference) - List of assembly references as fusion names.
        @(_ResolvedProjectReferencePaths) - List of project references produced by projects that this project depends on.

            The 'Private' attribute on the reference corresponds to the Copy Local flag in IDE.
            The 'Private' flag can have three possible values:
                - 'True' means the reference should be Copied Local
                - 'False' means the reference should not be Copied Local
                - [Missing] means this task will decide whether to treat this reference as CopyLocal or not.

        [OUT]
        @(ReferencePath) - Paths to resolved primary files.
        @(ReferenceDependencyPaths) - Paths to resolved dependency files.
        @(_ReferenceRelatedPaths) - Paths to .xmls and .pdbs.
        @(ReferenceSatellitePaths) - Paths to satellites.
        @(_ReferenceSerializationAssemblyPaths) - Paths to XML serialization assemblies created by sgen.
        @(_ReferenceScatterPaths) - Paths to scatter files.
        @(ReferenceCopyLocalPaths) - Paths to files that should be copied to the local directory.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveAssemblyReferencesDependsOn>
      GetFrameworkPaths;
      GetReferenceAssemblyPaths;
      PrepareForBuild;
      ResolveSDKReferences;
      ExpandSDKReferences;
    </ResolveAssemblyReferencesDependsOn>
  </PropertyGroup>
  <Target Name="ResolveAssemblyReferences" Returns="@(ReferencePath)" DependsOnTargets="$(ResolveAssemblyReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_ReferenceInstalledAssemblyDirectory Include="$(TargetFrameworkDirectory)" />
      <_ReferenceInstalledAssemblySubsets Include="$(TargetFrameworkSubset)" />
    </ItemGroup>
    <!--
        Only read and write cache file at build time, skip it for load time because its more
        expensive to write the newly created cache file.
        -->
    <PropertyGroup>
      <ResolveAssemblyReferencesStateFile Condition="'$(DisableRarCache)'!='true' and '$(ResolveAssemblyReferencesStateFile)' == ''">$(IntermediateOutputPath)$(MSBuildProjectFile)AssemblyReference.cache</ResolveAssemblyReferencesStateFile>
    </PropertyGroup>
    <!-- Make an App.Config item that exists when AutoUnify is false. -->
    <ItemGroup>
      <_ResolveAssemblyReferencesApplicationConfigFileForExes Include="@(AppConfigWithTargetPath)" Condition="'$(AutoGenerateBindingRedirects)'=='true' or '$(AutoUnifyAssemblyReferences)'=='false'" />
    </ItemGroup>
    <PropertyGroup>
      <!-- Default in task is true -->
      <_FindDependencies Condition="'$(BuildingProject)' != 'true' and '$(_ResolveReferenceDependencies)' != 'true'">false</_FindDependencies>
      <ResolveAssemblyReferencesSilent Condition="'$(ResolveAssemblyReferencesSilent)' == '' and '$(TraceDesignTime)' != 'true' and '$(BuildingProject)' == 'false'">true</ResolveAssemblyReferencesSilent>
      <ResolveAssemblyReferencesSilent Condition="'$(ResolveAssemblyReferencesSilent)' == ''">false</ResolveAssemblyReferencesSilent>
      <ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch Condition="'$(ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch)' == ''">Warning</ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch>
    </PropertyGroup>
    <ItemGroup>
      <!-- Remove any references which we have added as explicit reference so that we do not get duplicates. We need to make sure we do not have duplicates
             because this confuses the IDE  when it tries to compare the list of references passed in to the list of resolved references. If it does not match then the
             ide will show one of the references as not resolved, this will not break the build but is a display issue -->
      <Reference Remove="$(AdditionalExplicitAssemblyReferences)" />
      <Reference Include="$(AdditionalExplicitAssemblyReferences)">
        <Implicit>true</Implicit>
      </Reference>
    </ItemGroup>
    <!--
      Normally, as an optimization, finding dependencies of references marked with ExternallyResolved=true metadata is skipped.
      However, skipping that step breaks binding redirect generation when there are conflicting versions within the externally
      resolved graph.
    -->
    <PropertyGroup Condition="'$(FindDependenciesOfExternallyResolvedReferences)' == ''">
      <FindDependenciesOfExternallyResolvedReferences>false</FindDependenciesOfExternallyResolvedReferences>
      <FindDependenciesOfExternallyResolvedReferences Condition="'$(AutoGenerateBindingRedirects)' == 'true'">true</FindDependenciesOfExternallyResolvedReferences>
    </PropertyGroup>
    <ResolveAssemblyReference Assemblies="@(Reference)" AssemblyFiles="@(_ResolvedProjectReferencePaths);@(_ExplicitReference)" TargetFrameworkDirectories="@(_ReferenceInstalledAssemblyDirectory)" InstalledAssemblyTables="@(InstalledAssemblyTables);@(RedistList)" IgnoreDefaultInstalledAssemblyTables="$(IgnoreDefaultInstalledAssemblyTables)" IgnoreDefaultInstalledAssemblySubsetTables="$(IgnoreInstalledAssemblySubsetTables)" CandidateAssemblyFiles="@(Content);@(None)" SearchPaths="$(AssemblySearchPaths)" AllowedAssemblyExtensions="$(AllowedReferenceAssemblyFileExtensions)" AllowedRelatedFileExtensions="$(AllowedReferenceRelatedFileExtensions)" TargetProcessorArchitecture="$(ProcessorArchitecture)" AppConfigFile="@(_ResolveAssemblyReferencesApplicationConfigFileForExes)" AutoUnify="$(AutoUnifyAssemblyReferences)" SupportsBindingRedirectGeneration="$(GenerateBindingRedirectsOutputType)" IgnoreVersionForFrameworkReferences="$(IgnoreVersionForFrameworkReferences)" FindDependencies="$(_FindDependencies)" FindSatellites="$(BuildingProject)" FindSerializationAssemblies="$(BuildingProject)" FindRelatedFiles="$(BuildingProject)" Silent="$(ResolveAssemblyReferencesSilent)" TargetFrameworkVersion="$(TargetFrameworkVersion)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetFrameworkMonikerDisplayName="$(TargetFrameworkMonikerDisplayName)" TargetedRuntimeVersion="$(TargetedRuntimeVersion)" StateFile="$(ResolveAssemblyReferencesStateFile)" InstalledAssemblySubsetTables="@(InstalledAssemblySubsetTables)" TargetFrameworkSubsets="@(_ReferenceInstalledAssemblySubsets)" FullTargetFrameworkSubsetNames="$(FullReferenceAssemblyNames)" FullFrameworkFolders="$(_FullFrameworkReferenceAssemblyPaths)" FullFrameworkAssemblyTables="@(FullFrameworkAssemblyTables)" ProfileName="$(TargetFrameworkProfile)" LatestTargetFrameworkDirectories="@(LatestTargetFrameworkDirectories)" CopyLocalDependenciesWhenParentReferenceInGac="$(CopyLocalDependenciesWhenParentReferenceInGac)" DoNotCopyLocalIfInGac="$(DoNotCopyLocalIfInGac)" ResolvedSDKReferences="@(ResolvedSDKReference)" WarnOrErrorOnTargetArchitectureMismatch="$(ResolveAssemblyWarnOrErrorOnTargetArchitectureMismatch)" IgnoreTargetFrameworkAttributeVersionMismatch="$(ResolveAssemblyReferenceIgnoreTargetFrameworkAttributeVersionMismatch)" FindDependenciesOfExternallyResolvedReferences="$(FindDependenciesOfExternallyResolvedReferences)" ContinueOnError="$(ContinueOnError)" Condition="'@(Reference)'!='' or '@(_ResolvedProjectReferencePaths)'!='' or '@(_ExplicitReference)' != ''">
      <Output TaskParameter="ResolvedFiles" ItemName="ReferencePath" />
      <Output TaskParameter="ResolvedFiles" ItemName="_ResolveAssemblyReferenceResolvedFiles" />
      <Output TaskParameter="ResolvedDependencyFiles" ItemName="ReferenceDependencyPaths" />
      <Output TaskParameter="RelatedFiles" ItemName="_ReferenceRelatedPaths" />
      <Output TaskParameter="SatelliteFiles" ItemName="ReferenceSatellitePaths" />
      <Output TaskParameter="SerializationAssemblyFiles" ItemName="_ReferenceSerializationAssemblyPaths" />
      <Output TaskParameter="ScatterFiles" ItemName="_ReferenceScatterPaths" />
      <Output TaskParameter="CopyLocalFiles" ItemName="ReferenceCopyLocalPaths" />
      <Output TaskParameter="SuggestedRedirects" ItemName="SuggestedBindingRedirects" />
      <Output TaskParameter="FilesWritten" ItemName="FileWrites" />
      <Output TaskParameter="DependsOnSystemRuntime" PropertyName="DependsOnSystemRuntime" />
      <Output TaskParameter="DependsOnNETStandard" PropertyName="_DependsOnNETStandard" />
    </ResolveAssemblyReference>
  </Target>
  <!--
    ============================================================

                                        FindReferenceAssembliesForReferences

    Given the list of references, create a list of assemblies to pass to the compiler that
    includes reference assemblies rather than implementation assemblies where possible.

        [IN]
        @(ReferencePath) - List of assembly references as resolved paths with ReferenceAssembly metadata

        [OUT]
        @(ReferencePathWithRefAssemblies) - Paths to resolved reference (or implementation) assemblies.
    ============================================================
    -->
  <Target Name="FindReferenceAssembliesForReferences" DependsOnTargets="ResolveReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <!-- Reference assemblies are not produced in all cases, but it's easier to consume them
           if this metadatum is always populated. Ensure that it points to the implementation
           assembly unless already specified. -->
      <ReferencePath Condition="'%(ReferencePath.ReferenceAssembly)' == ''">
        <ReferenceAssembly>%(FullPath)</ReferenceAssembly>
      </ReferencePath>
      <ReferencePathWithRefAssemblies Include="@(ReferencePath->'%(ReferenceAssembly)')" Condition="'$(CompileUsingReferenceAssemblies)' != 'false'">
        <OriginalPath Condition="'%(ReferencePath.Identity)' != '@(ReferencePath->'%(ReferenceAssembly)')'">%(ReferencePath.Identity)</OriginalPath>
      </ReferencePathWithRefAssemblies>
      <ReferencePathWithRefAssemblies Include="@(ReferencePath)" Condition="'$(CompileUsingReferenceAssemblies)' == 'false'" />
    </ItemGroup>
  </Target>
  <!--
    ====================================================================================================

                                        GenerateBindingRedirects
    Inject the binding redirects into the app config file based on suggested redirects as output from
    ResolveAssemblyReferences.

        [IN]
        @(AppConfigWithTargetPath) - Path to the source app config file. This can be null if the project
                                     doesn't contain an app config file.
        $(TargetFileName) -          The file name of the build target.

        [OUT]
        @(OutputAppConfigFile) -     Path to the output app config file in the intermediate directory.

    ====================================================================================================
  -->
  <Target Name="GenerateBindingRedirects" Inputs="$(MSBuildAllProjects);@(AppConfigFile);$(ResolveAssemblyReferencesStateFile);$(IntermediateOutputPath);@(SuggestedBindingRedirects)" Outputs="$(_GenerateBindingRedirectsIntermediateAppConfig)" Condition="'$(AutoGenerateBindingRedirects)' == 'true' and '$(GenerateBindingRedirectsOutputType)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateBindingRedirects AppConfigFile="@(AppConfigWithTargetPath)" TargetName="$(TargetFileName).config" OutputAppConfigFile="$(_GenerateBindingRedirectsIntermediateAppConfig)" SuggestedRedirects="@(SuggestedBindingRedirects)">
      <Output TaskParameter="OutputAppConfigFile" ItemName="FileWrites" />
    </GenerateBindingRedirects>
  </Target>
  <!--
    ====================================================================================================

                                        GenerateBindingRedirectsUpdateAppConfig
    Updates the project to use the generated app.config content.  This needs to run regardless of
    inputs/outputs so it is seperate from GenerateBindingRedirects.
    ====================================================================================================
  -->
  <Target Name="GenerateBindingRedirectsUpdateAppConfig" AfterTargets="GenerateBindingRedirects" Condition="'$(AutoGenerateBindingRedirects)' == 'true' and '$(GenerateBindingRedirectsOutputType)' == 'true' and Exists('$(_GenerateBindingRedirectsIntermediateAppConfig)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <AppConfig>$(_GenerateBindingRedirectsIntermediateAppConfig)</AppConfig>
    </PropertyGroup>
    <ItemGroup>
      <AppConfigWithTargetPath Remove="@(AppConfigWithTargetPath)" />
      <AppConfigWithTargetPath Include="$(AppConfig)">
        <TargetPath>$(TargetFileName).config</TargetPath>
      </AppConfigWithTargetPath>
    </ItemGroup>
  </Target>
  <!--
    ===========================================================================================
                                        GetInstalledSDKs

    Gets the list of SDKs installed in the SDKDirectoryRoot and SDKRegistryRoot locations

    These paths are used by the ResolveSDKReference task and the ResolveAssemblyReference task.
    ===========================================================================================
  -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SDKReferenceRegistryRoot Condition="'$(SDKReferenceRegistryRoot)' == ''">Software\Microsoft\Microsoft SDKs</SDKReferenceRegistryRoot>
    <SDKReferenceDirectoryRoot Condition="'$(SDKReferenceDirectoryRoot)' == ''">$(LocalAppData)\Microsoft SDKs;$(MSBuildProgramFiles32)\Microsoft SDKs</SDKReferenceDirectoryRoot>
    <!-- Manifest driven extension SDK locations -->
    <SDKExtensionDirectoryRoot Condition="'$(SDKExtensionDirectoryRoot)' == '' and '$(SDKIdentifier)' != ''">$(MSBuildProgramFiles32)\Microsoft SDKs\Windows Kits\10;$(MSBuildProgramFiles32)\Windows Kits\10</SDKExtensionDirectoryRoot>
    <!-- UAP projects by default should support Windows 8.1 SDKs -->
    <SupportWindows81SDKs Condition="'$(SupportWindows81SDKs)' == '' and '$(Support81SDKs)' != 'false' and '$(TargetPlatformIdentifier)' == 'UAP'">true</SupportWindows81SDKs>
    <TargetPlatformIdentifierWindows81 Condition="'$(TargetPlatformIdentifierWindows81)' == '' and '$(SupportWindows81SDKs)' == 'true'">Windows</TargetPlatformIdentifierWindows81>
    <TargetPlatformVersionWindows81 Condition="'$(TargetPlatformVersionWindows81)' == '' and '$(SupportWindows81SDKs)' == 'true'">8.1</TargetPlatformVersionWindows81>
    <!-- Desktop and phone SDKs often have the exact same identifiers, don't enable phone by default -->
    <SupportWindowsPhone81SDKs Condition="'$(SupportWindowsPhone81SDKs)' == '' and '$(Support81SDKs)' != 'false' and '$(TargetPlatformIdentifier)' == 'UAP'">false</SupportWindowsPhone81SDKs>
    <TargetPlatformIdentifierWindowsPhone81 Condition="'$(TargetPlatformIdentifierWindowsPhone81)' == '' and '$(SupportWindowsPhone81SDKs)' == 'true'">WindowsPhoneApp</TargetPlatformIdentifierWindowsPhone81>
    <TargetPlatformVersionWindowsPhone81 Condition="'$(TargetPlatformVersionWindowsPhone81)' == '' and '$(SupportWindowsPhone81SDKs)' == 'true'">8.1</TargetPlatformVersionWindowsPhone81>
  </PropertyGroup>
  <Target Name="GetInstalledSDKLocations" Condition="'@(SDKReference)' != ''" DependsOnTargets="$(GetInstalledSDKLocationsDependsOn)" Returns="@(InstalledSDKLocations)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetInstalledSDKLocations SDKDirectoryRoots="$(SDKReferenceDirectoryRoot)" SDKExtensionDirectoryRoots="$(SDKExtensionDirectoryRoot)" SDKRegistryRoot="$(SDKReferenceRegistryRoot)" TargetPlatformVersion="$(TargetPlatformVersion)" TargetPlatformIdentifier="$(TargetPlatformIdentifier)">
      <Output TaskParameter="InstalledSDKs" ItemName="InstalledSDKLocations" />
    </GetInstalledSDKLocations>
    <!-- Also lookup 8.1 SDKs if requested -->
    <GetInstalledSDKLocations SDKDirectoryRoots="$(SDKReferenceDirectoryRoot)" SDKExtensionDirectoryRoots="" SDKRegistryRoot="$(SDKReferenceRegistryRoot)" TargetPlatformVersion="$(TargetPlatformVersionWindows81)" TargetPlatformIdentifier="$(TargetPlatformIdentifierWindows81)" Condition="'$(SupportWindows81SDKs)' == 'true' and '$(TargetPlatformIdentifierWindows81)' != '' and '$(TargetPlatformVersionWindows81)' != ''" WarnWhenNoSDKsFound="false">
      <Output TaskParameter="InstalledSDKs" ItemName="InstalledSDKLocations" />
    </GetInstalledSDKLocations>
    <GetInstalledSDKLocations SDKDirectoryRoots="$(SDKReferenceDirectoryRoot)" SDKExtensionDirectoryRoots="" SDKRegistryRoot="$(SDKReferenceRegistryRoot)" TargetPlatformVersion="$(TargetPlatformVersionWindowsPhone81)" TargetPlatformIdentifier="$(TargetPlatformIdentifierWindowsPhone81)" Condition="'$(SupportWindowsPhone81SDKs)' == 'true' and '$(TargetPlatformIdentifierWindowsPhone81)' != '' and '$(TargetPlatformVersionWindowsPhone81)' != ''" WarnWhenNoSDKsFound="false">
      <Output TaskParameter="InstalledSDKs" ItemName="InstalledSDKLocations" />
    </GetInstalledSDKLocations>
  </Target>
  <!--
    ============================================================

                                        ResolveSDKReferences

    Given a list of SDKReference items and a list of resolved winmd files which may contain metadata as to which sdk they came from
    we need to find the sdk root folders on disk and populate a ResolvedSDKReference item which has the full path to the SDK ROOT
    and the sdk identity as a piece of metadata.

        [IN]
        @(SDKReference) - List of sdk references (the identity in the sdk manifest file).
        @(ReferencePath) -List of resolved assemblies, we are interested in the ones which have IsWinMDFile set to true.

        [OUT]
        @(ResolvedSDKReference) - Full path to the root of the SDK
    ============================================================
  -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveSDKReferencesDependsOn>
      GetInstalledSDKLocations
    </ResolveSDKReferencesDependsOn>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetedSDKConfiguration Condition="'$(TargetedSDKConfiguration)' == '' and '_$(Configuration)' == '_Debug'">Debug</TargetedSDKConfiguration>
    <TargetedSDKConfiguration Condition="'$(TargetedSDKConfiguration)' == '' and '_$(Configuration)' == '_Release'">Retail</TargetedSDKConfiguration>
    <TargetedSDKConfiguration Condition="'$(TargetedSDKConfiguration)' == ''">Retail</TargetedSDKConfiguration>
    <TargetedSDKArchitecture Condition="'$(TargetedSDKArchitecture)' == ''">$(ProcessorArchitecture)</TargetedSDKArchitecture>
    <TargetedSDKArchitecture Condition="'$(TargetedSDKArchitecture)' == ''">Neutral</TargetedSDKArchitecture>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ShouldMarkCertainSDKReferencesAsRuntimeOnly Condition="'$(ShouldMarkCertainSDKReferencesAsRuntimeOnly)' == ''">true</ShouldMarkCertainSDKReferencesAsRuntimeOnly>
  </PropertyGroup>
  <ItemGroup Condition="'$(ShouldMarkCertainSDKReferencesAsRuntimeOnly)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Dependencies that are specified as runtime-only dependencies. Therefore the associated files are not used to build Appx package.  -->
    <!-- TODO: Do we need to do anything like this for the new SDK? -->
    <RuntimeReferenceOnlySDKDependencies Condition="'$(TargetPlatformVersion)' == '8.1'" Include="Microsoft.VCLibs, Version=11.0" />
  </ItemGroup>
  <Target Name="ResolveSDKReferences" Returns="@(ResolvedSDKReference)" DependsOnTargets="$(ResolveSDKReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveSDKReference SDKReferences="@(SDKReference)" RuntimeReferenceOnlySDKDependencies="@(RuntimeReferenceOnlySDKDependencies)" References="@(Reference)" TargetPlatformVersion="$(TargetPlatformVersion)" TargetPlatformIdentifier="$(TargetPlatformIdentifier)" WarnOnMissingPlatformVersion="$(SDKReferenceWarnOnMissingMaxPlatformVersion)" ProjectName="$(MSBuildProjectName)" TargetedSDKConfiguration="$(TargetedSDKConfiguration)" TargetedSDKArchitecture="$(TargetedSDKArchitecture)" InstalledSDKs="@(InstalledSDKLocations)" LogResolutionErrorsAsWarnings="$(LogSDKReferenceResolutionErrorsAsWarnings)" Prefer32Bit="$(Prefer32Bit)" ContinueOnError="$(ContinueOnError)" Condition="'@(SDKReference)'!=''">
      <Output TaskParameter="ResolvedSDKReferences" ItemName="ResolvedSDKReference" />
    </ResolveSDKReference>
  </Target>
  <Target Name="ResolveSDKReferencesDesignTime" Returns="@(ResolvedSDKReference)" DependsOnTargets="ResolveSDKReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================

                                        FindInvalidProjectReferences

    Find project to project references with target platform version higher than the one used by the current project and
    creates a list of invalid references to be unresolved. It issues a warning for each invalid reference.

        [IN]
        $(TargetPlatformVersion) - Project's target platform version
        @(_ProjectReferenceTargetPlatformMonikers) - List of monikers of all referenced projects gathered by the helper
                                                     target GetTargetPlatformMonikers.

        [OUT]
    @(InvalidProjectReferences) - List of invalid project references

    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <FindInvalidProjectReferencesDependsOn>
      GetReferenceTargetPlatformMonikers
    </FindInvalidProjectReferencesDependsOn>
  </PropertyGroup>
  <Target Name="FindInvalidProjectReferences" Condition="'$(FindInvalidProjectReferences)' == 'true'" DependsOnTargets="$(FindInvalidProjectReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <FindInvalidProjectReferences TargetPlatformVersion="$(TargetPlatformVersion)" TargetPlatformIdentifier="$(TargetPlatformIdentifier)" ProjectReferences="@(TargetPathWithTargetPlatformMoniker)">
      <Output TaskParameter="InvalidReferences" ItemName="InvalidProjectReferences" />
    </FindInvalidProjectReferences>
    <ItemGroup>
      <_ResolvedProjectReferencePaths Remove="@(InvalidProjectReferences)" />
    </ItemGroup>
  </Target>
  <Target Name="GetReferenceTargetPlatformMonikers" DependsOnTargets="PrepareProjectReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Targets="GetTargetPathWithTargetPlatformMoniker" BuildInParallel="$(BuildInParallel)" ContinueOnError="!$(BuildingProject)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="TargetPathWithTargetPlatformMoniker" />
    </MSBuild>
  </Target>
  <!--
    ============================================================

                       ExpandSDKReferences

        After we have resolved the sdk refrence we need to make sure that we automatically include the references which are part of the SDK (both winmd and dll)
        as part of the assemblies passed to the compiler.

        Project systems or project which do not want to reference all dlls or winmd files should override this target to do nothing.
   ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ExpandSDKReferencesDependsOn>
      ResolveSDKReferences
    </ExpandSDKReferencesDependsOn>
    <ExpandSDKAllowedReferenceExtensions Condition="'$(ExpandSDKAllowedReferenceExtensions)' == ''">
      .winmd;
      .dll
    </ExpandSDKAllowedReferenceExtensions>
  </PropertyGroup>
  <Target Name="ExpandSDKReferences" Returns="@(ReferencesFromSDK)" DependsOnTargets="$(ExpandSDKReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetSDKReferenceFiles ResolvedSDKReferences="@(ResolvedSDKReference)" ReferenceExtensions="$(ExpandSDKAllowedReferenceExtensions)" TargetSDKIdentifier="$(SDKIdentifier)" TargetSDKVersion="$(SDKVersion)" TargetPlatformIdentifier="$(TargetPlatformIdentifier)" TargetPlatformVersion="$(TargetPlatformVersion)" LogRedistFilesList="$(GetSDKReferenceFilesLogRedistFilesList)" LogRedistConflictWithinSDKAsWarning="$(GetSDKReferenceFilesLogRedistConflictsWithinSDKAsWarning)" LogRedistConflictBetweenSDKsAsWarning="$(GetSDKReferenceFilesLogRedistConflictsBetweenSDKsAsWarning)" LogReferencesList="$(GetSDKReferenceFilesLogReferencesList)" LogReferenceConflictWithinSDKAsWarning="$(GetSDKReferenceFilesLogReferenceConflictsWithinSDKAsWarning)" LogReferenceConflictBetweenSDKsAsWarning="$(GetSDKReferenceFilesLogReferenceConflictsBetweenSDKsAsWarning)" CacheFileFolderPath="$(GetSDKReferenceFilesCacheFolder)" LogCacheFileExceptions="$(GetSDKReferenceFilesLogCacheFileExceptions)" Condition="'@(ResolvedSDKReference)'!=''">
      <Output TaskParameter="References" ItemName="ReferencePath" />
      <Output TaskParameter="References" ItemName="ReferencesFromSDK" />
      <Output TaskParameter="References" ItemName="_ResolveAssemblyReferenceResolvedFiles" />
      <Output TaskParameter="CopyLocalFiles" ItemName="ReferenceCopyLocalPaths" />
      <Output TaskParameter="RedistFiles" ItemName="ResolvedRedistFiles" />
    </GetSDKReferenceFiles>
  </Target>
  <!--
    ============================================================

                                        ExportWindowsMDFile

    When a project is generating a a winmd file through c# or vb, ect the compiler will create a WinMDModule file. This file needs to be run
    through the winmdexp tool in order to generate the resulting WinMD file.

    ===========================================================
    -->
  <Target Name="ExportWindowsMDFile" DependsOnTargets="Compile" Condition="'$(ExportWinMDFile)' == 'true'" Inputs="@(IntermediateAssembly);@(DocFileItem);@(_DebugSymbolsIntermediatePath);@(ReferencePathWithRefAssemblies);$(MSBuildAllProjects)" Outputs="$(_IntermediateWindowsMetadataPath);$(WinMDExpOutputPdb);$(WinMDOutputDocumentationFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- Will be copied by the "copy WinMD artifacts" step instead -->
      <CopyBuildOutputToOutputDirectory>false</CopyBuildOutputToOutputDirectory>
      <CopyOutputSymbolsToOutputDirectory>false</CopyOutputSymbolsToOutputDirectory>
      <WinMdExpToolPath Condition="'$(WinMdExpToolPath)' == ''">$(TargetFrameworkSDKToolsDirectory)</WinMdExpToolPath>
      <WinMdExpUTF8Ouput Condition="'$(WinMdExpUTF8Ouput)' == ''">true</WinMdExpUTF8Ouput>
    </PropertyGroup>
    <WinMDExp WinMDModule="@(IntermediateAssembly)" References="@(ReferencePathWithRefAssemblies)" DisabledWarnings="$(WinMdExpNoWarn)" InputDocumentationFile="@(DocFileItem)" OutputDocumentationFile="$(WinMDOutputDocumentationFile)" TreatWarningsAsErrors="$(TreatWarningsAsErrors)" InputPDBFile="@(_DebugSymbolsIntermediatePath)" OutputPDBFile="$(WinMDExpOutputPdb)" OutputWindowsMetadataFile="$(_IntermediateWindowsMetadataPath)" EnvironmentVariables="$(WinMDExpEnvironment)" UTF8Output="$(WinMdExpUTF8Ouput)" SdkToolsPath="$(WinMdExpToolPath)" AssemblyUnificationPolicy="$(WinMDExpAssemblyUnificationPolicy)">
      <Output TaskParameter="OutputWindowsMetadataFile" ItemName="FileWrites" />
    </WinMDExp>
    <ItemGroup>
      <WinMDExpArtifacts Include="$(_IntermediateWindowsMetadataPath)" />
      <WinMDExpArtifacts Include="$(WinMDOutputDocumentationFile)" />
      <WinMDExpArtifacts Include="$(WinMDExpOutputPdb)" />
      <FileWrites Include="$(WinMDOutputDocumentationFile);$(WinMDExpOutputPdb)" />
    </ItemGroup>
  </Target>
  <Target Name="ResolveAssemblyReferencesDesignTime" Returns="@(_ReferencesFromRAR)" DependsOnTargets="ResolveProjectReferences;ResolveAssemblyReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- We need to do this here because we only want references which have been passed into rar but are not project to project references. -->
    <ItemGroup>
      <_ReferencesFromRAR Include="@(ReferencePath-&gt;WithMetadataValue('ReferenceSourceTarget', 'ResolveAssemblyReference'))" />
    </ItemGroup>
  </Target>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectDesignTimeAssemblyResolutionSearchPaths Condition=" '$(ProjectDesignTimeAssemblyResolutionSearchPaths)' == '' ">
      {CandidateAssemblyFiles};
      $(ReferencePath);
      {HintPathFromItem};
      {TargetFrameworkDirectory};
      {Registry:$(FrameworkRegistryBase),$(TargetFrameworkVersion),$(AssemblyFoldersSuffix)$(AssemblyFoldersExConditions)};
      {RawFileName};
      $(TargetDir)
    </ProjectDesignTimeAssemblyResolutionSearchPaths>
  </PropertyGroup>
  <!--
    ==============================================================

                                       DesignTimeResolveAssemblyReferences

    Given the list of assemblies, resolve their reference paths.
    This target is called by Visual Studio at run time in order to filter references
    according to the targeted framework.

        [IN]
        @(DesignTimeReference) - List of assembly references as simple/fusion names.


        [OUT]
        @(ReferencePath) - Paths to resolved primary files.

    ==============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DesignTimeResolveAssemblyReferencesDependsOn>
      GetFrameworkPaths;
      GetReferenceAssemblyPaths;
      ResolveReferences
    </DesignTimeResolveAssemblyReferencesDependsOn>
  </PropertyGroup>
  <Target Name="DesignTimeResolveAssemblyReferences" Condition="'$(DesignTimeReference)'!=''" DependsOnTargets="$(DesignTimeResolveAssemblyReferencesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_DesignTimeReferenceInstalledAssemblyDirectory Include="$(TargetFrameworkDirectory)" />
    </ItemGroup>
    <PropertyGroup>
      <DesignTimeResolveAssemblyReferencesStateFile Condition="'$(DisableRarCache)'!='true'">$(IntermediateOutputPath)$(MSBuildProjectFile)DesignTimeResolveAssemblyReferences.cache</DesignTimeResolveAssemblyReferencesStateFile>
    </PropertyGroup>
    <PropertyGroup>
      <DesignTimeAssemblySearchPaths Condition=" '$(DesignTimeAssemblySearchPaths)' == '' ">
        {CandidateAssemblyFiles};
        $(ReferencePath);
        {HintPathFromItem};
        {TargetFrameworkDirectory};
        {Registry:$(FrameworkRegistryBase),$(TargetFrameworkVersion),$(AssemblyFoldersSuffix)$(AssemblyFoldersExConditions)};
        {RawFileName};
        $(OutDir)
      </DesignTimeAssemblySearchPaths>
    </PropertyGroup>
    <PropertyGroup>
      <DesignTimeFindDependencies Condition=" '$(DesignTimeFindDependencies)' == '' ">false</DesignTimeFindDependencies>
      <DesignTimeIgnoreVersionForFrameworkReferences Condition=" '$(DesignTimeIgnoreVersionForFrameworkReferences)' == '' ">false</DesignTimeIgnoreVersionForFrameworkReferences>
      <DesignTimeFindSatellites Condition=" '$(DesignTimeFindSatellites)' == '' ">false</DesignTimeFindSatellites>
      <DesignTimeFindSerializationAssemblies Condition=" '$(DesignTimeFindSerializationAssemblies)' == '' ">false</DesignTimeFindSerializationAssemblies>
      <DesignTimeFindRelatedFiles Condition=" '$(DesignTimeFindRelatedFiles)' == '' ">false</DesignTimeFindRelatedFiles>
      <DesignTimeSilentResolution Condition=" '$(DesignTimeSilentResolution)' == '' and '$(TraceDesignTime)' != 'true'">true</DesignTimeSilentResolution>
      <DesignTimeAutoUnify Condition="'$(DesignTimeAutoUnify)' == ''">false</DesignTimeAutoUnify>
    </PropertyGroup>
    <ItemGroup>
      <_DesignTimeReferenceAssemblies Include="$(DesignTimeReference)" />
    </ItemGroup>
    <ItemGroup>
      <_RARResolvedReferencePath Include="@(ReferencePath)" />
      <ReferencePath Remove="@(ReferencePath)" />
    </ItemGroup>
    <ResolveAssemblyReference Assemblies="@(_DesignTimeReferenceAssemblies)" TargetFrameworkDirectories="@(_DesignTimeReferenceInstalledAssemblyDirectory)" SearchPaths="$(DesignTimeAssemblySearchPaths)" AllowedAssemblyExtensions="$(AllowedReferenceAssemblyFileExtensions)" TargetProcessorArchitecture="$(ProcessorArchitecture)" CandidateAssemblyFiles="@(Content);@(None);@(_RARResolvedReferencePath)" FindDependencies="$(DesignTimeFindDependencies)" AutoUnify="$(DesignTimeAutoUnify)" IgnoreVersionForFrameworkReferences="$(DesignTimeIgnoreVersionForFrameworkReferences)" FindSatellites="$(DesignTimeFindSatellites)" FindSerializationAssemblies="$(DesignTimeFindSerializationAssemblies)" FindRelatedFiles="$(DesignTimeFindRelatedFiles)" Silent="$(DesignTimeSilentResolution)" TargetFrameworkVersion="$(TargetFrameworkVersion)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetFrameworkMonikerDisplayName="$(TargetFrameworkMonikerDisplayName)" TargetedRuntimeVersion="$(TargetedRuntimeVersion)" StateFile="$(DesignTimeResolveAssemblyReferencesStateFile)" InstalledAssemblySubsetTables="@(InstalledAssemblySubsetTables)" IgnoreDefaultInstalledAssemblySubsetTables="$(IgnoreInstalledAssemblySubsetTables)" TargetFrameworkSubsets="@(_ReferenceInstalledAssemblySubsets)" FullTargetFrameworkSubsetNames="$(FullReferenceAssemblyNames)" FullFrameworkFolders="$(_FullFrameworkReferenceAssemblyPaths)" FullFrameworkAssemblyTables="@(FullFrameworkAssemblyTables)" ProfileName="$(TargetFrameworkProfile)" ResolvedSDKReferences="@(ResolvedSDKReference)" IgnoreTargetFrameworkAttributeVersionMismatch="$(DesignTimeIgnoreTargetFrameworkAttributeVersionMismatch)">
      <Output TaskParameter="ResolvedFiles" ItemName="DesignTimeReferencePath" />
      <Output TaskParameter="FilesWritten" ItemName="FileWrites" />
    </ResolveAssemblyReference>
  </Target>
  <!--
    ============================================================
                                        ResolveComReferences

    Resolve COM references

        [IN]
        @(COMReference) - The list of COM references
        $(BaseIntermediateOutputPath) - The output directory in which to generate wrapper assemblies

        [OUT]
        @(ReferencePath) - Paths to referenced wrappers.

        If ResolveComReferences is invoked from the IDE, PrepareForBuild may need to run to create directories.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ComReferenceExecuteAsTool Condition="'$(ComReferenceExecuteAsTool)'==''">false</ComReferenceExecuteAsTool>
  </PropertyGroup>
  <Target Name="ResolveComReferences" Condition="'@(COMReference)'!='' or '@(COMFileReference)'!=''" Returns="@(ReferencePath)" DependsOnTargets="PrepareForBuild;ResolveKeySource;ResolveAssemblyReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition=" '$(InteropOutputPath)' == '' ">
      <InteropOutputPath>$(IntermediateOutputPath)</InteropOutputPath>
    </PropertyGroup>
    <MakeDir Directories="$(InteropOutputPath)" />
    <!--
        Note: This task should not be batched, since it relies on having all the COM references fed into it at once.
        -->
    <PropertyGroup>
      <ResolveComReferenceMSBuildArchitecture Condition="'$(ResolveComReferenceMSBuildArchitecture)' == ''">$(PlatformTargetAsMSBuildArchitecture)</ResolveComReferenceMSBuildArchitecture>
      <ResolveComReferenceToolPath Condition="'$(ResolveComReferenceToolPath)' == ''">$(TargetFrameworkSDKToolsDirectory)</ResolveComReferenceToolPath>
      <ResolveComReferenceSilent Condition="'$(ResolveComReferenceSilent)' == ''">false</ResolveComReferenceSilent>
    </PropertyGroup>
    <ResolveComReference TypeLibNames="@(COMReference)" TypeLibFiles="@(COMFileReference)" ResolvedAssemblyReferences="@(ReferencePath)" WrapperOutputDirectory="$(InteropOutputPath)" IncludeVersionInInteropName="$(IncludeVersionInInteropName)" KeyContainer="$(KeyContainerName)" KeyFile="$(KeyOriginatorFile)" DelaySign="$(DelaySign)" StateFile="@(_ResolveComReferenceCache)" TargetFrameworkVersion="$(TargetFrameworkVersion)" TargetProcessorArchitecture="$(ProcessorArchitecture)" NoClassMembers="$(ComReferenceNoClassMembers)" Silent="$(ResolveComReferenceSilent)" EnvironmentVariables="$(ResolveComReferenceEnvironment)" SdkToolsPath="$(ResolveComReferenceToolPath)" ExecuteAsTool="$(ComReferenceExecuteAsTool)" MSBuildArchitecture="$(ResolveComReferenceMSBuildArchitecture)" ContinueOnError="$(ContinueOnError)">
      <Output TaskParameter="ResolvedFiles" ItemName="ReferencePath" />
      <Output TaskParameter="ResolvedFiles" ItemName="ComReferenceWrappers" />
      <Output TaskParameter="ResolvedFiles" ItemName="FileWrites" />
      <!-- This output list only includes items with Isolated attribute set to True.  It's done by the task itself. -->
      <Output TaskParameter="ResolvedModules" ItemName="ResolvedIsolatedComModules" />
    </ResolveComReference>
    <ItemGroup>
      <FileWrites Include="@(_ResolveComReferenceCache)" />
      <ReferenceComWrappersToCopyLocal Include="@(ComReferenceWrappers)" Condition="'%(ComReferenceWrappers.CopyLocal)'!='false'" />
    </ItemGroup>
  </Target>
  <Target Name="ResolveComReferencesDesignTime" Returns="@(ComReferenceWrappers)" DependsOnTargets="ResolveComReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                PrepareResources Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        PrepareResources

    Prepare resources for the Compile step.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PrepareResourcesDependsOn>
      PrepareResourceNames;
      ResGen;
      CompileLicxFiles
    </PrepareResourcesDependsOn>
  </PropertyGroup>
  <Target Name="PrepareResources" DependsOnTargets="$(PrepareResourcesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        PrepareResourceNames

    Prepare the names of resource files.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PrepareResourceNamesDependsOn>
      AssignTargetPaths;
      SplitResourcesByCulture;
      CreateManifestResourceNames;
      CreateCustomManifestResourceNames
    </PrepareResourceNamesDependsOn>
  </PropertyGroup>
  <Target Name="PrepareResourceNames" DependsOnTargets="$(PrepareResourceNamesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AssignTargetPaths

    This target creates <TargetPath> tags for items. <TargetPath> is a relative folder plus filename
    for the destination of this item.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AssignTargetPathsDependsOn />
  </PropertyGroup>
  <Target Name="AssignTargetPaths" DependsOnTargets="$(AssignTargetPathsDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_Temporary Remove="@(_Temporary)" />
    </ItemGroup>
    <!-- AssignTargetPath generates TargetPath metadata that is consumed by CreateManifestResourceNames target for manifest name generation -->
    <AssignTargetPath Files="@(EmbeddedResource)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="_Temporary" />
    </AssignTargetPath>
    <ItemGroup>
      <!-- Replace items in EmbeddedResource with the items emitted by the AssignTargetPath task that have the TargetPath metadata -->
      <EmbeddedResource Remove="@(_Temporary)" />
      <EmbeddedResource Include="@(_Temporary)" />
      <_Temporary Remove="@(_Temporary)" />
    </ItemGroup>
    <AssignTargetPath Files="@(Content)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="ContentWithTargetPath" />
    </AssignTargetPath>
    <AssignTargetPath Files="@(None)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="_NoneWithTargetPath" />
    </AssignTargetPath>
    <AssignTargetPath Files="@(BaseApplicationManifest)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="_DeploymentBaseManifestWithTargetPath" />
    </AssignTargetPath>
    <AssignTargetPath Files="@(None)" RootFolder="$(MSBuildProjectDirectory)" Condition="'@(_DeploymentBaseManifestWithTargetPath)'=='' and '%(None.Extension)'=='.manifest'">
      <Output TaskParameter="AssignedFiles" ItemName="_DeploymentBaseManifestWithTargetPath" />
    </AssignTargetPath>
  </Target>
  <!--
    ============================================================
                                        GetItemTargetPaths

    This target returns all items that have TargetPath metadata assigned by the AssignTargetPaths target.
    ============================================================
    -->
  <Target Name="GetItemTargetPaths" DependsOnTargets="AssignTargetPaths" Returns="       @(EmbeddedResource);       @(ContentWithTargetPath);       @(_NoneWithTargetPath);       @(_DeploymentBaseManifestWithTargetPath);       " xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        SplitResourcesByCulture

    Split EmbeddedResource items into five lists based on whether
    they are resx files, licx files or other resources and whether they should be localized. Also adds Type and Culture
    metadata. Type indicates whether the resource is "Resx" or "Non-Resx".

        [IN]/[OUT]
        @(EmbeddedResource) - The raw list of resources.

        [OUT]
        @(_LicxFile) - The EmbeddedResource items with extension equal to '.licx'.
    ============================================================
    -->
  <Target Name="SplitResourcesByCulture" DependsOnTargets="AssignTargetPaths" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Warning Condition="'@(ResxWithNoCulture)'!=''" Code="MSB9000" Text="ResxWithNoCulture item type is deprecated. Use EmbeddedResource items instead." />
    <Warning Condition="'@(ResxWithCulture)'!=''" Code="MSB9001" Text="ResxWithCulture item type is deprecated. Use EmbeddedResource items instead." />
    <Warning Condition="'@(NonResxWithCulture)'!=''" Code="MSB9002" Text="NonResxWithCulture item type is deprecated. Use EmbeddedResource items instead." />
    <Warning Condition="'@(NonResxWithNoCulture)'!=''" Code="MSB9003" Text="NonResxWithNoCulture item type is deprecated. Use EmbeddedResource items instead." />
    <ItemGroup>
      <_LicxFile Include="@(EmbeddedResource)" Condition="'%(Extension)'=='.licx'" />
      <!-- CONSUMED FOR COMPATIBILITY REASONS ONLY. EMIT EMBEDDEDRESOURCE INSTEAD -->
      <EmbeddedResource Include="@(ResxWithNoCulture);@(ResxWithCulture)">
        <Type>Resx</Type>
      </EmbeddedResource>
      <EmbeddedResource Include="@(NonResxWithCulture);@(NonResxWithNoCulture)">
        <Type>Non-Resx</Type>
      </EmbeddedResource>
    </ItemGroup>
    <AssignCulture Files="@(EmbeddedResource)" Condition="'%(Extension)'!='.licx'">
      <!-- Create the list of culture resx and embedded resource files -->
      <Output TaskParameter="AssignedFilesWithCulture" ItemName="_MixedResourceWithCulture" />
      <!-- Create the list of non-culture resx and embedded resource files -->
      <Output TaskParameter="AssignedFilesWithNoCulture" ItemName="_MixedResourceWithNoCulture" />
    </AssignCulture>
    <ItemGroup>
      <!-- Remove EmbeddedResource items that we have processed already
                 i.e. either Licx, or resources that don't have culture info -->
      <EmbeddedResource Remove="@(_MixedResourceWithCulture)" />
      <EmbeddedResource Remove="@(_MixedResourceWithNoCulture)" />
      <EmbeddedResource Remove="@(_LicxFile)" />
      <!-- Add back everything except Licx, so that we have culture info -->
      <EmbeddedResource Include="@(_MixedResourceWithNoCulture);@(_MixedResourceWithCulture)" Condition="'%(Extension)'=='.resx' or '%(Extension)'=='.restext'">
        <Type Condition="'%(_MixedResourceWithNoCulture.Type)'=='' and '%(_MixedResourceWithCulture.Type)'==''">Resx</Type>
      </EmbeddedResource>
      <EmbeddedResource Include="@(_MixedResourceWithNoCulture);@(_MixedResourceWithCulture)" Condition="'%(Extension)'!='.resx' and '%(Extension)'!='.restext'">
        <Type Condition="'%(_MixedResourceWithNoCulture.Type)'=='' and '%(_MixedResourceWithCulture.Type)'==''">Non-Resx</Type>
      </EmbeddedResource>
      <!-- EMITTED FOR COMPATIBILITY REASONS ONLY. CONSUME EMBEDDEDRESOURCE INSTEAD -->
      <ResxWithNoCulture Remove="@(ResxWithNoCulture)" />
      <NonResxWithNoCulture Remove="@(NonResxWithNoCulture)" />
      <ResxWithCulture Remove="@(ResxWithCulture)" />
      <NonResxWithCulture Remove="@(NonResxWithCulture)" />
      <ResxWithNoCulture Include="@(_MixedResourceWithNoCulture)" Condition="'%(WithCulture)'=='false' and ('%(Extension)'=='.resx' or '%(Extension)'=='.restext')" />
      <NonResxWithNoCulture Include="@(_MixedResourceWithNoCulture)" Condition="'%(WithCulture)'=='false' and ('%(Extension)'!='.resx' and '%(Extension)'!='.restext')" />
      <ResxWithCulture Include="@(_MixedResourceWithCulture)" Condition="'%(WithCulture)'=='true' and ('%(Extension)'=='.resx' or '%(Extension)'=='.restext')" />
      <NonResxWithCulture Include="@(_MixedResourceWithCulture)" Condition="'%(WithCulture)'=='true' and ('%(Extension)'!='.resx' and '%(Extension)'!='.restext')" />
      <!-- Clean up temporary lists -->
      <_MixedResourceWithNoCulture Remove="@(_MixedResourceWithNoCulture)" />
      <_MixedResourceWithCulture Remove="@(_MixedResourceWithCulture)" />
    </ItemGroup>
  </Target>
  <!--
    =======================================================================
                                        CreateCustomManifestResourceNames

    Allows custom manifest resource name generation tasks to plug
    into the build process
    =======================================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CreateCustomManifestResourceNamesDependsOn />
  </PropertyGroup>
  <Target Name="CreateCustomManifestResourceNames" DependsOnTargets="$(CreateCustomManifestResourceNamesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        ResGen

    Run GenerateResource on the given resx files.

    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResGenDependsOn>ResolveAssemblyReferences;SplitResourcesByCulture;BeforeResGen;CoreResGen;AfterResGen</ResGenDependsOn>
    <CoreResGenDependsOn>FindReferenceAssembliesForReferences</CoreResGenDependsOn>
    <UseSourcePath Condition="'$(UseSourcePath)'==''">true</UseSourcePath>
    <ResGenExecuteAsTool Condition="'$(ResGenExecuteAsTool)'==''">false</ResGenExecuteAsTool>
  </PropertyGroup>
  <Target Name="ResGen" DependsOnTargets="$(ResGenDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BeforeResGen

    Redefine this target in your project in order to run tasks just before Resgen.
    ============================================================
    -->
  <Target Name="BeforeResGen" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterResGen

    Redefine this target in your project in order to run tasks just after Resgen.
    ============================================================
    -->
  <Target Name="AfterResGen" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        CoreResGen
    ============================================================
    -->
  <Target Name="CoreResGen" DependsOnTargets="$(CoreResGenDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_Temporary Remove="@(_Temporary)" />
    </ItemGroup>
    <PropertyGroup>
      <GenerateResourceMSBuildArchitecture Condition="'$(GenerateResourceMSBuildArchitecture)' == ''">$(PlatformTargetAsMSBuildArchitecture)</GenerateResourceMSBuildArchitecture>
      <ResgenToolPath Condition="'$(ResgenToolPath)' == ''">$(TargetFrameworkSDKToolsDirectory)</ResgenToolPath>
    </PropertyGroup>
    <PropertyGroup Condition="'$(TargetFrameworkAsMSBuildRuntime)' != '' and '$(GenerateResourceMSBuildArchitecture)' != ''">
      <!-- In the general case, we want to fail to run the task if the task host it's requesting doesn't exist, because we'd rather let the
           user know there's something wrong than just silently generate something that's probably not quite right. However, in a few
           circumstances, there are tasks that are already aware of runtime / bitness concerns, in which case even if we go ahead and run
           the more recent version of the task, it should be able to generate something correct.  GenerateResource is one such task, so
           we check for the existence of the targeted task host so that we can use it preferentially, but if it can't be found, we'll fall
           back to the current task since it's still mostly correct.

           In particular, we need to do this because otherwise people with Dev10 on a machine that they upgrade to Win8 will be broken:
           they'll have ResGen from the 7.0A SDK installed, so launching ResGen will still work, but the CLR2 task host is only installed by
           the 8.0A SDK, which they won't have installed, and thus without this fallback mechanism, their projects targeting v3.5 will
           suddenly start failing to build.-->
      <GenerateResourceMSBuildRuntime Condition="'$(GenerateResourceMSBuildRuntime)' == '' and                      $([MSBuild]::DoesTaskHostExist(`$(TargetFrameworkAsMSBuildRuntime)`, `$(GenerateResourceMSBuildArchitecture)`))">$(TargetFrameworkAsMSBuildRuntime)</GenerateResourceMSBuildRuntime>
      <!-- If the targeted runtime doesn't exist, fall back to current -->
      <GenerateResourceMSBuildRuntime Condition="'$(GenerateResourceMSBuildRuntime)' == ''">CurrentRuntime</GenerateResourceMSBuildRuntime>
    </PropertyGroup>
    <!-- 4.0 task has some new parameters that we want to make use of if we're targeting 4.0 -->
    <GenerateResource Sources="@(EmbeddedResource)" UseSourcePath="$(UseSourcePath)" References="@(ReferencePathWithRefAssemblies)" AdditionalInputs="$(MSBuildAllProjects)" NeverLockTypeAssemblies="$(GenerateResourceNeverLockTypeAssemblies)" StateFile="$(IntermediateOutputPath)$(MSBuildProjectFile).GenerateResource.cache" StronglyTypedClassName="%(EmbeddedResource.StronglyTypedClassName)" StronglyTypedFileName="%(EmbeddedResource.StronglyTypedFileName)" StronglyTypedLanguage="%(EmbeddedResource.StronglyTypedLanguage)" StronglyTypedNamespace="%(EmbeddedResource.StronglyTypedNamespace)" StronglyTypedManifestPrefix="%(EmbeddedResource.StronglyTypedManifestPrefix)" PublicClass="%(EmbeddedResource.PublicClass)" OutputResources="@(EmbeddedResource->'$(IntermediateOutputPath)%(ManifestResourceName).resources')" Condition="'%(EmbeddedResource.Type)' == 'Resx' and '%(EmbeddedResource.GenerateResource)' != 'false' and '$(GenerateResourceMSBuildRuntime)' != 'CLR2'" SdkToolsPath="$(ResgenToolPath)" ExecuteAsTool="$(ResGenExecuteAsTool)" EnvironmentVariables="$(ResGenEnvironment)" MSBuildRuntime="$(GenerateResourceMSBuildRuntime)" MSBuildArchitecture="$(GenerateResourceMSBuildArchitecture)">
      <Output TaskParameter="FilesWritten" ItemName="FileWrites" />
      <Output TaskParameter="StronglyTypedFileName" ItemName="Compile" />
      <!-- Gather Sources as an output since it will contain OutputResource metadata indicating the final output resource that it was compiled into -->
      <Output TaskParameter="Sources" ItemName="_Temporary" />
    </GenerateResource>
    <!-- But we can't use those parameters if we're targeting 3.5, since we're using the 3.5 task -->
    <GenerateResource Sources="@(EmbeddedResource)" UseSourcePath="$(UseSourcePath)" References="@(ReferencePath)" AdditionalInputs="$(MSBuildAllProjects)" NeverLockTypeAssemblies="$(GenerateResourceNeverLockTypeAssemblies)" StateFile="$(IntermediateOutputPath)$(MSBuildProjectFile).GenerateResource.cache" StronglyTypedClassName="%(EmbeddedResource.StronglyTypedClassName)" StronglyTypedFileName="%(EmbeddedResource.StronglyTypedFileName)" StronglyTypedLanguage="%(EmbeddedResource.StronglyTypedLanguage)" StronglyTypedNamespace="%(EmbeddedResource.StronglyTypedNamespace)" StronglyTypedManifestPrefix="%(EmbeddedResource.StronglyTypedManifestPrefix)" PublicClass="%(EmbeddedResource.PublicClass)" OutputResources="@(EmbeddedResource->'$(IntermediateOutputPath)%(ManifestResourceName).resources')" MSBuildRuntime="$(GenerateResourceMSBuildRuntime)" MSBuildArchitecture="$(GenerateResourceMSBuildArchitecture)" Condition="'%(EmbeddedResource.Type)' == 'Resx' and '%(EmbeddedResource.GenerateResource)' != 'false' and '$(GenerateResourceMSBuildRuntime)' == 'CLR2'">
      <Output TaskParameter="FilesWritten" ItemName="FileWrites" />
      <Output TaskParameter="StronglyTypedFileName" ItemName="Compile" />
      <!-- Gather Sources as an output since it will contain OutputResource metadata indicating the final output resource that it was compiled into -->
      <Output TaskParameter="Sources" ItemName="_Temporary" />
    </GenerateResource>
    <ItemGroup>
      <EmbeddedResource Remove="@(_Temporary)" />
      <!-- Add back the Sources list (with OutputResource metadata) that we output from GenerateResource into EmbeddedResource -->
      <EmbeddedResource Include="@(_Temporary)" />
      <_Temporary Remove="@(_Temporary)" />
      <!-- EMITTED FOR COMPATIBILITY REASONS ONLY. CONSUME EMBEDDEDRESOURCE INSTEAD -->
      <ManifestResourceWithNoCulture Include="@(EmbeddedResource->'%(OutputResource)')" Condition="'%(EmbeddedResource.WithCulture)'=='false' and '%(EmbeddedResource.Type)' == 'Resx'">
        <EmittedForCompatibilityOnly>true</EmittedForCompatibilityOnly>
      </ManifestResourceWithNoCulture>
      <ManifestNonResxWithNoCultureOnDisk Include="@(EmbeddedResource)" Condition="'%(EmbeddedResource.WithCulture)'=='false' and '%(EmbeddedResource.Type)' == 'Non-Resx'">
        <EmittedForCompatibilityOnly>true</EmittedForCompatibilityOnly>
      </ManifestNonResxWithNoCultureOnDisk>
      <!-- EMITTED FOR COMPATIBILITY REASONS ONLY. CONSUME EMBEDDEDRESOURCE INSTEAD -->
      <ManifestResourceWithCulture Include="@(EmbeddedResource->'%(OutputResource)')" Condition="'%(EmbeddedResource.WithCulture)'=='true' and '%(EmbeddedResource.Type)' == 'Resx'">
        <EmittedForCompatibilityOnly>true</EmittedForCompatibilityOnly>
      </ManifestResourceWithCulture>
      <ManifestNonResxWithCultureOnDisk Include="@(EmbeddedResource)" Condition="'%(EmbeddedResource.WithCulture)'=='true' and '%(EmbeddedResource.Type)' == 'Non-Resx'">
        <EmittedForCompatibilityOnly>true</EmittedForCompatibilityOnly>
      </ManifestNonResxWithCultureOnDisk>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        CompileLicxFiles

    Compile .licx files (containing information about licensed controls used by the application) into .licenses files.

        [IN]
        @(_LicxFile) - The list of .licx files in the project (usually there will be just one)

        [OUT]
        @(CompiledLicenseFile) - The list of compiled .licenses files (there will be just one)
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CompileLicxFilesDependsOn />
  </PropertyGroup>
  <Target Name="CompileLicxFiles" Condition="'@(_LicxFile)'!=''" DependsOnTargets="$(CompileLicxFilesDependsOn)" Inputs="$(MSBuildAllProjects);@(_LicxFile);@(ReferencePathWithRefAssemblies);@(ReferenceDependencyPaths)" Outputs="$(IntermediateOutputPath)$(TargetFileName).licenses" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <LCMSBuildArchitecture Condition="'$(LCMSBuildArchitecture)' == ''">$(PlatformTargetAsMSBuildArchitecture)</LCMSBuildArchitecture>
    </PropertyGroup>
    <LC Sources="@(_LicxFile)" LicenseTarget="$(TargetFileName)" OutputDirectory="$(IntermediateOutputPath)" OutputLicense="$(IntermediateOutputPath)$(TargetFileName).licenses" ReferencedAssemblies="@(ReferencePathWithRefAssemblies);@(ReferenceDependencyPaths)" NoLogo="$(NoLogo)" ToolPath="$(LCToolPath)" SdkToolsPath="$(TargetFrameworkSDKToolsDirectory)" EnvironmentVariables="$(LCEnvironment)" MSBuildArchitecture="$(LCMSBuildArchitecture)" TargetFrameworkVersion="$(TargetFrameworkVersion)">
      <Output TaskParameter="OutputLicense" ItemName="CompiledLicenseFile" />
      <Output TaskParameter="OutputLicense" ItemName="FileWrites" />
    </LC>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                ResolveKeySource Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        ResolveKeySource

    Resolve the strong name key used to sign the assembly as well as the certificate used to
    sign the ClickOnce manifests.

        [IN]
        $(AssemblyOriginatorKeyFile)     - The file used to sign the assembly (.snk or .pfx)
        $(ManifestCertificateThumbprint) - The thumbprint used to locate the certificate in the
                                           user's certificate store.
        $(ManifestKeyFile)               - The key file that contains the certificate in case the
                                           certificate is not in the user's store.

        [OUT]
        $(ResolvedAssemblyKeyFile)        - Key used to sign the assembly
        $(_DeploymentResolvedManifestCertificateThumbprint) - Certificate used to sign the manifests
    ============================================================
    -->
  <Target Name="ResolveKeySource" Condition="$(SignManifests) == 'true' or $(SignAssembly) == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveKeySource KeyFile="$(AssemblyOriginatorKeyFile)" CertificateThumbprint="$(ManifestCertificateThumbprint)" CertificateFile="$(ManifestKeyFile)" SuppressAutoClosePasswordPrompt="$(BuildingInsideVisualStudio)" ShowImportDialogDespitePreviousFailures="$(BuildingProject)" ContinueOnError="!$(BuildingProject)">
      <Output TaskParameter="ResolvedKeyFile" PropertyName="KeyOriginatorFile" Condition=" '$(SignAssembly)' == 'true' " />
      <Output TaskParameter="ResolvedKeyContainer" PropertyName="KeyContainerName" Condition=" '$(SignAssembly)' == 'true' " />
      <Output TaskParameter="ResolvedThumbprint" PropertyName="_DeploymentResolvedManifestCertificateThumbprint" Condition=" '$(SignManifests)' == 'true' " />
    </ResolveKeySource>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                Compile Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        Compile
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CompileDependsOn>
      ResolveReferences;
      ResolveKeySource;
      SetWin32ManifestProperties;
      FindReferenceAssembliesForReferences;
      _GenerateCompileInputs;
      BeforeCompile;
      _TimeStampBeforeCompile;
      _GenerateCompileDependencyCache;
      CoreCompile;
      _TimeStampAfterCompile;
      AfterCompile;
    </CompileDependsOn>
  </PropertyGroup>
  <Target Name="Compile" DependsOnTargets="$(CompileDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _GenerateCompileInputs

    Create the _CoreCompileResourceInputs list of inputs to the CoreCompile target.
    ============================================================
    -->
  <Target Name="_GenerateCompileInputs" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Warning Condition="'@(ManifestResourceWithNoCulture)'!='' and '%(ManifestResourceWithNoCulture.EmittedForCompatibilityOnly)'==''" Code="MSB9004" Text="ManifestResourceWithNoCulture item type is deprecated. Emit EmbeddedResource items instead, with metadata WithCulture='false', Type='Resx', and optional LogicalName." />
    <Warning Condition="'@(ManifestNonResxWithNoCultureOnDisk)'!='' and '%(ManifestNonResxWithNoCultureOnDisk.EmittedForCompatibilityOnly)'==''" Code="MSB9005" Text="ManifestNonResxWithNoCultureOnDisk item type is deprecated. Emit EmbeddedResource items instead, with metadata WithCulture='false', Type='Non-Resx', and optional LogicalName." />
    <ItemGroup>
      <!-- _CoreCompileResourceInputs is the list of TLDA inputs that should trigger CoreCompile, and are listed as inputs to that target -->
      <_CoreCompileResourceInputs Include="@(EmbeddedResource->'%(OutputResource)')" Condition="'%(EmbeddedResource.WithCulture)' == 'false' and '%(EmbeddedResource.Type)' == 'Resx'" />
      <_CoreCompileResourceInputs Include="@(EmbeddedResource)" Condition="'%(EmbeddedResource.WithCulture)' == 'false' and '%(EmbeddedResource.Type)' == 'Non-Resx' " />
      <!-- CONSUMED FOR COMPATIBILITY REASONS ONLY. EMIT EMBEDDEDRESOURCE INSTEAD -->
      <_CoreCompileResourceInputs Include="@(ManifestResourceWithNoCulture)" Condition="'%(ManifestResourceWithNoCulture.EmittedForCompatibilityOnly)'==''">
        <Type>Resx</Type>
        <WithCulture>false</WithCulture>
      </_CoreCompileResourceInputs>
      <_CoreCompileResourceInputs Include="@(ManifestNonResxWithNoCultureOnDisk)" Condition="'%(ManifestNonResxWithNoCultureOnDisk.EmittedForCompatibilityOnly)'==''">
        <Type>Non-Resx</Type>
        <WithCulture>false</WithCulture>
      </_CoreCompileResourceInputs>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GenerateTargetFrameworkMonikerAttribute

    Emit the target framework moniker attribute as  a code fragment into a temporary source file for the compiler.
    ============================================================
    -->
  <PropertyGroup Condition="'$(TargetFrameworkMoniker)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Do not clean if we are going to default the path to the temp directory -->
    <TargetFrameworkMonikerAssemblyAttributesFileClean Condition="'$(TargetFrameworkMonikerAssemblyAttributesFileClean)' == '' and '$(TargetFrameworkMonikerAssemblyAttributesPath)' != ''">true</TargetFrameworkMonikerAssemblyAttributesFileClean>
    <TargetFrameworkMonikerAssemblyAttributesPath Condition="'$(TargetFrameworkMonikerAssemblyAttributesPath)' == ''">$([System.IO.Path]::Combine('$([System.IO.Path]::GetTempPath())','$(TargetFrameworkMoniker).AssemblyAttributes$(DefaultLanguageSourceExtension)'))</TargetFrameworkMonikerAssemblyAttributesPath>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateTargetFrameworkAttribute Condition="'$(GenerateTargetFrameworkAttribute)' == '' and '$(TargetFrameworkMoniker)' != '' and '$(TargetingClr2Framework)' != 'true'">true</GenerateTargetFrameworkAttribute>
  </PropertyGroup>
  <ItemGroup Condition="'$(TargetFrameworkMonikerAssemblyAttributesFileClean)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Clean Include="$(TargetFrameworkMonikerAssemblyAttributesPath)" />
  </ItemGroup>
  <Target Name="GenerateTargetFrameworkMonikerAttribute" BeforeTargets="BeforeCompile" DependsOnTargets="PrepareForBuild;GetReferenceAssemblyPaths" Inputs="$(MSBuildToolsPath)\Microsoft.Common.targets" Outputs="$(TargetFrameworkMonikerAssemblyAttributesPath)" Condition="'$(GenerateTargetFrameworkAttribute)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This is a file shared between projects so we have to take care to handle simultaneous writes (by ContinueOnError)
             and a race between clean from one project and build from another (by not adding to FilesWritten so it doesn't clean) -->
    <WriteLinesToFile File="$(TargetFrameworkMonikerAssemblyAttributesPath)" Lines="$(TargetFrameworkMonikerAssemblyAttributeText)" Overwrite="true" ContinueOnError="true" Condition="'@(Compile)' != '' and '$(TargetFrameworkMonikerAssemblyAttributeText)' != ''" />
    <ItemGroup Condition="'@(Compile)' != '' and '$(TargetFrameworkMonikerAssemblyAttributeText)' != ''">
      <Compile Include="$(TargetFrameworkMonikerAssemblyAttributesPath)" />
      <!-- Do not put in FileWrites: this is a file shared between projects in %temp%, and cleaning it would create a race between projects during rebuild -->
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GenerateAdditionalSources

    Emit any specified code fragments into a temporary source file for the compiler.
    ============================================================
    -->
  <PropertyGroup Condition="'$(AssemblyAttributesPath)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateAdditionalSources Condition="'$(GenerateAdditionalSources)' == ''">true</GenerateAdditionalSources>
  </PropertyGroup>
  <ItemGroup Condition="'$(AssemblyAttributesPath)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Clean Include="$(AssemblyAttributesPath)" Condition="'$(AssemblyAttributesFileClean)' != 'false'" />
  </ItemGroup>
  <Target Name="GenerateAdditionalSources" BeforeTargets="BeforeCompile" DependsOnTargets="PrepareForBuild;GetReferenceAssemblyPaths" Inputs="$(MSBuildAllProjects)" Outputs="$(AssemblyAttributesPath)" Condition="'@(AssemblyAttributes)' != '' and '$(GenerateAdditionalSources)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WriteCodeFragment AssemblyAttributes="@(AssemblyAttributes)" OutputFile="$(AssemblyAttributesPath)" Language="$(Language)">
      <Output TaskParameter="OutputFile" ItemName="Compile" />
      <Output TaskParameter="OutputFile" ItemName="FileWrites" />
    </WriteCodeFragment>
  </Target>
  <!--
    ============================================================
                                        BeforeCompile

    Redefine this target in your project in order to run tasks just before Compile.
    ============================================================
    -->
  <Target Name="BeforeCompile" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterCompile

    Redefine this target in your project in order to run tasks just after Compile.
    ============================================================
    -->
  <Target Name="AfterCompile" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _TimeStampBeforeCompile

    If post-build events are set to fire "OnOutputUpdated", then take before
    and after timestamps so that we can compare them.
    ============================================================
    -->
  <Target Name="_TimeStampBeforeCompile" Condition="'$(RunPostBuildEvent)'=='OnOutputUpdated' or ('$(RegisterForComInterop)'=='true' and '$(OutputType)'=='library')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_AssemblyTimestampBeforeCompile>%(IntermediateAssembly.ModifiedTime)</_AssemblyTimestampBeforeCompile>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        _GenerateCompileDependencyCache

    Generate a file used to track compiler dependencies between incremental build
    executions. This handles cases where items are added or removed from a glob (e.g.
    <Compile Include="**\*.cs" />) and can't otherwise be detected with timestamp
    comparisons. The file contains a hash of compiler inputs that are known to
    contribute to incremental build inconsistencies.
    ============================================================
    -->
  <Target Name="_GenerateCompileDependencyCache" DependsOnTargets="ResolveAssemblyReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <CustomAdditionalCompileInputs Include="$(IntermediateOutputPath)$(MSBuildProjectFile).CoreCompileInputs.cache" />
      <CoreCompileCache Include="@(Compile)" />
      <CoreCompileCache Include="@(ReferencePath)" />
    </ItemGroup>
    <Hash ItemsToHash="@(CoreCompileCache)">
      <Output TaskParameter="HashResult" PropertyName="CoreCompileDependencyHash" />
    </Hash>
    <WriteLinesToFile Lines="$(CoreCompileDependencyHash)" File="$(IntermediateOutputPath)$(MSBuildProjectFile).CoreCompileInputs.cache" Overwrite="True" WriteOnlyWhenDifferent="True" />
    <ItemGroup>
      <FileWrites Include="$(IntermediateOutputPath)$(MSBuildProjectFile).CoreCompileInputs.cache" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _TimeStampAfterCompile

    If post-build events are set to fire "OnOutputUpdated", then take before
    and after timestamps so that we can compare them.
    ============================================================
    -->
  <Target Name="_TimeStampAfterCompile" Condition="'$(RunPostBuildEvent)'=='OnOutputUpdated' or ('$(RegisterForComInterop)'=='true' and '$(OutputType)'=='library')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_AssemblyTimestampAfterCompile>%(IntermediateAssembly.ModifiedTime)</_AssemblyTimestampAfterCompile>
    </PropertyGroup>
  </Target>
  <!--
    ================================================================
                                        _ComputeNonExistentFileProperty

    There are certain situations in which we want to always run the CoreCompile target (and
    thus the Csc task), even if the timestamps of the outputs appear to be up-to-date on disk.
    If we're inside the IDE during design-time, then the Csc/Vbc/Vjc task is simply being used to
    initialize the host compiler, so we always want to run it.  Also, if we're inside the IDE, and
    the host compiler is responsible for doing the compilation during an actual build, we want to let
    the host compiler determine whether the output is up-to-date, because there may be source files
    in the IDE's in-memory buffers that we don't know about.

    So, we always run the CoreCompile target if we're in the IDE, and either we're in design-time or
    we're delegating to the host compiler for the actual build.

    We compare against BuildOutOfProcess != true because we cannot assume that the build process will
    have set BuildOutOfProcess to true or false. Therefore the default behavior should be to do the
    legacy behavior seen before BuildingOutOfProcess was introduced if the property is not set.
    ================================================================
    -->
  <Target Name="_ComputeNonExistentFileProperty" Condition="('$(BuildingInsideVisualStudio)' == 'true') and ('$(BuildingOutOfProcess)' != 'true') and (('$(BuildingProject)' == 'false') or ('$(UseHostCompilerIfAvailable)' == 'true'))" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <NonExistentFile>__NonExistentSubDir__\__NonExistentFile__</NonExistentFile>
    </PropertyGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                GenerateSerializationAssemblies Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_SGenDllName>$(TargetName).XmlSerializers.dll</_SGenDllName>
    <_SGenDllCreated>false</_SGenDllCreated>
    <_SGenGenerateSerializationAssembliesConfig>$(GenerateSerializationAssemblies)</_SGenGenerateSerializationAssembliesConfig>
    <_SGenGenerateSerializationAssembliesConfig Condition="'$(GenerateSerializationAssemblies)' == ''">Auto</_SGenGenerateSerializationAssembliesConfig>
    <_SGenGenerateSerializationAssembliesConfig Condition="'$(ConfigurationName)'=='Debug' and '$(_SGenGenerateSerializationAssembliesConfig)' == 'Auto'">Off</_SGenGenerateSerializationAssembliesConfig>
    <SGenUseProxyTypes Condition="'$(SGenUseProxyTypes)' == ''">true</SGenUseProxyTypes>
    <SGenUseKeep Condition="'$(SGenUseKeep)'==''">false</SGenUseKeep>
    <SGenShouldGenerateSerializer Condition="'$(SGenShouldGenerateSerializer)' == ''">true</SGenShouldGenerateSerializer>
  </PropertyGroup>
  <!--
    ============================================================
                                        GenerateSerializationAssemblies

    Run GenerateSerializationAssemblies on the assembly produced by this build.

        [IN]
        @(BuildAssemblyName) - The assembly generated by this build.
        @(BuildAssemblyPath) - The path where the assembly resides.
        @(ReferencePath) - The list of references used by this assembly.

        [OUT]
        @(SerializationAssembly) - The path to the serialization assembly.  Maybe we'll just append to an existing list.
    ============================================================
    -->
  <Target Name="GenerateSerializationAssemblies" Condition="'$(_SGenGenerateSerializationAssembliesConfig)' == 'On' or ('@(WebReferenceUrl)'!='' and '$(_SGenGenerateSerializationAssembliesConfig)' == 'Auto')" DependsOnTargets="AssignTargetPaths;Compile;ResolveKeySource" Inputs="$(MSBuildAllProjects);@(IntermediateAssembly)" Outputs="$(IntermediateOutputPath)$(_SGenDllName)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <SGenMSBuildArchitecture Condition="'$(SGenMSBuildArchitecture)' == ''">$(PlatformTargetAsMSBuildArchitecture)</SGenMSBuildArchitecture>
    </PropertyGroup>
    <SGen BuildAssemblyName="$(TargetFileName)" BuildAssemblyPath="$(IntermediateOutputPath)" References="@(ReferencePath)" ShouldGenerateSerializer="$(SGenShouldGenerateSerializer)" UseProxyTypes="$(SGenUseProxyTypes)" UseKeep="$(SGenUseKeep)" KeyContainer="$(KeyContainerName)" KeyFile="$(KeyOriginatorFile)" DelaySign="$(DelaySign)" ToolPath="$(SGenToolPath)" SdkToolsPath="$(TargetFrameworkSDKToolsDirectory)" EnvironmentVariables="$(SGenEnvironment)" MSBuildArchitecture="$(SGenMSBuildArchitecture)" SerializationAssembly="$(IntermediateOutputPath)$(_SGenDllName)" Platform="$(SGenPlatformTarget)" Types="$(SGenSerializationTypes)">
      <Output TaskParameter="SerializationAssembly" ItemName="SerializationAssembly" />
    </SGen>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                CreateSatelliteAssemblies Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        CreateSatelliteAssemblies

    Create one satellite assembly for every unique culture in the resources.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CreateSatelliteAssembliesDependsOn>
      _GenerateSatelliteAssemblyInputs;
      ComputeIntermediateSatelliteAssemblies;
      GenerateSatelliteAssemblies
    </CreateSatelliteAssembliesDependsOn>
  </PropertyGroup>
  <Target Name="CreateSatelliteAssemblies" DependsOnTargets="$(CreateSatelliteAssembliesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _GenerateSatelliteAssemblyInputs

    Create the _SatelliteAssemblyResourceInputs list of inputs to the CreateSatelliteAssemblies target.
    ============================================================
    -->
  <Target Name="_GenerateSatelliteAssemblyInputs" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Warning Condition="'@(ManifestResourceWithCulture)'!='' and '%(ManifestResourceWithCulture.EmittedForCompatibilityOnly)'==''" Code="MSB9006" Text="ManifestResourceWithCulture item type is deprecated. Emit EmbeddedResource items instead, with metadata WithCulture='true', Type='Resx', and optional LogicalName." />
    <Warning Condition="'@(ManifestNonResxWithCultureOnDisk)'!='' and '%(ManifestNonResxWithCultureOnDisk.EmittedForCompatibilityOnly)'==''" Code="MSB9007" Text="ManifestNonResxWithCultureOnDisk item type is deprecated. Emit EmbeddedResource items instead, with metadata WithCulture='true', Type='Non-Resx', and optional LogicalName." />
    <ItemGroup>
      <!-- _SatelliteAssemblyResourceInputs is the list of TLDA inputs that should trigger CreateSatelliteAssemblies, so listed as inputs to that target -->
      <_SatelliteAssemblyResourceInputs Include="@(EmbeddedResource->'%(OutputResource)')" Condition="'%(EmbeddedResource.WithCulture)' == 'true' and '%(EmbeddedResource.Type)' == 'Resx'" />
      <_SatelliteAssemblyResourceInputs Include="@(EmbeddedResource)" Condition="'%(EmbeddedResource.WithCulture)' == 'true' and '%(EmbeddedResource.Type)' == 'Non-Resx'" />
      <!-- CONSUMED FOR COMPATIBILITY REASONS ONLY. EMIT EMBEDDEDRESOURCE INSTEAD -->
      <_SatelliteAssemblyResourceInputs Include="@(ManifestResourceWithCulture)" Condition="'%(ManifestResourceWithCulture.EmittedForCompatibilityOnly)'==''">
        <Type>Resx</Type>
        <WithCulture>true</WithCulture>
      </_SatelliteAssemblyResourceInputs>
      <_SatelliteAssemblyResourceInputs Include="@(ManifestNonResxWithCultureOnDisk)" Condition="'%(ManifestNonResxWithCultureOnDisk.EmittedForCompatibilityOnly)'==''">
        <Type>Non-Resx</Type>
        <WithCulture>true</WithCulture>
      </_SatelliteAssemblyResourceInputs>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GenerateSatelliteAssemblies

    Actually run al.exe to create the satellite assemblies.
    ============================================================
    -->
  <Target Name="GenerateSatelliteAssemblies" Inputs="$(MSBuildAllProjects);@(_SatelliteAssemblyResourceInputs);$(IntermediateOutputPath)$(TargetName)$(TargetExt)" Outputs="$(IntermediateOutputPath)%(Culture)\$(TargetName).resources.dll" Condition="'@(_SatelliteAssemblyResourceInputs)' != '' and '$(GenerateSatelliteAssembliesForCore)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MakeDir Directories="@(EmbeddedResource->'$(IntermediateOutputPath)%(Culture)')" />
    <AL AlgorithmId="$(Satellite_AlgorithmId)" BaseAddress="$(Satellite_BaseAddress)" CompanyName="$(Satellite_CompanyName)" Configuration="$(Satellite_Configuration)" Copyright="$(Satellite_Copyright)" Culture="%(Culture)" DelaySign="$(DelaySign)" Description="$(Satellite_Description)" EmbedResources="@(_SatelliteAssemblyResourceInputs)" EnvironmentVariables="$(AlEnvironment)" EvidenceFile="$(Satellite_EvidenceFile)" FileVersion="$(Satellite_FileVersion)" Flags="$(Satellite_Flags)" GenerateFullPaths="$(Satellite_GenerateFullPaths)" KeyContainer="$(KeyContainerName)" KeyFile="$(KeyOriginatorFile)" LinkResources="@(Satellite_LinkResource)" MainEntryPoint="$(Satellite_MainEntryPoint)" OutputAssembly="$(IntermediateOutputPath)%(Culture)\$(TargetName).resources.dll" Platform="$(PlatformTarget)" ProductName="$(Satellite_ProductName)" ProductVersion="$(Satellite_ProductVersion)" ResponseFiles="@(AlResponseFile)" SourceModules="@(Satellite_SourceModule)" TargetType="$(Satellite_TargetType)" TemplateFile="$(IntermediateOutputPath)$(TargetName)$(TargetExt)" Title="$(Satellite_Title)" ToolPath="$(AlToolPath)" ToolExe="$(AlToolExe)" SdkToolsPath="$(TargetFrameworkSDKToolsDirectory)" Trademark="$(Satellite_Trademark)" Version="$(Satellite_Version)" Win32Icon="$(Satellite_Win32Icon)" Win32Resource="$(Satellite_Win32Resource)">
      <Output TaskParameter="OutputAssembly" ItemName="FileWrites" />
    </AL>
  </Target>
  <!--
    ============================================================
                                        ComputeIntermediateSatelliteAssemblies

    Compute the paths to the intermediate satellite assemblies,
    with culture attributes so we can copy them to the right place.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ComputeIntermediateSatelliteAssembliesDependsOn>
      CreateManifestResourceNames
    </ComputeIntermediateSatelliteAssembliesDependsOn>
  </PropertyGroup>
  <Target Name="ComputeIntermediateSatelliteAssemblies" Condition="@(EmbeddedResource->'%(WithCulture)') != ''" DependsOnTargets="$(ComputeIntermediateSatelliteAssembliesDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <IntermediateSatelliteAssembliesWithTargetPath Include="$(IntermediateOutputPath)%(EmbeddedResource.Culture)\$(TargetName).resources.dll" Condition="'%(EmbeddedResource.Culture)' != ''">
        <Culture>%(EmbeddedResource.Culture)</Culture>
        <TargetPath>%(EmbeddedResource.Culture)\$(TargetName).resources.dll</TargetPath>
      </IntermediateSatelliteAssembliesWithTargetPath>
    </ItemGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                SetWin32ManifestProperties Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <EmbeddedWin32Manifest>$(Win32Manifest)</EmbeddedWin32Manifest>
  </PropertyGroup>
  <!--
    ============================================================
                                        SetWin32ManifestProperties

    Set Win32Manifest and EmbeddedManifest properties to be used later in the build.
    ============================================================
    -->
  <Target Name="SetWin32ManifestProperties" Condition="'$(Win32Manifest)'==''" DependsOnTargets="ResolveComReferences;ResolveNativeReferences;_SetExternalWin32ManifestProperties;_SetEmbeddedWin32ManifestProperties" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="_SetExternalWin32ManifestProperties" Condition="'$(GenerateClickOnceManifests)'=='true' or '@(NativeReference)'!='' or '@(ResolvedIsolatedComModules)'!=''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- set _DeploymentBaseManifest property to the value of $(ApplicationManifest) if the property is set,
                 but use _DeploymentBaseManifestWithTargetPath item-group if the property is not set to support backwards
                 compat with earlier MSBuild versions when manifest files were determined by the item-group. If the newer
                 property is set though, prefer that one be used to specify the manifest. -->
      <_DeploymentBaseManifest>$(ApplicationManifest)</_DeploymentBaseManifest>
      <_DeploymentBaseManifest Condition="'$(_DeploymentBaseManifest)'==''">@(_DeploymentBaseManifestWithTargetPath)</_DeploymentBaseManifest>
      <!-- when using external manifests, always set the NoWin32Manifest property to
                 true if there is no value set in the incoming project file so the
                 compilers that support manifest embedding know not to add
                 a manifest to their built assemblies -->
      <NoWin32Manifest Condition="'$(NoWin32Manifest)'==''">true</NoWin32Manifest>
    </PropertyGroup>
  </Target>
  <Target Name="_SetEmbeddedWin32ManifestProperties" Condition="'$(GenerateClickOnceManifests)'!='true' and '@(NativeReference)'=='' and '@(ResolvedIsolatedComModules)'==''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <EmbeddedWin32Manifest>$(ApplicationManifest)</EmbeddedWin32Manifest>
      <Win32Manifest>$(ApplicationManifest)</Win32Manifest>
    </PropertyGroup>
    <GetFrameworkPath Condition="'$(ApplicationManifest)'=='' and '$(NoWin32Manifest)'!='true'">
      <Output TaskParameter="FrameworkVersion40Path" PropertyName="_FrameworkVersion40Path" />
    </GetFrameworkPath>
    <PropertyGroup>
      <EmbeddedWin32Manifest Condition="'$(ApplicationManifest)'=='' and '$(NoWin32Manifest)'!='true' and Exists('$(_FrameworkVersion40Path)\default.win32manifest')">$(_FrameworkVersion40Path)\default.win32manifest</EmbeddedWin32Manifest>
    </PropertyGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                GenerateManifests Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        GenerateManifests

    Generates ClickOnce application and deployment manifests or a native manifest.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateManifestsDependsOn>
      SetWin32ManifestProperties;
      GenerateApplicationManifest;
      GenerateDeploymentManifest
    </GenerateManifestsDependsOn>
  </PropertyGroup>
  <!--
    ============================================================
                  _GenerateResolvedDeploymentManifestEntryPoint

    Use the ResolveManifestFiles to generate the GenerateResolvedDeploymentManifestEntryPoint

    ============================================================
    -->
  <Target Name="_GenerateResolvedDeploymentManifestEntryPoint" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_DeploymentPublishFileOfTypeManifestEntryPoint Include="@(PublishFile)" Condition="'%(FileType)'=='ManifestEntryPoint'" />
    </ItemGroup>
    <ResolveManifestFiles TargetFrameworkVersion="$(TargetFrameworkVersion)" SigningManifests="$(SignManifests)" DeploymentManifestEntryPoint="@(ApplicationManifest)" PublishFiles="@(_DeploymentPublishFileOfTypeManifestEntryPoint)">
      <Output TaskParameter="OutputDeploymentManifestEntryPoint" ItemName="_DeploymentResolvedDeploymentManifestEntryPoint" />
    </ResolveManifestFiles>
  </Target>
  <Target Name="GenerateManifests" Condition="'$(GenerateClickOnceManifests)'=='true' or '@(NativeReference)'!='' or '@(ResolvedIsolatedComModules)'!='' or '$(GenerateAppxManifest)' == 'true'" DependsOnTargets="$(GenerateManifestsDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        GenerateApplicationManifest

    Generates a ClickOnce or native application manifest.
    An application manifest specifies declarative application identity, dependency and security information.

        [IN]
        $(_DeploymentBaseManifest) - The base app.manifest from project.
        @(ResolvedIsolatedComModules) - The list of COM references to be isolated as reg-free COM dependencies for native assembly loader.
        @(_DeploymentManifestFiles) - The list of loose files (content, pdb, xml, etc.) for ClickOnce.
        @(_DeploymentManifestDependencies) - The list of application dependencies (typically this is the set of assembly dependencies in bin\) for ClickOnce.
        @(AppConfigWithTargetPath) - App config file, if present.
        $(_DeploymentManifestType) - Type of manifest to be generated, either "Native" or "ClickOnce".

        [OUT]
        @(ApplicationManifest) - Generated native or ClickOnce application manifest, i.e. WindowsApplication1.exe.manifest
    ============================================================
    -->
  <Target Name="GenerateApplicationManifest" DependsOnTargets="             _DeploymentComputeNativeManifestInfo;             _DeploymentComputeClickOnceManifestInfo;             ResolveComReferences;             ResolveNativeReferences;             _GenerateResolvedDeploymentManifestEntryPoint" Inputs="             $(MSBuildAllProjects);             @(AppConfigWithTargetPath);             $(_DeploymentBaseManifest);             @(ResolvedIsolatedComModules);             @(_DeploymentManifestDependencies);             @(_DeploymentResolvedManifestEntryPoint);             @(_DeploymentManifestFiles)" Outputs="@(ApplicationManifest)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RequiresFramework35SP1Assembly ReferencedAssemblies="@(Reference)" ErrorReportUrl="$(_DeploymentFormattedErrorReportUrl)" TargetFrameworkVersion="$(TargetFrameworkVersion)" CreateDesktopShortcut="$(CreateDesktopShortcut)" SigningManifests="$(SignManifests)" Assemblies="@(_DeploymentManifestDependencies)" DeploymentManifestEntryPoint="@(_DeploymentResolvedDeploymentManifestEntryPoint)" EntryPoint="@(_DeploymentResolvedManifestEntryPoint)" Files="@(_DeploymentManifestFiles)" SuiteName="$(SuiteName)">
      <Output TaskParameter="RequiresMinimumFramework35SP1" PropertyName="_DeploymentRequiresMinimumFramework35SP1" />
    </RequiresFramework35SP1Assembly>
    <GenerateApplicationManifest AssemblyName="$(_DeploymentApplicationManifestIdentity)" AssemblyVersion="$(_DeploymentManifestVersion)" ConfigFile="@(AppConfigWithTargetPath)" ClrVersion="$(ClrVersion)" Dependencies="@(_DeploymentManifestDependencies)" Description="$(Description)" EntryPoint="@(_DeploymentResolvedManifestEntryPoint)" ErrorReportUrl="$(_DeploymentFormattedErrorReportUrl)" FileAssociations="@(FileAssociation)" Files="@(_DeploymentManifestFiles)" HostInBrowser="$(HostInBrowser)" IconFile="@(_DeploymentManifestIconFile)" InputManifest="$(_DeploymentBaseManifest)" IsolatedComReferences="@(ResolvedIsolatedComModules)" ManifestType="$(_DeploymentManifestType)" MaxTargetPath="$(MaxTargetPath)" OutputManifest="@(ApplicationManifest)" OSVersion="$(OSVersion)" Platform="$(PlatformTarget)" Product="$(ProductName)" Publisher="$(PublisherName)" RequiresMinimumFramework35SP1="$(_DeploymentRequiresMinimumFramework35SP1)" SuiteName="$(SuiteName)" SupportUrl="$(_DeploymentFormattedSupportUrl)" TargetCulture="$(TargetCulture)" TargetFrameworkSubset="$(TargetFrameworkSubset)" TargetFrameworkProfile="$(TargetFrameworkProfile)" TargetFrameworkVersion="$(TargetFrameworkVersion)" TrustInfoFile="@(_DeploymentIntermediateTrustInfoFile)" UseApplicationTrust="$(UseApplicationTrust)">
      <Output TaskParameter="OutputManifest" ItemName="FileWrites" />
    </GenerateApplicationManifest>
    <PropertyGroup>
      <_DeploymentCopyApplicationManifest>true</_DeploymentCopyApplicationManifest>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        _DeploymentComputeNativeManifestInfo

    Compute info for native manifest generation
    ============================================================
    -->
  <Target Name="_DeploymentComputeNativeManifestInfo" Condition="'$(GenerateClickOnceManifests)'!='true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Create list of items for manifest generation -->
    <ResolveManifestFiles NativeAssemblies="@(NativeReferenceFile);@(_DeploymentNativePrerequisite)">
      <Output TaskParameter="OutputAssemblies" ItemName="_DeploymentManifestDependencies" />
    </ResolveManifestFiles>
    <PropertyGroup>
      <_DeploymentManifestType>Native</_DeploymentManifestType>
    </PropertyGroup>
    <!-- Obtain manifest version from the built assembly -->
    <GetAssemblyIdentity AssemblyFiles="@(IntermediateAssembly)">
      <Output TaskParameter="Assemblies" ItemName="_IntermediateAssemblyIdentity" />
    </GetAssemblyIdentity>
    <PropertyGroup>
      <_DeploymentManifestVersion>@(_IntermediateAssemblyIdentity->'%(Version)')</_DeploymentManifestVersion>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        _DeploymentComputeClickOnceManifestInfo

    Compute info for  ClickOnce manifest generation
    ============================================================
    -->
  <Target Name="_DeploymentComputeClickOnceManifestInfo" Condition="'$(GenerateClickOnceManifests)'=='true'" DependsOnTargets="             CleanPublishFolder;             _DeploymentGenerateTrustInfo" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Grab just the serialization assemblies for a referenced assembly.  There may also be a symbols file in ReferenceRelatedPaths -->
    <ItemGroup>
      <_SGenDllsRelatedToCurrentDll Include="@(_ReferenceSerializationAssemblyPaths->'%(FullPath)')" Condition="'%(Extension)' == '.dll'" />
      <_SGenDllsRelatedToCurrentDll Include="@(SerializationAssembly->'%(FullPath)')" Condition="'%(Extension)' == '.dll'" />
    </ItemGroup>
    <!-- Flag primary dependencies-certain warnings emitted during application manifest generation apply only to them. -->
    <ItemGroup>
      <_DeploymentReferencePaths Include="@(ReferencePath)">
        <IsPrimary>true</IsPrimary>
      </_DeploymentReferencePaths>
    </ItemGroup>
    <!-- Copy the application executable from Obj folder to app.publish folder.
    This is being done to avoid Windows Forms designer memory issues that can arise while operating directly on files located in Obj directory. -->
    <Copy SourceFiles="@(_DeploymentManifestEntryPoint)" DestinationFolder="$(PublishDir)">
      <Output TaskParameter="DestinationFiles" ItemName="_DeploymentClickOnceApplicationExecutable" />
    </Copy>
    <!-- Sign the application executable located in app.publish folder.  Signing this file is done to comply with SmartScreen. -->
    <SignFile CertificateThumbprint="$(_DeploymentResolvedManifestCertificateThumbprint)" TimestampUrl="$(ManifestTimestampUrl)" SigningTarget="@(_DeploymentClickOnceApplicationExecutable)" Condition="'$(_DeploymentResolvedManifestCertificateThumbprint)'!='' and '$(_DeploymentSignClickOnceManifests)'=='true' and '$(TargetExt)' == '.exe'" />
    <!-- Create list of items for manifest generation -->
    <ResolveManifestFiles TargetFrameworkVersion="$(TargetFrameworkVersion)" SigningManifests="$(SignManifests)" EntryPoint="@(_DeploymentClickOnceApplicationExecutable)" ExtraFiles="@(_DebugSymbolsIntermediatePath);$(IntermediateOutputPath)$(TargetName).xml;@(_ReferenceRelatedPaths)" Files="@(ContentWithTargetPath);@(_DeploymentManifestIconFile);@(AppConfigWithTargetPath)" ManagedAssemblies="@(_DeploymentReferencePaths);@(ReferenceDependencyPaths);@(_SGenDllsRelatedToCurrentDll);@(SerializationAssembly)" NativeAssemblies="@(NativeReferenceFile);@(_DeploymentNativePrerequisite)" PublishFiles="@(PublishFile)" SatelliteAssemblies="@(IntermediateSatelliteAssembliesWithTargetPath);@(ReferenceSatellitePaths)" TargetCulture="$(TargetCulture)">
      <Output TaskParameter="OutputAssemblies" ItemName="_DeploymentManifestDependencies" />
      <Output TaskParameter="OutputFiles" ItemName="_DeploymentManifestFiles" />
      <Output TaskParameter="OutputEntryPoint" ItemName="_DeploymentResolvedManifestEntryPoint" />
    </ResolveManifestFiles>
    <PropertyGroup>
      <_DeploymentManifestType>ClickOnce</_DeploymentManifestType>
    </PropertyGroup>
    <!-- Obtain manifest version from ApplicationVersion and ApplicationRevision properties -->
    <FormatVersion Version="$(ApplicationVersion)" Revision="$(ApplicationRevision)">
      <Output TaskParameter="OutputVersion" PropertyName="_DeploymentManifestVersion" />
    </FormatVersion>
    <FormatUrl InputUrl="$(_DeploymentUrl)">
      <Output TaskParameter="OutputUrl" PropertyName="_DeploymentFormattedDeploymentUrl" />
    </FormatUrl>
    <FormatUrl InputUrl="$(SupportUrl)">
      <Output TaskParameter="OutputUrl" PropertyName="_DeploymentFormattedSupportUrl" />
    </FormatUrl>
    <FormatUrl InputUrl="$(ErrorReportUrl)">
      <Output TaskParameter="OutputUrl" PropertyName="_DeploymentFormattedErrorReportUrl" />
    </FormatUrl>
  </Target>
  <!--
    ============================================================
                                        _DeploymentGenerateTrustInfo

    Generates the application permission set for inclusion in the generated ClickOnce application manifest.
    ============================================================
    -->
  <Target Name="_DeploymentGenerateTrustInfo" Condition="'$(TargetZone)'!=''" Inputs="             $(MSBuildAllProjects);             $(_DeploymentBaseManifest);             " Outputs="@(_DeploymentIntermediateTrustInfoFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateTrustInfo BaseManifest="$(_DeploymentBaseManifest)" ApplicationDependencies="@(ReferencePath);@(ReferenceDependencyPaths)" ExcludedPermissions="$(ExcludedPermissions)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetZone="$(TargetZone)" TrustInfoFile="@(_DeploymentIntermediateTrustInfoFile)">
      <Output TaskParameter="TrustInfoFile" ItemName="FileWrites" />
    </GenerateTrustInfo>
  </Target>
  <!--
    ============================================================
                                        GenerateDeploymentManifest

    Generates a ClickOnce deployment manifest.
    An deployment manifest specifies declarative application identity and application update information.
    ============================================================
    -->
  <Target Name="GenerateDeploymentManifest" DependsOnTargets="GenerateApplicationManifest" Inputs="             $(MSBuildAllProjects);             @(ApplicationManifest)             " Outputs="@(DeployManifest)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateDeploymentManifest AssemblyName="$(_DeploymentDeployManifestIdentity)" AssemblyVersion="$(_DeploymentManifestVersion)" CreateDesktopShortcut="$(CreateDesktopShortcut)" DeploymentUrl="$(_DeploymentFormattedDeploymentUrl)" Description="$(Description)" DisallowUrlActivation="$(DisallowUrlActivation)" EntryPoint="@(_DeploymentResolvedDeploymentManifestEntryPoint)" ErrorReportUrl="$(_DeploymentFormattedErrorReportUrl)" Install="$(Install)" MapFileExtensions="$(MapFileExtensions)" MaxTargetPath="$(MaxTargetPath)" MinimumRequiredVersion="$(_DeploymentBuiltMinimumRequiredVersion)" OutputManifest="@(DeployManifest)" Platform="$(PlatformTarget)" Product="$(ProductName)" Publisher="$(PublisherName)" SuiteName="$(SuiteName)" SupportUrl="$(_DeploymentFormattedSupportUrl)" TargetCulture="$(TargetCulture)" TargetFrameworkVersion="$(TargetFrameworkVersion)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TrustUrlParameters="$(TrustUrlParameters)" UpdateEnabled="$(UpdateEnabled)" UpdateInterval="$(_DeploymentBuiltUpdateInterval)" UpdateMode="$(UpdateMode)" UpdateUnit="$(_DeploymentBuiltUpdateIntervalUnits)" Condition="'$(GenerateClickOnceManifests)'=='true'">
      <Output TaskParameter="OutputManifest" ItemName="FileWrites" />
    </GenerateDeploymentManifest>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                PrepareForRun Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SkipCopyUnchangedFiles Condition="'$(SkipCopyUnchangedFiles)' == ''">true</SkipCopyUnchangedFiles>
    <UseCommonOutputDirectory Condition="'$(UseCommonOutputDirectory)' == ''">false</UseCommonOutputDirectory>
  </PropertyGroup>
  <!--
    ============================================================
                                        PrepareForRun

    Copy the build outputs to the final directory if they have changed.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PrepareForRunDependsOn>
      CopyFilesToOutputDirectory
    </PrepareForRunDependsOn>
  </PropertyGroup>
  <Target Name="PrepareForRun" DependsOnTargets="$(PrepareForRunDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        CopyFilesToOutputDirectory

    Copy all build outputs, satellites and other necessary files to the final directory.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- By default we're not using Hard or Symbolic Links to copy to the output directory, and never when building in VS -->
    <CreateHardLinksForCopyAdditionalFilesIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateHardLinksForCopyAdditionalFilesIfPossible)' == ''">false</CreateHardLinksForCopyAdditionalFilesIfPossible>
    <CreateSymbolicLinksForCopyAdditionalFilesIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateSymbolicLinksForCopyAdditionalFilesIfPossible)' == ''">false</CreateSymbolicLinksForCopyAdditionalFilesIfPossible>
  </PropertyGroup>
  <Target Name="CopyFilesToOutputDirectory" DependsOnTargets="             ComputeIntermediateSatelliteAssemblies;             _CopyFilesMarkedCopyLocal;             _CopySourceItemsToOutputDirectory;             _CopyAppConfigFile;             _CopyManifestFiles;             _CheckForCompileOutputs;             _SGenCheckForOutputs" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- By default we're not using Hard Links to copy to the output directory, and never when building in VS -->
      <CreateHardLinksForCopyFilesToOutputDirectoryIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)' == ''">false</CreateHardLinksForCopyFilesToOutputDirectoryIfPossible>
      <CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)' == ''">false</CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible>
    </PropertyGroup>
    <PropertyGroup>
      <CopyBuildOutputToOutputDirectory Condition="'$(CopyBuildOutputToOutputDirectory)'==''">true</CopyBuildOutputToOutputDirectory>
      <CopyOutputSymbolsToOutputDirectory Condition="'$(CopyOutputSymbolsToOutputDirectory)'==''">true</CopyOutputSymbolsToOutputDirectory>
    </PropertyGroup>
    <!-- Copy the build product (.dll or .exe). -->
    <Copy SourceFiles="@(IntermediateAssembly)" DestinationFolder="$(OutDir)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)" Condition="'$(CopyBuildOutputToOutputDirectory)' == 'true' and '$(SkipCopyBuildProduct)' != 'true'">
      <Output TaskParameter="DestinationFiles" ItemName="MainAssembly" />
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!-- Copy the reference assembly build product (.dll or .exe). -->
    <CopyRefAssembly SourcePath="@(IntermediateRefAssembly)" DestinationPath="$(TargetRefPath)" Condition="'$(ProduceReferenceAssembly)' == 'true' and '$(CopyBuildOutputToOutputDirectory)' == 'true' and '$(SkipCopyBuildProduct)' != 'true'">
      <Output TaskParameter="DestinationPath" ItemName="ReferenceAssembly" />
      <Output TaskParameter="DestinationPath" ItemName="FileWrites" />
    </CopyRefAssembly>
    <Message Importance="High" Text="$(MSBuildProjectName) -&gt; @(MainAssembly->'%(FullPath)')" Condition="'$(CopyBuildOutputToOutputDirectory)' == 'true' and '$(SkipCopyBuildProduct)'!='true'" />
    <!-- Copy the additional modules. -->
    <Copy SourceFiles="@(AddModules)" DestinationFolder="$(OutDir)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyAdditionalFilesIfPossible)" Condition="'@(AddModules)' != ''">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!-- Copy the serialization assembly if it exists. -->
    <Copy SourceFiles="$(IntermediateOutputPath)$(_SGenDllName)" DestinationFiles="$(OutDir)$(_SGenDllName)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)" Condition="'$(_SGenDllCreated)'=='true'">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!-- Copy the debug information file (.pdb), if any -->
    <Copy SourceFiles="@(_DebugSymbolsIntermediatePath)" DestinationFiles="@(_DebugSymbolsOutputPath)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)" Condition="'$(_DebugSymbolsProduced)'=='true' and '$(SkipCopyingSymbolsToOutputDirectory)' != 'true' and '$(CopyOutputSymbolsToOutputDirectory)'=='true'">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!-- Copy the resulting XML documentation file, if any. -->
    <Copy SourceFiles="@(DocFileItem)" DestinationFiles="@(FinalDocFile)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)" Condition="'$(_DocumentationFileProduced)'=='true'">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!-- Copy satellite assemblies. -->
    <Copy SourceFiles="@(IntermediateSatelliteAssembliesWithTargetPath)" DestinationFiles="@(IntermediateSatelliteAssembliesWithTargetPath->'$(OutDir)%(Culture)\$(TargetName).resources.dll')" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)" Condition="'@(IntermediateSatelliteAssembliesWithTargetPath)' != ''">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!--
        Copy COM reference wrappers, isolated COM references, COM references included by
        native (manifest) references, native (manifest) reference files themselves.
        -->
    <Copy SourceFiles="@(ReferenceComWrappersToCopyLocal); @(ResolvedIsolatedComModules); @(_DeploymentLooseManifestFile); @(NativeReferenceFile)" DestinationFolder="$(OutDir)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyAdditionalFilesIfPossible)" Condition="'@(ReferenceComWrappersToCopyLocal)' != '' or '@(ResolvedIsolatedComModules)' != '' or '@(_DeploymentLooseManifestFile)' != '' or '@(NativeReferenceFile)' != '' ">
      <Output TaskParameter="DestinationFiles" ItemName="FileWritesShareable" />
    </Copy>
    <!-- Copy the build product of WinMDExp. -->
    <Copy SourceFiles="@(WinMDExpArtifacts)" DestinationFolder="$(OutDir)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)" Condition="'$(SkipCopyWinMDArtifact)' != 'true' and '@(WinMDExpArtifacts)' != ''">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
      <Output TaskParameter="DestinationFiles" ItemName="FinalWinmdExpArtifacts" />
    </Copy>
    <Message Importance="High" Text="$(MSBuildProjectName) -&gt; $([System.IO.Path]::GetFullPath('$(_WindowsMetadataOutputPath)'))" Condition="'$(SkipCopyWinMDArtifact)' != 'true' and '$(_WindowsMetadataOutputPath)' != ''" />
  </Target>
  <!--
    ============================================================
                                        _CopyFilesMarkedCopyLocal

    Copy references that are marked as "CopyLocal" and their dependencies, including .pdbs, .xmls and satellites.
    ============================================================
    -->
  <Target Name="_CopyFilesMarkedCopyLocal" Condition="'@(ReferenceCopyLocalPaths)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- By default we're not using Hard Links to copy to the output directory, and never when building in VS -->
      <CreateHardLinksForCopyLocalIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateHardLinksForCopyLocalIfPossible)' == ''">false</CreateHardLinksForCopyLocalIfPossible>
      <CreateSymbolicLinksForCopyLocalIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateSymbolicLinksForCopyLocalIfPossible)' == ''">false</CreateSymbolicLinksForCopyLocalIfPossible>
    </PropertyGroup>
    <Copy SourceFiles="@(ReferenceCopyLocalPaths)" DestinationFiles="@(ReferenceCopyLocalPaths->'$(OutDir)%(DestinationSubDirectory)%(Filename)%(Extension)')" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyLocalIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyLocalIfPossible)" Condition="'$(UseCommonOutputDirectory)' != 'true'">
      <Output TaskParameter="DestinationFiles" ItemName="FileWritesShareable" />
      <Output TaskParameter="CopiedFiles" ItemName="ReferencesCopiedInThisBuild" />
    </Copy>
    <!-- If this project produces reference assemblies *and* copied (possibly transitive)
         references on this build, subsequent builds of projects that depend on it must
         not be considered up to date, so touch this marker file that is considered an
         input to projects that reference this one. -->
    <Touch Files="@(CopyUpToDateMarker)" AlwaysCreate="true" Condition="'@(ReferencesCopiedInThisBuild)' != ''">
      <Output TaskParameter="TouchedFiles" ItemName="FileWrites" />
    </Touch>
  </Target>
  <!--
    ============================================================
                                        _CopySourceItemsToOutputDirectory
    ============================================================
    -->
  <Target Name="_CopySourceItemsToOutputDirectory" DependsOnTargets="             GetCopyToOutputDirectoryItems;             _CopyOutOfDateSourceItemsToOutputDirectory;             _CopyOutOfDateSourceItemsToOutputDirectoryAlways" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        GetCopyToOutputDirectoryItems

    Get all project items that may need to be transferred to the output directory.
    This includes baggage items from transitively referenced projects. It would appear
    that this target computes full transitive closure of content items for all referenced
    projects; however that is not the case. It only collects the content items from its
    immediate children and not children of children. The reason this happens is that
    the ProjectReferenceWithConfiguration list that is consumed by _SplitProjectReferencesByFileExistence
    is only populated in the current project and is empty in the children. The empty list
    causes _MSBuildProjectReferenceExistent to be empty and terminates the recursion.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetCopyToOutputDirectoryItemsDependsOn>
      AssignTargetPaths;
      _SplitProjectReferencesByFileExistence;
      _GetProjectReferenceTargetFrameworkProperties
    </GetCopyToOutputDirectoryItemsDependsOn>
  </PropertyGroup>
  <Target Name="GetCopyToOutputDirectoryItems" Returns="@(AllItemsFullPathWithTargetPath)" KeepDuplicateOutputs=" '$(MSBuildDisableGetCopyToOutputDirectoryItemsOptimization)' == '' " DependsOnTargets="$(GetCopyToOutputDirectoryItemsDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- In the general case, clients need very little of the metadata which is generated by invoking this target on this project and its children.  For those
         cases, we can immediately discard the unwanted metadata, reducing memory usage, particularly in very large and interconnected systems of projects.
         However, if some client does require the original functionality, it is sufficient to set MSBuildDisableGetCopyToOutputDirectoryItemsOptimization to
         a non-empty value and the original behavior will be restored. -->
    <PropertyGroup Condition=" '$(MSBuildDisableGetCopyToOutputDirectoryItemsOptimization)' == '' ">
      <_GCTODIKeepDuplicates>false</_GCTODIKeepDuplicates>
      <_GCTODIKeepMetadata>CopyToOutputDirectory;TargetPath</_GCTODIKeepMetadata>
    </PropertyGroup>
    <!-- Get items from child projects first. -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="GetCopyToOutputDirectoryItems" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'@(_MSBuildProjectReferenceExistent)' != '' and '$(_GetChildProjectCopyToOutputDirectoryItems)' == 'true' and '%(_MSBuildProjectReferenceExistent.Private)' != 'false' and '$(UseCommonOutputDirectory)' != 'true'" ContinueOnError="$(ContinueOnError)" SkipNonexistentTargets="true" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="_AllChildProjectItemsWithTargetPath" />
    </MSBuild>
    <!-- Target outputs must be full paths because they will be consumed by a different project. -->
    <ItemGroup>
      <_SourceItemsToCopyToOutputDirectoryAlways KeepDuplicates=" '$(_GCTODIKeepDuplicates)' != 'false' " KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(_AllChildProjectItemsWithTargetPath->'%(FullPath)')" Condition="'%(_AllChildProjectItemsWithTargetPath.CopyToOutputDirectory)'=='Always'" />
      <_SourceItemsToCopyToOutputDirectory KeepDuplicates=" '$(_GCTODIKeepDuplicates)' != 'false' " KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(_AllChildProjectItemsWithTargetPath->'%(FullPath)')" Condition="'%(_AllChildProjectItemsWithTargetPath.CopyToOutputDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <!-- Remove items which we will never again use - they just sit around taking up memory otherwise -->
    <ItemGroup>
      <_AllChildProjectItemsWithTargetPath Remove="@(_AllChildProjectItemsWithTargetPath)" />
    </ItemGroup>
    <!-- Get items from this project last so that they will be copied last. -->
    <ItemGroup>
      <_SourceItemsToCopyToOutputDirectoryAlways KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(ContentWithTargetPath->'%(FullPath)')" Condition="'%(ContentWithTargetPath.CopyToOutputDirectory)'=='Always'" />
      <_SourceItemsToCopyToOutputDirectory KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(ContentWithTargetPath->'%(FullPath)')" Condition="'%(ContentWithTargetPath.CopyToOutputDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <_SourceItemsToCopyToOutputDirectoryAlways KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(EmbeddedResource->'%(FullPath)')" Condition="'%(EmbeddedResource.CopyToOutputDirectory)'=='Always'" />
      <_SourceItemsToCopyToOutputDirectory KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(EmbeddedResource->'%(FullPath)')" Condition="'%(EmbeddedResource.CopyToOutputDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <_CompileItemsToCopy Include="@(Compile->'%(FullPath)')" Condition="'%(Compile.CopyToOutputDirectory)'=='Always' or '%(Compile.CopyToOutputDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <AssignTargetPath Files="@(_CompileItemsToCopy)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="_CompileItemsToCopyWithTargetPath" />
    </AssignTargetPath>
    <ItemGroup>
      <_SourceItemsToCopyToOutputDirectoryAlways KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(_CompileItemsToCopyWithTargetPath)" Condition="'%(_CompileItemsToCopyWithTargetPath.CopyToOutputDirectory)'=='Always'" />
      <_SourceItemsToCopyToOutputDirectory KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(_CompileItemsToCopyWithTargetPath)" Condition="'%(_CompileItemsToCopyWithTargetPath.CopyToOutputDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <_SourceItemsToCopyToOutputDirectoryAlways KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(_NoneWithTargetPath->'%(FullPath)')" Condition="'%(_NoneWithTargetPath.CopyToOutputDirectory)'=='Always'" />
      <_SourceItemsToCopyToOutputDirectory KeepMetadata="$(_GCTODIKeepMetadata)" Include="@(_NoneWithTargetPath->'%(FullPath)')" Condition="'%(_NoneWithTargetPath.CopyToOutputDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <AllItemsFullPathWithTargetPath Include="@(_SourceItemsToCopyToOutputDirectoryAlways->'%(FullPath)');@(_SourceItemsToCopyToOutputDirectory->'%(FullPath)')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GetCopyToPublishDirectoryItems

    Default implementation of GetCopyToPublishDirectoryItems for projects that do not
    use Microsoft.NET.Sdk. It simply returns whatever GetCopyToOutputDirectoryItems
    does with CopyToPublishDirectory implied  by CopyToOutputDirectory, which is the
    same as Microsoft.NET.Sdk default when its CopyToPublishDirectory is not used.

    Microsoft.NET.Sdk projects  will override this to allow the publish output to be
    customized independently from the build output.

    Having a default implementation here allows the Microsoft.NET.Sdk Publish target
    to work when a Microsoft.NET.Sdk-based project references a non-Microsoft.NET.Sdk-based
    project.
    ============================================================
    -->
  <Target Name="GetCopyToPublishDirectoryItems" DependsOnTargets="GetCopyToOutputDirectoryItems" Returns="@(AllPublishItemsFullPathWithTargetPath)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <AllPublishItemsFullPathWithTargetPath Include="@(AllItemsFullPathWithTargetPath)">
        <CopyToPublishDirectory>%(CopyToOutputDirectory)</CopyToPublishDirectory>
      </AllPublishItemsFullPathWithTargetPath>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _CopyOutOfDateSourceItemsToOutputDirectory

    Copy files that have the CopyToOutputDirectory attribute set to 'PreserveNewest'.
    ============================================================
    -->
  <Target Name="_CopyOutOfDateSourceItemsToOutputDirectory" Condition=" '@(_SourceItemsToCopyToOutputDirectory)' != '' " Inputs="@(_SourceItemsToCopyToOutputDirectory)" Outputs="@(_SourceItemsToCopyToOutputDirectory->'$(OutDir)%(TargetPath)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Not using SkipUnchangedFiles="true" because the application may want to change
        one of these files and not have an incremental build replace it.
        -->
    <Copy SourceFiles="@(_SourceItemsToCopyToOutputDirectory)" DestinationFiles="@(_SourceItemsToCopyToOutputDirectory->'$(OutDir)%(TargetPath)')" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForAdditionalFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        _CopyOutOfDateSourceItemsToOutputDirectoryAlways

    Copy files that have the CopyToOutputDirectory attribute set to 'Always'.
    ============================================================
    -->
  <Target Name="_CopyOutOfDateSourceItemsToOutputDirectoryAlways" Condition=" '@(_SourceItemsToCopyToOutputDirectoryAlways)' != '' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Not using SkipUnchangedFiles="true" because the application may want to change
        one of these files and not have an incremental build replace it.
        -->
    <Copy SourceFiles="@(_SourceItemsToCopyToOutputDirectoryAlways)" DestinationFiles="@(_SourceItemsToCopyToOutputDirectoryAlways->'$(OutDir)%(TargetPath)')" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForAdditionalFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        _CopyAppConfigFile

    Copy the application config file.
    ============================================================
    -->
  <Target Name="_CopyAppConfigFile" Condition=" '@(AppConfigWithTargetPath)' != '' " Inputs="@(AppConfigWithTargetPath)" Outputs="@(AppConfigWithTargetPath->'$(OutDir)%(TargetPath)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Copy the application's .config file, if any.
        Not using SkipUnchangedFiles="true" because the application may want to change
        the app.config and not have an incremental build replace it.
        -->
    <Copy SourceFiles="@(AppConfigWithTargetPath)" DestinationFiles="@(AppConfigWithTargetPath->'$(OutDir)%(TargetPath)')" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForAdditionalFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ================================================================
                                         _CopyManifestFiles
    ================================================================

    Copy the built manifests (.exe.manifest, .application/.xbap) to the final directory.
    -->
  <Target Name="_CopyManifestFiles" Condition=" '$(_DeploymentCopyApplicationManifest)'=='true' or '$(GenerateClickOnceManifests)'=='true' " DependsOnTargets="PrepareForBuild" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Copy SourceFiles="@(ApplicationManifest)" DestinationFolder="$(OutDir)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForAdditionalFilesIfPossible)" Condition="'$(GenerateClickOnceManifests)'=='true' or '$(_DeploymentCopyApplicationManifest)'=='true'">
      <Output TaskParameter="DestinationFiles" ItemName="_DeploymentMainApplicationManifest" />
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <Message Importance="Normal" Condition="'$(_DeploymentCopyApplicationManifest)'=='true'" Text="$(MSBuildProjectName) -&gt; @(_DeploymentMainApplicationManifest->'%(FullPath)')" />
    <Copy SourceFiles="@(DeployManifest)" DestinationFolder="$(OutDir)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForAdditionalFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForAdditionalFilesIfPossible)" Condition="'$(GenerateClickOnceManifests)'=='true'">
      <Output TaskParameter="DestinationFiles" ItemName="_DeploymentMainDeployManifest" />
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <Message Importance="Normal" Condition="'$(GenerateClickOnceManifests)'=='true'" Text="$(MSBuildProjectName) -&gt; @(_DeploymentMainDeployManifest->'%(FullPath)')" />
  </Target>
  <!--
    ================================================================
                                         _CheckForCompileOutputs

    Checks each file output from the main "Compile" target to make sure they really exist.
    If they do, then record them in the clean cache.
    ============================================================
    -->
  <Target Name="_CheckForCompileOutputs" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--Record the main compile outputs.-->
    <ItemGroup>
      <FileWrites Include="@(IntermediateAssembly)" Condition="Exists('@(IntermediateAssembly)')" />
      <FileWrites Include="@(IntermediateRefAssembly)" Condition="'$(ProduceReferenceAssembly)' == 'true' and Exists('@(IntermediateRefAssembly)')" />
    </ItemGroup>
    <!-- Record the .xml if one was produced. -->
    <PropertyGroup>
      <_DocumentationFileProduced Condition="!Exists('@(DocFileItem)')">false</_DocumentationFileProduced>
    </PropertyGroup>
    <ItemGroup>
      <FileWrites Include="@(DocFileItem)" Condition="'$(_DocumentationFileProduced)'=='true'" />
    </ItemGroup>
    <!-- Record the .pdb if one was produced. -->
    <PropertyGroup>
      <_DebugSymbolsProduced Condition="!Exists('@(_DebugSymbolsIntermediatePath)')">false</_DebugSymbolsProduced>
    </PropertyGroup>
    <ItemGroup>
      <FileWrites Include="@(_DebugSymbolsIntermediatePath)" Condition="'$(_DebugSymbolsProduced)'=='true'" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _SGenCheckForOutputs

    Checks each file output from the "GenerateSerializationAssemblies" target to make sure they really exist.
    If they do, then record them in the clean cache.
    ============================================================
    -->
  <Target Name="_SGenCheckForOutputs" Condition="'$(_SGenGenerateSerializationAssembliesConfig)' == 'On' or ('@(WebReferenceUrl)'!='' and '$(_SGenGenerateSerializationAssembliesConfig)' == 'Auto')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Record the serializer .dll if one was produced.-->
    <PropertyGroup>
      <_SGenDllCreated Condition="Exists('$(IntermediateOutputPath)$(_SGenDllName)')">true</_SGenDllCreated>
    </PropertyGroup>
    <ItemGroup>
      <FileWrites Include="$(IntermediateOutputPath)$(_SGenDllName)" Condition="Exists('$(IntermediateOutputPath)$(_SGenDllName)')" />
    </ItemGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                UnmanagedRegistration Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        UnmanagedRegistration

    Registers the main assembly for COM interop.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <UnmanagedRegistrationDependsOn />
  </PropertyGroup>
  <Target Name="UnmanagedRegistration" Condition="'$(RegisterForComInterop)'=='true' and '$(OutputType)'=='library'" DependsOnTargets="$(UnmanagedRegistrationDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <RegisterAssemblyMSBuildArchitecture Condition="'$(RegisterAssemblyMSBuildArchitecture)' == ''">$(PlatformTargetAsMSBuildArchitecture)</RegisterAssemblyMSBuildArchitecture>
    </PropertyGroup>
    <PropertyGroup Condition="'$(TargetFrameworkAsMSBuildRuntime)' != '' and '$(RegisterAssemblyMSBuildArchitecture)' != ''">
      <!-- Falling back to the current runtime if we are targeting CLR2 and the task host doesn't exist will lead to
           incorrect behavior in some cases, but it's the same incorrect behavior as Visual Studio 2010, and thus better
           than causing build breaks on upgrade to Win8 the way not doing so would.  For more details, see the
           corresponding comment in GenerateResource. -->
      <RegisterAssemblyMSBuildRuntime Condition="'$(RegisterAssemblyMSBuildRuntime)' == '' and                      $([MSBuild]::DoesTaskHostExist(`$(TargetFrameworkAsMSBuildRuntime)`, `$(RegisterAssemblyMSBuildArchitecture)`))">$(TargetFrameworkAsMSBuildRuntime)</RegisterAssemblyMSBuildRuntime>
      <!-- If the targeted runtime doesn't exist, fall back to current -->
      <RegisterAssemblyMSBuildRuntime Condition="'$(RegisterAssemblyMSBuildRuntime)' == ''">CurrentRuntime</RegisterAssemblyMSBuildRuntime>
    </PropertyGroup>
    <RegisterAssembly Assemblies="@(_OutputPathItem->'%(FullPath)$(TargetFileName)')" TypeLibFiles="@(_OutputPathItem->'%(FullPath)$(TargetName).tlb')" AssemblyListFile="@(_UnmanagedRegistrationCache)" CreateCodeBase="true" MSBuildRuntime="$(RegisterAssemblyMSBuildRuntime)" MSBuildArchitecture="$(RegisterAssemblyMSBuildArchitecture)" Condition="!Exists('@(_UnmanagedRegistrationCache)')" />
    <ItemGroup>
      <FileWrites Include="@(_OutputPathItem->'%(FullPath)$(TargetName).tlb')" />
    </ItemGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                IncrementalClean Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        IncrementalClean

    Remove files that were produced in a prior build but weren't produced in the current build.
    The reason is that if, for example, the name of the .exe has changed we want to delete the
    old copy.

    Leave the Clean cache file containing only the files produced in the current build.
    ============================================================
    -->
  <Target Name="IncrementalClean" DependsOnTargets="_CleanGetCurrentAndPriorFileWrites" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Subtract list of files produced in prior builds from list of files produced in this build. -->
    <ItemGroup>
      <_CleanOrphanFileWrites Include="@(_CleanPriorFileWrites)" Exclude="@(_CleanCurrentFileWrites)" />
    </ItemGroup>
    <!-- Find all files in the final output directory. -->
    <FindUnderPath Path="$(OutDir)" Files="@(_CleanOrphanFileWrites)">
      <Output TaskParameter="InPath" ItemName="_CleanOrphanFileWritesInOutput" />
    </FindUnderPath>
    <!-- Find all files in the intermediate output directory. -->
    <FindUnderPath Path="$(IntermediateOutputPath)" Files="@(_CleanOrphanFileWrites)">
      <Output TaskParameter="InPath" ItemName="_CleanOrphanFileWritesInIntermediate" />
    </FindUnderPath>
    <!-- Delete the orphaned files. -->
    <Delete Files="@(_CleanOrphanFileWritesInIntermediate);@(_CleanOrphanFileWritesInOutput)" TreatErrorsAsWarnings="true">
      <Output TaskParameter="DeletedFiles" ItemName="_CleanOrphanFilesDeleted" />
    </Delete>
    <!-- Create a list of everything that wasn't deleted or was outside
             the current final output and intermediate output directories. -->
    <ItemGroup>
      <_CleanRemainingFileWritesAfterIncrementalClean Include="@(_CleanPriorFileWrites);@(_CleanCurrentFileWrites)" Exclude="@(_CleanOrphanFilesDeleted)" />
    </ItemGroup>
    <!-- Remove duplicates. -->
    <RemoveDuplicates Inputs="@(_CleanRemainingFileWritesAfterIncrementalClean)">
      <Output TaskParameter="Filtered" ItemName="_CleanUniqueRemainingFileWritesAfterIncrementalClean" />
    </RemoveDuplicates>
    <!-- Write new list of current files back to disk, replacing the existing list.-->
    <WriteLinesToFile File="$(IntermediateOutputPath)$(CleanFile)" Lines="@(_CleanUniqueRemainingFileWritesAfterIncrementalClean)" Condition="'@(_CleanUnfilteredPriorFileWrites)'!='@(_CleanUniqueRemainingFileWritesAfterIncrementalClean)'" Overwrite="true" />
  </Target>
  <!--
    ============================================================
                                        _CleanGetCurrentAndPriorFileWrites

    Get the list of files built in the current build and in prior builds.
    ============================================================
    -->
  <Target Name="_CleanGetCurrentAndPriorFileWrites" DependsOnTargets="_CheckForCompileOutputs;_SGenCheckForOutputs" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Read the list of files produced by a prior builds from disk. -->
    <ReadLinesFromFile File="$(IntermediateOutputPath)$(CleanFile)">
      <Output TaskParameter="Lines" ItemName="_CleanUnfilteredPriorFileWrites" />
    </ReadLinesFromFile>
    <!--
        Convert the list of references to the absolute paths so we can make valid comparisons
        across two lists
         -->
    <ConvertToAbsolutePath Paths="@(_ResolveAssemblyReferenceResolvedFiles)">
      <Output TaskParameter="AbsolutePaths" ItemName="_ResolveAssemblyReferenceResolvedFilesAbsolute" />
    </ConvertToAbsolutePath>
    <!--
        Subtract any resolved assembly files from *prior* file writes because deleting
        these would break subsequent builds because the assemblies would be unresolvable.
         -->
    <ItemGroup>
      <_CleanPriorFileWrites Include="@(_CleanUnfilteredPriorFileWrites)" Exclude="@(_ResolveAssemblyReferenceResolvedFilesAbsolute)" />
    </ItemGroup>
    <!--
        Of shareable files, keep only those that are in the project's directory.
        We never clean shareable files outside of the project directory because
        the build may be to a common output directory and other projects may need
        them.

        Only subtract the outputs from ResolveAssemblyReferences target because that's the
        only "Resolve" target that tries to resolve assemblies directly from the output
        directory.
        -->
    <FindUnderPath Path="$(MSBuildProjectDirectory)" Files="@(FileWritesShareable)" UpdateToAbsolutePaths="true">
      <Output TaskParameter="InPath" ItemName="FileWrites" />
    </FindUnderPath>
    <!-- Find all files in the final output directory. -->
    <FindUnderPath Path="$(OutDir)" Files="@(FileWrites)" UpdateToAbsolutePaths="true">
      <Output TaskParameter="InPath" ItemName="_CleanCurrentFileWritesInOutput" />
    </FindUnderPath>
    <!-- Find all files in the intermediate output directory. -->
    <FindUnderPath Path="$(IntermediateOutputPath)" Files="@(FileWrites)" UpdateToAbsolutePaths="true">
      <Output TaskParameter="InPath" ItemName="_CleanCurrentFileWritesInIntermediate" />
    </FindUnderPath>
    <!--
        Subtract any resolved assembly files from *current* file writes because deleting
        these would break subsequent builds because the assemblies would be unresolvable.

        Only subtract the outputs from ResolveAssemblyReferences target because that's the
        only "Resolve" target that tries to resolve assemblies directly from the output
        directory.
         -->
    <ItemGroup>
      <_CleanCurrentFileWritesWithNoReferences Include="@(_CleanCurrentFileWritesInOutput);@(_CleanCurrentFileWritesInIntermediate)" Exclude="@(_ResolveAssemblyReferenceResolvedFilesAbsolute)" />
    </ItemGroup>
    <!-- Remove duplicates from files produced in this build. -->
    <RemoveDuplicates Inputs="@(_CleanCurrentFileWritesWithNoReferences)">
      <Output TaskParameter="Filtered" ItemName="_CleanCurrentFileWrites" />
    </RemoveDuplicates>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                Clean Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        Clean

    Delete all intermediate and final build outputs.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CleanDependsOn>
      BeforeClean;
      UnmanagedUnregistration;
      CoreClean;
      CleanReferencedProjects;
      CleanPublishFolder;
      AfterClean
    </CleanDependsOn>
  </PropertyGroup>
  <Target Name="Clean" Condition=" '$(_InvalidConfigurationWarning)' != 'true' " DependsOnTargets="$(CleanDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BeforeClean

    Redefine this target in your project in order to run tasks just before Clean.
    ============================================================
    -->
  <Target Name="BeforeClean" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterClean

    Redefine this target in your project in order to run tasks just after Clean.
    ============================================================
    -->
  <Target Name="AfterClean" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        CleanReferencedProjects

    Call Clean target on all Referenced Projects.
    ============================================================
    -->
  <Target Name="CleanReferencedProjects" DependsOnTargets="PrepareProjectReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        When building the project directly from the command-line, clean those referenced projects
        that exist on disk.  For IDE builds and command-line .SLN builds, the solution build manager
        takes care of this.
        -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="Clean" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" BuildInParallel="$(BuildInParallel)" Condition="'$(BuildingInsideVisualStudio)' != 'true' and '$(BuildProjectReferences)' == 'true' and '@(_MSBuildProjectReferenceExistent)' != ''" ContinueOnError="$(ContinueOnError)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)" />
  </Target>
  <!--
    ============================================================
                                        CoreClean
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CoreCleanDependsOn />
  </PropertyGroup>
  <Target Name="CoreClean" DependsOnTargets="$(CoreCleanDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- First clean any explicitly specified cleanable files.
             Declare items of this type if you want Clean to delete them. -->
    <Delete Files="@(Clean)" TreatErrorsAsWarnings="true" />
    <!-- Read in list of files that were written to disk in past builds. -->
    <ReadLinesFromFile File="$(IntermediateOutputPath)$(CleanFile)">
      <Output TaskParameter="Lines" ItemName="_CleanPriorFileWrites" />
    </ReadLinesFromFile>
    <!-- Find all files in the final output directory. -->
    <FindUnderPath Path="$(OutDir)" Files="@(_CleanPriorFileWrites)">
      <Output TaskParameter="InPath" ItemName="_CleanPriorFileWritesInOutput" />
    </FindUnderPath>
    <!-- Find all files in the intermediate output directory. -->
    <FindUnderPath Path="$(IntermediateOutputPath)" Files="@(_CleanPriorFileWrites)">
      <Output TaskParameter="InPath" ItemName="_CleanPriorFileWritesInIntermediate" />
    </FindUnderPath>
    <!-- Delete those files. -->
    <Delete Files="@(_CleanPriorFileWritesInOutput);@(_CleanPriorFileWritesInIntermediate)" TreatErrorsAsWarnings="true">
      <Output TaskParameter="DeletedFiles" ItemName="_CleanPriorFileWritesDeleted" />
    </Delete>
    <!-- Create a list of everything that wasn't deleted. -->
    <ItemGroup>
      <_CleanRemainingFileWritesAfterClean Include="@(_CleanPriorFileWrites)" Exclude="@(_CleanPriorFileWritesDeleted)" />
    </ItemGroup>
    <!-- Remove duplicates. -->
    <RemoveDuplicates Inputs="@(_CleanRemainingFileWritesAfterClean)">
      <Output TaskParameter="Filtered" ItemName="_CleanUniqueRemainingFileWrites" />
    </RemoveDuplicates>
    <!-- Make sure the directory exists. -->
    <MakeDir Directories="$(IntermediateOutputPath)" />
    <!-- Write new list of current files back to disk. -->
    <WriteLinesToFile File="$(IntermediateOutputPath)$(CleanFile)" Lines="@(_CleanUniqueRemainingFileWrites)" Overwrite="true" />
  </Target>
  <!--
    ============================================================
                                        _CleanRecordFileWrites

    Save the list of all files written to disk so that it can be used for "Clean" later.

    Files written in prior builds are not removed from Clean cache.
    ============================================================
    -->
  <Target Name="_CleanRecordFileWrites" DependsOnTargets="_CleanGetCurrentAndPriorFileWrites" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Merge list of files from prior builds with the current build and then
        remove duplicates.
        -->
    <RemoveDuplicates Inputs="@(_CleanPriorFileWrites);@(_CleanCurrentFileWrites)">
      <Output TaskParameter="Filtered" ItemName="_CleanUniqueFileWrites" />
    </RemoveDuplicates>
    <!-- Make sure the directory exists. -->
    <MakeDir Directories="$(IntermediateOutputPath)" />
    <!-- Write merged file list back to disk, replacing existing contents. -->
    <WriteLinesToFile File="$(IntermediateOutputPath)$(CleanFile)" Lines="@(_CleanUniqueFileWrites)" Overwrite="true" />
  </Target>
  <!--
    ============================================================
                                        CleanPublishFolder
    ============================================================
    -->
  <Target Name="CleanPublishFolder" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RemoveDir Directories="$(PublishDir)" Condition="'$(PublishDir)'=='$(OutputPath)app.publish\' and Exists('$(PublishDir)')" />
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                PostBuildEvent Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        PostBuildEvent

    Run the post-build event. This step is driven by two parameters:

    (1) The $(RunPostBuildEvent) property is set by the user through the IDE and can be one of four values.

        - OnBuildSuccess: In this case, every step of the build must succeed for the post-build step to run.
        - <Blank>: This is the same as OnBuildSuccess.
        - OnOutputUpdated: In this case, the post-build step will run only if the main output assembly was
        actually updated.
        - Always: The post-build step is always run.

    (2) The $(_AssemblyTimestampBeforeCompile) and $(_AssemblyTimestampAfterCompile) values are
        set by the _TimeStampBeforeCompile and _TimeStampAfterCompile targets.  If the assembly was actually
        rebuilt during this build, then the two values will be different.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PostBuildEventDependsOn />
  </PropertyGroup>
  <Target Name="PostBuildEvent" Condition="'$(PostBuildEvent)' != '' and ('$(RunPostBuildEvent)' != 'OnOutputUpdated' or '$(_AssemblyTimestampBeforeCompile)' != '$(_AssemblyTimestampAfterCompile)')" DependsOnTargets="$(PostBuildEventDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Exec WorkingDirectory="$(OutDir)" Command="$(PostBuildEvent)" />
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                Publish Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        Publish

    This target is only called when doing ClickOnce publishing outside the IDE, which implicitly builds before publishing.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PublishDependsOn Condition="'$(PublishableProject)'=='true'">
      SetGenerateManifests;
      Build;
      PublishOnly
    </PublishDependsOn>
    <PublishDependsOn Condition="'$(PublishableProject)'!='true'">
      _DeploymentUnpublishable
    </PublishDependsOn>
  </PropertyGroup>
  <Target Name="Publish" DependsOnTargets="$(PublishDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _DeploymentUnpublishable

    This target is used to block an attempt to ClickOnce publish a non-publishable project, such as a ClassLibrary, when building outside the IDE.
    ============================================================
    -->
  <Target Name="_DeploymentUnpublishable" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Message Text="Skipping unpublishable project." />
  </Target>
  <!--
    ============================================================
                                        SetGenerateManifests

    This target simply assures the GenerateClickOnceManifests property is set whenever the publish target is invoked.
    ============================================================
    -->
  <Target Name="SetGenerateManifests" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Error Condition="'$(OutputType)'!='winexe' and '$(OutputType)'!='exe' and '$(OutputType)'!='appcontainerexe'" Text="Publish is only valid for 'Windows Application' or 'Console Application' project types." />
    <Error Condition="'$(_DeploymentSignClickOnceManifests)'=='true' and '$(ManifestCertificateThumbprint)'=='' and '$(ManifestKeyFile)'==''" Text="A signing key is required in order to publish this project. Please specify a ManifestKeyFile or ManifestCertificateThumbprint value. Publishing from Visual Studio will automatically configure a signing key for this project." />
    <PropertyGroup>
      <GenerateClickOnceManifests>true</GenerateClickOnceManifests>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        PublishOnly

    The "PublishOnly" target is intended for ClickOnce publishing inside the IDE, where the build has already been done
    by the BuildManager.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PublishOnlyDependsOn>
      SetGenerateManifests;
      PublishBuild;
      BeforePublish;
      GenerateManifests;
      CopyFilesToOutputDirectory;
      _CopyFilesToPublishFolder;
      _DeploymentGenerateBootstrapper;
      ResolveKeySource;
      _DeploymentSignClickOnceDeployment;
      AfterPublish
    </PublishOnlyDependsOn>
  </PropertyGroup>
  <Target Name="PublishOnly" DependsOnTargets="$(PublishOnlyDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BeforePublish

    Redefine this target in your project in order to run tasks just before Publish.
    ============================================================
    -->
  <Target Name="BeforePublish" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        AfterPublish

    Redefine this target in your project in order to run tasks just after Publish.
    ============================================================
    -->
  <Target Name="AfterPublish" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        PublishBuild

    Defines the set of targets that publishing is directly dependent on.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PublishBuildDependsOn>
      BuildOnlySettings;
      PrepareForBuild;
      ResolveReferences;
      PrepareResources;
      ResolveKeySource;
      GenerateSerializationAssemblies;
      CreateSatelliteAssemblies;
    </PublishBuildDependsOn>
  </PropertyGroup>
  <Target Name="PublishBuild" DependsOnTargets="$(PublishBuildDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _CopyFilesToPublishFolder
    ============================================================
    -->
  <Target Name="_CopyFilesToPublishFolder" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Compute name of application folder, which includes the assembly name plus formatted application version.
             The application version is formatted to use "_" in place of "." chars (i.e. "1_0_0_0" instead of "1.0.0.0").
             This is done because some servers misinterpret "." as a file extension. -->
    <FormatVersion Version="$(ApplicationVersion)" Revision="$(ApplicationRevision)" FormatType="Path">
      <Output TaskParameter="OutputVersion" PropertyName="_DeploymentApplicationVersionFragment" />
    </FormatVersion>
    <PropertyGroup>
      <_DeploymentApplicationFolderName>Application Files\$(AssemblyName)_$(_DeploymentApplicationVersionFragment)</_DeploymentApplicationFolderName>
      <_DeploymentApplicationDir>$(PublishDir)$(_DeploymentApplicationFolderName)\</_DeploymentApplicationDir>
    </PropertyGroup>
    <PropertyGroup>
      <!-- By default we're not using Hard or Symbolic Links to copy to the publish directory, and never when building in VS -->
      <CreateHardLinksForPublishFilesIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateHardLinksForPublishFilesIfPossible)' == ''">false</CreateHardLinksForPublishFilesIfPossible>
      <CreateSymbolicLinksForPublishFilesIfPossible Condition="'$(BuildingInsideVisualStudio)' == 'true' or '$(CreateSymbolicLinksForPublishFilesIfPossible)' == ''">false</CreateSymbolicLinksForPublishFilesIfPossible>
    </PropertyGroup>
    <!-- Copy files to publish folder -->
    <Copy SourceFiles="@(_ApplicationManifestFinal);                 @(_DeploymentResolvedManifestEntryPoint);                 @(_DeploymentManifestFiles);                 @(ReferenceComWrappersToCopyLocal);                 @(ResolvedIsolatedComModules);                 @(_DeploymentLooseManifestFile)" DestinationFiles="@(_ApplicationManifestFinal->'$(_DeploymentApplicationDir)%(TargetPath)');                 @(_DeploymentManifestEntryPoint->'$(_DeploymentApplicationDir)%(TargetPath)$(_DeploymentFileMappingExtension)');                 @(_DeploymentManifestFiles->'$(_DeploymentApplicationDir)%(TargetPath)$(_DeploymentFileMappingExtension)');                 @(ReferenceComWrappersToCopyLocal->'$(_DeploymentApplicationDir)%(FileName)%(Extension)$(_DeploymentFileMappingExtension)');                 @(ResolvedIsolatedComModules->'$(_DeploymentApplicationDir)%(FileName)%(Extension)$(_DeploymentFileMappingExtension)');                 @(_DeploymentLooseManifestFile->'$(_DeploymentApplicationDir)%(FileName)%(Extension)$(_DeploymentFileMappingExtension)')" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" />
    <Copy SourceFiles="@(_DeploymentManifestDependencies)" DestinationFiles="@(_DeploymentManifestDependencies->'$(_DeploymentApplicationDir)%(TargetPath)$(_DeploymentFileMappingExtension)')" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)" Condition="'%(_DeploymentManifestDependencies.DependencyType)'=='Install'" />
    <Copy SourceFiles="@(_ReferenceScatterPaths)" DestinationFiles="@(_ReferenceScatterPaths->'$(_DeploymentApplicationDir)%(Filename)%(Extension)$(_DeploymentFileMappingExtension)')" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)" />
    <FormatUrl InputUrl="$(_DeploymentApplicationUrl)">
      <Output TaskParameter="OutputUrl" PropertyName="_DeploymentFormattedApplicationUrl" />
    </FormatUrl>
    <FormatUrl InputUrl="$(_DeploymentComponentsUrl)">
      <Output TaskParameter="OutputUrl" PropertyName="_DeploymentFormattedComponentsUrl" />
    </FormatUrl>
  </Target>
  <!--
    ============================================================
                                        _DeploymentGenerateBootstrapper
    ============================================================
    -->
  <Target Name="_DeploymentGenerateBootstrapper" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Build setup.exe bootstrapper and copy referenced packages -->
    <GenerateBootstrapper ApplicationFile="$(TargetDeployManifestFileName)" ApplicationName="$(AssemblyName)" ApplicationUrl="$(_DeploymentFormattedApplicationUrl)" BootstrapperItems="@(BootstrapperPackage)" ComponentsLocation="$(BootstrapperComponentsLocation)" ComponentsUrl="$(_DeploymentFormattedComponentsUrl)" Culture="$(TargetCulture)" FallbackCulture="$(FallbackCulture)" OutputPath="$(PublishDir)" SupportUrl="$(_DeploymentFormattedSupportUrl)" Path="$(GenerateBootstrapperSdkPath)" VisualStudioVersion="$(VisualStudioVersion)" Condition="'$(BootstrapperEnabled)'=='true'" />
  </Target>
  <!--
    ============================================================
                                        _DeploymentSignClickOnceDeployment
    ============================================================
    -->
  <Target Name="_DeploymentSignClickOnceDeployment" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Sign manifests and the bootstrapper -->
    <SignFile CertificateThumbprint="$(_DeploymentResolvedManifestCertificateThumbprint)" TimestampUrl="$(ManifestTimestampUrl)" SigningTarget="$(_DeploymentApplicationDir)$(_DeploymentTargetApplicationManifestFileName)" TargetFrameworkVersion="$(TargetFrameworkVersion)" Condition="'$(_DeploymentSignClickOnceManifests)'=='true'" />
    <!-- Update entry point path in deploy manifest -->
    <UpdateManifest ApplicationPath="$(_DeploymentApplicationFolderName)\$(_DeploymentTargetApplicationManifestFileName)" TargetFrameworkVersion="$(TargetFrameworkVersion)" ApplicationManifest="$(_DeploymentApplicationDir)$(_DeploymentTargetApplicationManifestFileName)" InputManifest="$(OutDir)$(TargetDeployManifestFileName)" OutputManifest="$(PublishDir)$(TargetDeployManifestFileName)">
      <Output TaskParameter="OutputManifest" ItemName="PublishedDeployManifest" />
    </UpdateManifest>
    <SignFile CertificateThumbprint="$(_DeploymentResolvedManifestCertificateThumbprint)" TimestampUrl="$(ManifestTimestampUrl)" SigningTarget="$(PublishDir)$(TargetDeployManifestFileName)" TargetFrameworkVersion="$(TargetFrameworkVersion)" Condition="'$(_DeploymentSignClickOnceManifests)'=='true'" />
    <SignFile CertificateThumbprint="$(_DeploymentResolvedManifestCertificateThumbprint)" TimestampUrl="$(ManifestTimestampUrl)" SigningTarget="$(PublishDir)\setup.exe" Condition="'$(BootstrapperEnabled)'=='true' and '$(_DeploymentSignClickOnceManifests)'=='true'" />
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                AllProjectOutputGroups Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        AllProjectOutputGroups

    The targets below drive output groups, which provide generic information about a
    project's inputs (e.g., content files, compilation sources, etc.) and built outputs
    (e.g., built EXE/DLL, PDB, XML documentation files, etc.)

    Each target may produce two kinds of items:  outputs and dependencies.  Outputs are
    items from the current project; dependencies are items that are brought into the
    current project as a result of referencing other projects or components.

    For both outputs and dependencies, the Include attribute
    specifies the location of the output/dependency; it must be a full path.  Any number
    of additional attributes may be placed on an output/dependency item.
    ============================================================
    -->
  <Target Name="AllProjectOutputGroups" DependsOnTargets="             BuiltProjectOutputGroup;             DebugSymbolsProjectOutputGroup;             DocumentationProjectOutputGroup;             SatelliteDllsProjectOutputGroup;             SourceFilesProjectOutputGroup;             ContentFilesProjectOutputGroup;             SGenFilesOutputGroup" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    This is the key output for the BuiltProjectOutputGroup and is meant to be read directly from the IDE.
    Reading an item is faster than invoking a target.
    -->
  <ItemGroup Condition=" '$(OutputType)' != 'winmdobj' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuiltProjectOutputGroupKeyOutput Include="@(IntermediateAssembly->'%(FullPath)')">
      <IsKeyOutput>true</IsKeyOutput>
      <FinalOutputPath>$(TargetPath)</FinalOutputPath>
      <TargetPath>$(TargetFileName)</TargetPath>
      <COM2REG Condition="'$(RegisterForComInterop)'=='true' and '$(OutputType)'=='library'">true</COM2REG>
    </BuiltProjectOutputGroupKeyOutput>
  </ItemGroup>
  <ItemGroup Condition=" '$(OutputType)' == 'winmdobj' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WinMDExpOutputWindowsMetadataFileItem Include="$(_IntermediateWindowsMetadataPath)" Condition="'$(_IntermediateWindowsMetadataPath)' != ''" />
    <BuiltProjectOutputGroupKeyOutput Include="@(WinMDExpOutputWindowsMetadataFileItem->'%(FullPath)')">
      <IsKeyOutput>true</IsKeyOutput>
      <FinalOutputPath>$(TargetPath)</FinalOutputPath>
      <TargetPath>$(TargetFileName)</TargetPath>
    </BuiltProjectOutputGroupKeyOutput>
  </ItemGroup>
  <!--
    ============================================================
                                        BuiltProjectOutputGroup
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuiltProjectOutputGroupDependsOn>PrepareForBuild</BuiltProjectOutputGroupDependsOn>
    <AddAppConfigToBuildOutputs Condition="('$(AddAppConfigToBuildOutputs)'=='') and ('$(OutputType)'!='library' and '$(OutputType)'!='winmdobj')">true</AddAppConfigToBuildOutputs>
  </PropertyGroup>
  <Target Name="BuiltProjectOutputGroup" Returns="@(BuiltProjectOutputGroupOutput)" DependsOnTargets="$(BuiltProjectOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_BuiltProjectOutputGroupOutputIntermediate Include="@(BuiltProjectOutputGroupKeyOutput)" />
    </ItemGroup>
    <!-- This item represents the app.config file -->
    <ItemGroup>
      <_BuiltProjectOutputGroupOutputIntermediate Include="$(AppConfig)" Condition="'$(AddAppConfigToBuildOutputs)'=='true'">
        <FinalOutputPath>$(TargetDir)$(TargetFileName).config</FinalOutputPath>
        <TargetPath>$(TargetFileName).config</TargetPath>
        <!-- For compatibility with 2.0 -->
        <OriginalItemSpec>$(AppConfig)</OriginalItemSpec>
      </_BuiltProjectOutputGroupOutputIntermediate>
    </ItemGroup>
    <ItemGroup>
      <_IsolatedComReference Include="@(COMReference)" Condition=" '%(COMReference.Isolated)' == 'true' " />
      <_IsolatedComReference Include="@(COMFileReference)" Condition=" '%(COMFileReference.Isolated)' == 'true' " />
    </ItemGroup>
    <!-- This item represents the native manifest, example: WindowsApplication1.exe.manifest or Native.ClassLibrary1.manifest -->
    <ItemGroup>
      <_BuiltProjectOutputGroupOutputIntermediate Include="$(OutDir)$(_DeploymentTargetApplicationManifestFileName)" Condition="'@(NativeReference)'!='' or '@(_IsolatedComReference)'!=''">
        <TargetPath>$(_DeploymentTargetApplicationManifestFileName)</TargetPath>
        <!-- For compatibility with 2.0 -->
        <OriginalItemSpec>$(OutDir)$(_DeploymentTargetApplicationManifestFileName)</OriginalItemSpec>
      </_BuiltProjectOutputGroupOutputIntermediate>
    </ItemGroup>
    <!-- Convert intermediate items into final items; this way we can get the full path for each item -->
    <ItemGroup>
      <BuiltProjectOutputGroupOutput Include="@(_BuiltProjectOutputGroupOutputIntermediate->'%(FullPath)')">
        <!-- For compatibility with 2.0 -->
        <OriginalItemSpec Condition="'%(_BuiltProjectOutputGroupOutputIntermediate.OriginalItemSpec)' == ''">%(_BuiltProjectOutputGroupOutputIntermediate.FullPath)</OriginalItemSpec>
      </BuiltProjectOutputGroupOutput>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        DebugSymbolsProjectOutputGroup

    This target performs population of the Debug Symbols project output group.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DebugSymbolsProjectOutputGroupDependsOn />
  </PropertyGroup>
  <ItemGroup Condition="'$(_DebugSymbolsProduced)' != 'false' and '$(OutputType)' != 'winmdobj'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DebugSymbolsProjectOutputGroupOutput Include="@(_DebugSymbolsIntermediatePath->'%(FullPath)')">
      <FinalOutputPath>@(_DebugSymbolsOutputPath->'%(FullPath)')</FinalOutputPath>
      <TargetPath>@(_DebugSymbolsIntermediatePath->'%(Filename)%(Extension)')</TargetPath>
    </DebugSymbolsProjectOutputGroupOutput>
  </ItemGroup>
  <ItemGroup Condition="'$(_DebugSymbolsProduced)' != 'false' and '$(OutputType)' == 'winmdobj'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WinMDExpOutputPdbItem Include="$(WinMDExpOutputPdb)" Condition="'$(WinMDExpOutputPdb)' != ''" />
    <WinMDExpFinalOutputPdbItem Include="$(_WinMDDebugSymbolsOutputPath)" Condition="'$(_WinMDDebugSymbolsOutputPath)' != ''" />
    <DebugSymbolsProjectOutputGroupOutput Include="@(WinMDExpOutputPdbItem->'%(FullPath)')">
      <FinalOutputPath>@(WinMDExpFinalOutputPdbItem->'%(FullPath)')</FinalOutputPath>
      <TargetPath>@(WinMDExpOutputPdbItem->'%(Filename)%(Extension)')</TargetPath>
    </DebugSymbolsProjectOutputGroupOutput>
  </ItemGroup>
  <Target Name="DebugSymbolsProjectOutputGroup" Returns="@(DebugSymbolsProjectOutputGroupOutput)" DependsOnTargets="$(DebugSymbolsProjectOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        DocumentationProjectOutputGroup

    This target performs population of the Documentation project output group.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DocumentationProjectOutputGroupDependsOn />
  </PropertyGroup>
  <ItemGroup Condition="'$(DocumentationFile)'!='' and '$(OutputType)' != 'winmdobj'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DocumentationProjectOutputGroupOutput Include="@(DocFileItem->'%(FullPath)')">
      <FinalOutputPath>@(FinalDocFile->'%(FullPath)')</FinalOutputPath>
      <IsKeyOutput>true</IsKeyOutput>
      <TargetPath>@(DocFileItem->'%(Filename)%(Extension)')</TargetPath>
    </DocumentationProjectOutputGroupOutput>
  </ItemGroup>
  <ItemGroup Condition="'$(DocumentationFile)' != '' and '$(OutputType)' == 'winmdobj'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <WinMDOutputDocumentationFileItem Include="$(WinMDOutputDocumentationFile)" Condition="'$(WinMDOutputDocumentationFile)' != ''" />
    <WinMDExpFinalOutputDocItem Include="$(_WinMDDocFileOutputPath)" Condition="'$(_WinMDDocFileOutputPath)' != ''" />
    <DocumentationProjectOutputGroupOutput Include="@(WinMDOutputDocumentationFileItem->'%(FullPath)')">
      <FinalOutputPath>@(WinMDExpFinalOutputDocItem->'%(FullPath)')</FinalOutputPath>
      <TargetPath>@(WinMDOutputDocumentationFileItem->'%(Filename)%(Extension)')</TargetPath>
    </DocumentationProjectOutputGroupOutput>
  </ItemGroup>
  <Target Name="DocumentationProjectOutputGroup" Returns="@(DocumentationProjectOutputGroupOutput)" DependsOnTargets="$(DocumentationProjectOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        SatelliteDllsProjectOutputGroup

    This target performs population of the Satellite Files project output group.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SatelliteDllsProjectOutputGroupDependsOn>PrepareForBuild;PrepareResourceNames</SatelliteDllsProjectOutputGroupDependsOn>
  </PropertyGroup>
  <Target Name="SatelliteDllsProjectOutputGroup" Returns="@(SatelliteDllsProjectOutputGroupOutput)" DependsOnTargets="$(SatelliteDllsProjectOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <SatelliteDllsProjectOutputGroupOutputIntermediate Include="$(IntermediateOutputPath)%(EmbeddedResource.Culture)\$(TargetName).resources.dll" Condition="'%(EmbeddedResource.WithCulture)' == 'true'">
        <TargetPath>%(EmbeddedResource.Culture)\$(TargetName).resources.dll</TargetPath>
        <Culture>%(EmbeddedResource.Culture)</Culture>
      </SatelliteDllsProjectOutputGroupOutputIntermediate>
    </ItemGroup>
    <!-- Convert intermediate items into final items; this way we can get the full path for each item. -->
    <ItemGroup>
      <SatelliteDllsProjectOutputGroupOutput Include="@(SatelliteDllsProjectOutputGroupOutputIntermediate->'%(FullPath)')">
        <FinalOutputPath Condition=" '%(SatelliteDllsProjectOutputGroupOutputIntermediate.FinalOutputPath)' == '' ">$(TargetDir)%(SatelliteDllsProjectOutputGroupOutputIntermediate.TargetPath)</FinalOutputPath>
        <!-- For compatibility with 2.0 -->
        <OriginalItemSpec>%(SatelliteDllsProjectOutputGroupOutputIntermediate.Identity)</OriginalItemSpec>
      </SatelliteDllsProjectOutputGroupOutput>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        SourceFilesProjectOutputGroup

    This target performs population of the Source Files project output group.
    Source files are items in the project whose type is "Compile" and "EmbeddedResource".
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SourceFilesProjectOutputGroupDependsOn>PrepareForBuild;AssignTargetPaths</SourceFilesProjectOutputGroupDependsOn>
  </PropertyGroup>
  <Target Name="SourceFilesProjectOutputGroup" Returns="@(SourceFilesProjectOutputGroupOutput)" DependsOnTargets="$(SourceFilesProjectOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <AssignTargetPath Files="@(Compile)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="_CompileWithTargetPath" />
    </AssignTargetPath>
    <ItemGroup>
      <!-- First we deal with Compile, EmbeddedResource and AppConfig -->
      <SourceFilesProjectOutputGroupOutput Include="@(_CompileWithTargetPath->'%(FullPath)');@(EmbeddedResource->'%(FullPath)');@(_LicxFile->'%(FullPath)');@(AppConfigWithTargetPath->'%(FullPath)')" />
      <!-- Include the project file -->
      <SourceFilesProjectOutputGroupOutput Include="$(MSBuildProjectFullPath)">
        <!-- For compatibility with 2.0 -->
        <OriginalItemSpec>$(MSBuildProjectFullPath)</OriginalItemSpec>
        <TargetPath>$(ProjectFileName)</TargetPath>
      </SourceFilesProjectOutputGroupOutput>
    </ItemGroup>
  </Target>
  <!-- Get just the compile items -->
  <Target Name="GetCompile" Returns="@(Compile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        ContentFilesProjectOutputGroup

    This target performs population of the Content Files project output group.
    Content files are items in the project whose type is "Content".
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ContentFilesProjectOutputGroupDependsOn>PrepareForBuild;AssignTargetPaths</ContentFilesProjectOutputGroupDependsOn>
  </PropertyGroup>
  <Target Name="ContentFilesProjectOutputGroup" Returns="@(ContentFilesProjectOutputGroupOutput)" DependsOnTargets="$(ContentFilesProjectOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Convert items into final items; this way we can get the full path for each item. -->
    <ItemGroup>
      <ContentFilesProjectOutputGroupOutput Include="@(ContentWithTargetPath->'%(FullPath)')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        SGenFilesOutputGroup

    This target performs population of the GenerateSerializationAssemblies Files project output group.
    GenerateSerializationAssemblies files are those generated by the GenerateSerializationAssemblies target and task.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SGenFilesOutputGroupDependsOn />
  </PropertyGroup>
  <ItemGroup Condition="'$(_SGenGenerateSerializationAssembliesConfig)' == 'On' or ('@(WebReferenceUrl)'!='' and '$(_SGenGenerateSerializationAssembliesConfig)' == 'Auto')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SGenFilesOutputGroupOutput Include="@(_OutputPathItem->'%(FullPath)$(_SGenDllName)')">
      <FinalOutputPath>@(_OutputPathItem->'%(FullPath)$(_SGenDllName)')</FinalOutputPath>
      <TargetPath>$(_SGenDllName)</TargetPath>
    </SGenFilesOutputGroupOutput>
  </ItemGroup>
  <Target Name="SGenFilesOutputGroup" Returns="@(SGenFilesOutputGroupOutput)" DependsOnTargets="$(SGenFilesOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        SDKRelated Output groups

    These targets are to gather information from the SDKs.
    ============================================================
   -->
  <!-- Get the resolved SDK reference items -->
  <Target Name="GetResolvedSDKReferences" DependsOnTargets="ResolveSDKReferences" Returns="@(ResolvedSDKReference)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!-- Target will return no results by default but will be populated by other targets elsewhere.
       Needed for certain build environments that import partial sets of targets. -->
  <Target Name="CollectReferencedNuGetPackages" Returns="@(ReferencedNuGetPackages)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        PriFilesOutputGroup

    This target performs population of the pri files output group
    ============================================================
    -->
  <Target Name="PriFilesOutputGroup" Condition="'@(_ReferenceRelatedPaths)' != ''" DependsOnTargets="BuildOnlySettings;PrepareForBuild;AssignTargetPaths;ResolveReferences" Returns="@(PriFilesOutputGroupOutput)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This item represents dependent pri file's -->
    <ItemGroup>
      <PriFilesOutputGroupOutput Include="@(_ReferenceRelatedPaths->'%(FullPath)')" Condition="'%(Extension)' == '.pri'" />
    </ItemGroup>
  </Target>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <SDKRedistOutputGroupDependsOn>ResolveSDKReferences;ExpandSDKReferences</SDKRedistOutputGroupDependsOn>
  </PropertyGroup>
  <!--
    ============================================================
                                        SDKRedistOutputGroup

    This target gathers the Redist folders from the SDKs which have been resolved.
    ============================================================
  -->
  <Target Name="SDKRedistOutputGroup" Returns="@(SDKRedistOutputGroupOutput)" DependsOnTargets="$(SDKRedistOutputGroupDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This list starts with the least specific files to the most specific so that later files can overwrite earlier files-->
    <ItemGroup>
      <SDKRedistOutputGroupOutput Include="@(ResolvedRedistFiles)" />
    </ItemGroup>
  </Target>
  <!--
    ***********************************************************************************************
    ***********************************************************************************************
                                                                AllProjectOutputGroupsDependencies Section
    ***********************************************************************************************
    ***********************************************************************************************
    -->
  <!--
    ============================================================
                                        AllProjectOutputGroupsDependencies
    ============================================================
    -->
  <Target Name="AllProjectOutputGroupsDependencies" DependsOnTargets="             BuiltProjectOutputGroupDependencies;             DebugSymbolsProjectOutputGroupDependencies;             SatelliteDllsProjectOutputGroupDependencies;             DocumentationProjectOutputGroupDependencies;             SGenFilesOutputGroupDependencies" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        BuiltProjectOutputGroupDependencies

    This target performs population of the Built project output group dependencies.
    ============================================================
    -->
  <Target Name="BuiltProjectOutputGroupDependencies" DependsOnTargets="BuildOnlySettings;PrepareForBuild;AssignTargetPaths;ResolveReferences" Returns="@(BuiltProjectOutputGroupDependency)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <BuiltProjectOutputGroupDependency Include="@(ReferencePath->'%(FullPath)');                                                          @(ReferenceDependencyPaths->'%(FullPath)');                                                          @(NativeReferenceFile->'%(FullPath)');                                                          @(_DeploymentLooseManifestFile->'%(FullPath)');                                                          @(ResolvedIsolatedComModules->'%(FullPath)')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        DebugSymbolsProjectOutputGroupDependencies

    This target performs population of the dependencies for the debug symbols project output group.
    ============================================================
    -->
  <Target Name="DebugSymbolsProjectOutputGroupDependencies" Condition="'$(DebugSymbols)'!='false'" DependsOnTargets="BuildOnlySettings;PrepareForBuild;AssignTargetPaths;ResolveReferences" Returns="@(DebugSymbolsProjectOutputGroupDependency)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This item represents dependent PDB's -->
    <ItemGroup>
      <DebugSymbolsProjectOutputGroupDependency Include="@(_ReferenceRelatedPaths->'%(FullPath)')" Condition="'%(Extension)' == '.pdb'" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        SatelliteDllsProjectOutputGroupDependencies

    This target performs population of the dependencies for the satellite files project output group.
    ============================================================
    -->
  <Target Name="SatelliteDllsProjectOutputGroupDependencies" DependsOnTargets="BuildOnlySettings;PrepareForBuild;AssignTargetPaths;ResolveReferences" Returns="@(SatelliteDllsProjectOutputGroupDependency)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This item represents dependent satellites -->
    <ItemGroup>
      <SatelliteDllsProjectOutputGroupDependency Include="@(ReferenceSatellitePaths->'%(FullPath)')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        DocumentationProjectOutputGroupDependencies

    This target performs population of the dependencies for the documentation project output group.
    ============================================================
    -->
  <Target Name="DocumentationProjectOutputGroupDependencies" Condition="'$(DocumentationFile)'!=''" DependsOnTargets="BuildOnlySettings;PrepareForBuild;AssignTargetPaths;ResolveReferences" Returns="@(DocumentationProjectOutputGroupDependency)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This item represents dependent XMLs -->
    <ItemGroup>
      <DocumentationProjectOutputGroupDependency Include="@(_ReferenceRelatedPaths->'%(FullPath)')" Condition="'%(Extension)' == '.xml'" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        SGenFilesOutputGroupDependencies

    This target performs population of the dependencies for the GenerateSerializationAssemblies project output group.
    ============================================================
    -->
  <Target Name="SGenFilesOutputGroupDependencies" DependsOnTargets="BuildOnlySettings;PrepareForBuild;AssignTargetPaths;ResolveReferences" Returns="@(SGenFilesOutputGroupDependency)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This item represents sgen xml serializer dll's -->
    <ItemGroup>
      <SGenFilesOutputGroupDependency Include="@(_ReferenceSerializationAssemblyPaths->'%(FullPath)')" Condition="'%(Extension)' == '.dll'" />
    </ItemGroup>
  </Target>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CodeAnalysisTargets Condition="'$(CodeAnalysisTargets)'==''">$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v$(VisualStudioVersion)\CodeAnalysis\Microsoft.CodeAnalysis.targets</CodeAnalysisTargets>
  </PropertyGroup>
  <!--<Import Project="$(CodeAnalysisTargets)" Condition="Exists('$(CodeAnalysisTargets)')" />-->
  <!--<Import Project="$(ReportingServicesTargets)" Condition="Exists('$(ReportingServicesTargets)')" />-->
  <!--<Import Project="$(MSBuildToolsPath)\Microsoft.NETFramework.targets" Condition="('$(TargetFrameworkIdentifier)' == ''  or '$(TargetFrameworkIdentifier)' == '.NETFramework') and ('$(TargetRuntime)' == 'Managed')" />-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ImportXamlTargets Condition="'$(ImportXamlTargets)'=='' and ('$(TargetFrameworkVersion)' != 'v2.0' and '$(TargetFrameworkVersion)' != 'v3.5') and Exists('$(MSBuildToolsPath)\Microsoft.Xaml.targets')">true</ImportXamlTargets>
  </PropertyGroup>
  <!--<Import Project="$(MSBuildToolsPath)\Microsoft.Xaml.targets" Condition="('$(ImportXamlTargets)' == 'true')" />-->
  <!-- imports Microsoft.WorkflowBuildExtensions.targets only if TargetFrameworkVersion is v4.5 or above or TargetFrameworkfVersion specified does not conform to the format of vX.X[.X.X] -->
  <!-- Underlying assumption is that there shouldn't be any other versions between v4.0.* and v4.5 -->
  <!--<Import Project="$(MSBuildToolsPath)\Microsoft.WorkflowBuildExtensions.targets" Condition="('$(TargetFrameworkVersion)' != 'v2.0' and '$(TargetFrameworkVersion)' != 'v3.5' and (!$([System.String]::IsNullOrEmpty('$(TargetFrameworkVersion)')) and !$(TargetFrameworkVersion.StartsWith('v4.0')))) and Exists('$(MSBuildToolsPath)\Microsoft.WorkflowBuildExtensions.targets')" />-->
  <!-- This import is temporary and will be removed once it is moved into the silverlight targets -->
  <!--<Import Project="$(MSBuildToolsPath)\Microsoft.WinFX.targets" Condition="'$(TargetFrameworkIdentifier)' == 'Silverlight' and Exists('$(MSBuildToolsPath)\Microsoft.WinFX.targets')" />-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MsTestToolsTargets Condition="'$(MsTestToolsTargets)'==''">$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v$(VisualStudioVersion)\TeamTest\Microsoft.TeamTest.targets</MsTestToolsTargets>
  </PropertyGroup>
  <!--<Import Project="$(MsTestToolsTargets)" Condition="Exists('$(MsTestToolsTargets)')" />-->
  <!-- App packaging support -->
  <!--
    Following two targets are needed to be present in every project being built
    because the app packaging targets recursively scan all projects referenced
    from projects that generate app packages for them.
  -->
  <Target Name="CleanAppxPackage" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="GetPackagingOutputs" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MsAppxPackageTargets Condition="'$(MsAppxPackageTargets)'==''">$(MSBuildExtensionsPath32)\Microsoft\VisualStudio\v$(VisualStudioVersion)\AppxPackage\Microsoft.AppXPackage.Targets</MsAppxPackageTargets>
  </PropertyGroup>
  <!--<Import Project="$(MsAppxPackageTargets)" Condition="'$(WindowsAppContainer)' == 'true' and Exists('$(MsAppxPackageTargets)')" />-->
  <!-- This import is temporary and will be removed once it is moved into the silverlight targets -->
  <!--<Import Project="$(MSBuildToolsPath)\Microsoft.Data.Entity.targets" Condition="'$(TargetFrameworkIdentifier)' == 'Silverlight' and Exists('$(MSBuildToolsPath)\Microsoft.Data.Entity.targets')" />-->
  <!-- Import NuGet.targets (required for GetReferenceNearestTargetFrameworkTask and used for Restore functionality) -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NuGetRestoreTargets Condition="'$(NuGetRestoreTargets)'=='' and '$([MSBuild]::IsRunningFromVisualStudio())'=='true'">$(MSBuildToolsPath32)\..\..\..\Common7\IDE\CommonExtensions\Microsoft\NuGet\NuGet.targets</NuGetRestoreTargets>
    <NuGetRestoreTargets Condition="'$(NuGetRestoreTargets)'==''">$(MSBuildToolsPath)\NuGet.targets</NuGetRestoreTargets>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(NuGetRestoreTargets)" Condition="Exists('$(NuGetRestoreTargets)')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\NuGet.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
NuGet.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************

  This target file contains the NuGet Restore target for walking the project and reference graph
  and restoring dependencies from the graph.

  Ways to use this targets file:
  1. Invoke it directly and provide project file paths using $(RestoreGraphProjectInput).
  2. With a solution this may be used as a target in the metaproj.
  3. Import the targets file from a project.

  Restore flow summary:
  1. Top level projects (entry points) are determined.
  2. Each project and all of its project references are walked recursively.
  3. The project is evaluated for each $(TargetFramework). Items are created
     for project properties and dependencies. Each item is marked
     with the project it came from so that it can be matched up later.
  4. All restore items generated by the walk are grouped together by
     project and convert into a project spec.

  The result file contains:
  1. A list of projects to restore.
  2. The complete closure of all projects referenced (Includes project references that are not being restored directly).
  3. Package and project dependencies for each project.
  4. DotnetCliTool references
  -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Mark that this target file has been loaded.  -->
    <IsRestoreTargetsFileLoaded>true</IsRestoreTargetsFileLoaded>
    <!-- Load NuGet.Build.Tasks.dll, this can be overridden to use a different version with $(RestoreTaskAssemblyFile) -->
    <RestoreTaskAssemblyFile Condition=" '$(RestoreTaskAssemblyFile)' == '' ">NuGet.Build.Tasks.dll</RestoreTaskAssemblyFile>
    <!-- Do not hide errors and warnings by default -->
    <HideWarningsAndErrors Condition=" '$(HideWarningsAndErrors)' == '' ">false</HideWarningsAndErrors>
    <!-- Recurse by default -->
    <RestoreRecursive Condition=" '$(RestoreRecursive)' == '' ">true</RestoreRecursive>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <RestoreUseSkipNonexistentTargets Condition=" '$(RestoreUseSkipNonexistentTargets)' == '' ">true</RestoreUseSkipNonexistentTargets>
    <!-- RuntimeIdentifier compatibility check -->
    <ValidateRuntimeIdentifierCompatibility Condition=" '$(ValidateRuntimeIdentifierCompatibility)' == '' ">false</ValidateRuntimeIdentifierCompatibility>
    <!-- Error handling while walking projects -->
    <RestoreContinueOnError Condition=" '$(RestoreContinueOnError)' == '' ">WarnAndContinue</RestoreContinueOnError>
    <!-- Build in parallel -->
    <RestoreBuildInParallel Condition=" '$(BuildInParallel)' != '' ">$(BuildInParallel)</RestoreBuildInParallel>
    <RestoreBuildInParallel Condition=" '$(RestoreBuildInParallel)' == '' ">true</RestoreBuildInParallel>
    <!-- Check if the restore target was executed on a sln file -->
    <_RestoreSolutionFileUsed Condition=" '$(_RestoreSolutionFileUsed)' == '' AND '$(SolutionDir)' != '' AND $(MSBuildProjectFullPath.EndsWith('.metaproj')) == 'true' ">true</_RestoreSolutionFileUsed>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Exclude packages from changing restore inputs.  -->
    <_GenerateRestoreGraphProjectEntryInputProperties>ExcludeRestorePackageImports=true</_GenerateRestoreGraphProjectEntryInputProperties>
    <!-- Standalone mode
         This is used by NuGet.exe to inject targets into the project that will be
         walked next. In normal /t:Restore mode this causes a duplicate import
         since NuGet.targets it loaded as part of MSBuild, there is should be
         skipped. -->
    <_GenerateRestoreGraphProjectEntryInputProperties Condition=" '$(RestoreUseCustomAfterTargets)' == 'true' ">
      $(_GenerateRestoreGraphProjectEntryInputProperties);
      NuGetRestoreTargets=$(MSBuildThisFileFullPath);
      RestoreUseCustomAfterTargets=$(RestoreUseCustomAfterTargets);
      CustomAfterMicrosoftCommonCrossTargetingTargets=$(MSBuildThisFileFullPath);
      CustomAfterMicrosoftCommonTargets=$(MSBuildThisFileFullPath);
    </_GenerateRestoreGraphProjectEntryInputProperties>
    <!-- Include SolutionDir and SolutionName for solution restores and persist these properties during the walk. -->
    <_GenerateRestoreGraphProjectEntryInputProperties Condition=" '$(_RestoreSolutionFileUsed)' == 'true' ">
      $(_GenerateRestoreGraphProjectEntryInputProperties);
      _RestoreSolutionFileUsed=true;
      SolutionDir=$(SolutionDir);
      SolutionName=$(SolutionName);
    </_GenerateRestoreGraphProjectEntryInputProperties>
  </PropertyGroup>
  <!-- Tasks -->
  <UsingTask TaskName="NuGet.Build.Tasks.RestoreTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.WriteRestoreGraphTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetRestoreProjectJsonPathTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetRestoreProjectReferencesTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetRestorePackageReferencesTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetRestoreDotnetCliToolsTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetProjectTargetFrameworksTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetRestoreSolutionProjectsTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetRestoreSettingsTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.WarnForInvalidProjectsTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetReferenceNearestTargetFrameworkTask" AssemblyFile="$(RestoreTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    Restore
    Main entry point for restoring packages
    ============================================================
  -->
  <Target Name="Restore" DependsOnTargets="_GenerateRestoreGraph" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Drop any duplicate items -->
    <RemoveDuplicates Inputs="@(_RestoreGraphEntry)">
      <Output TaskParameter="Filtered" ItemName="_RestoreGraphEntryFiltered" />
    </RemoveDuplicates>
    <!-- Call restore -->
    <RestoreTask RestoreGraphItems="@(_RestoreGraphEntryFiltered)" RestoreDisableParallel="$(RestoreDisableParallel)" RestoreNoCache="$(RestoreNoCache)" RestoreIgnoreFailedSources="$(RestoreIgnoreFailedSources)" RestoreRecursive="$(RestoreRecursive)" RestoreForce="$(RestoreForce)" HideWarningsAndErrors="$(HideWarningsAndErrors)" />
  </Target>
  <!--
    ============================================================
    GenerateRestoreGraphFile
    Writes the output of _GenerateRestoreGraph to disk
    ============================================================
  -->
  <Target Name="GenerateRestoreGraphFile" DependsOnTargets="_GenerateRestoreGraph" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Validate  -->
    <Error Condition="$(RestoreGraphOutputPath) == ''" Text="Missing RestoreGraphOutputPath property!" />
    <!-- Drop any duplicate items -->
    <RemoveDuplicates Inputs="@(_RestoreGraphEntry)">
      <Output TaskParameter="Filtered" ItemName="_RestoreGraphEntryFiltered" />
    </RemoveDuplicates>
    <!-- Write file -->
    <WriteRestoreGraphTask RestoreGraphItems="@(_RestoreGraphEntryFiltered)" RestoreGraphOutputPath="$(RestoreGraphOutputPath)" RestoreRecursive="$(RestoreRecursive)" />
  </Target>
  <!--
    ============================================================
    CollectPackageReferences
    Gathers all PackageReference items from the project.
    This target may be used as an extension point to modify
    package references before NuGet reads them.
    ============================================================
  -->
  <Target Name="CollectPackageReferences" Returns="@(PackageReference)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    _LoadRestoreGraphEntryPoints
    Find project entry points and load them into items.
    ============================================================
  -->
  <Target Name="_LoadRestoreGraphEntryPoints" Returns="@(RestoreGraphProjectInputItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Allow overriding items with RestoreGraphProjectInput -->
    <ItemGroup Condition=" @(RestoreGraphProjectInputItems) == '' ">
      <RestoreGraphProjectInputItems Include="$(RestoreGraphProjectInput)" />
    </ItemGroup>
    <!-- Project case -->
    <ItemGroup Condition=" $(MSBuildProjectFullPath.EndsWith('.metaproj')) != 'true' AND @(RestoreGraphProjectInputItems) == '' ">
      <RestoreGraphProjectInputItems Include="$(MSBuildProjectFullPath)" />
    </ItemGroup>
    <!-- Solution case -->
    <GetRestoreSolutionProjectsTask Condition=" $(MSBuildProjectFullPath.EndsWith('.metaproj')) == 'true' AND @(RestoreGraphProjectInputItems) == '' " ProjectReferences="@(ProjectReference)" SolutionFilePath="$(MSBuildProjectFullPath)">
      <Output TaskParameter="OutputProjectReferences" ItemName="RestoreGraphProjectInputItems" />
    </GetRestoreSolutionProjectsTask>
  </Target>
  <!--
    ============================================================
    _FilterRestoreGraphProjectInputItems
    Filter out unsupported project entry points.
    ============================================================
  -->
  <Target Name="_FilterRestoreGraphProjectInputItems" DependsOnTargets="_LoadRestoreGraphEntryPoints" Returns="@(FilteredRestoreGraphProjectInputItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <RestoreProjectFilterMode Condition=" '$(RestoreProjectFilterMode)' == '' ">exclusionlist</RestoreProjectFilterMode>
    </PropertyGroup>
    <!-- Filter to a list of known supported types -->
    <ItemGroup Condition=" '$(RestoreProjectFilterMode)' == 'inclusionlist' ">
      <_FilteredRestoreGraphProjectInputItemsTmp Include="@(RestoreGraphProjectInputItems)" Condition=" '%(RestoreGraphProjectInputItems.Extension)' == '.csproj' Or                    '%(RestoreGraphProjectInputItems.Extension)' == '.vbproj' Or                    '%(RestoreGraphProjectInputItems.Extension)' == '.fsproj' Or                    '%(RestoreGraphProjectInputItems.Extension)' == '.nuproj' Or                    '%(RestoreGraphProjectInputItems.Extension)' == '.msbuildproj' Or                    '%(RestoreGraphProjectInputItems.Extension)' == '.vcxproj' " />
    </ItemGroup>
    <!-- Filter out disallowed types -->
    <ItemGroup Condition=" '$(RestoreProjectFilterMode)' == 'exclusionlist' ">
      <_FilteredRestoreGraphProjectInputItemsTmp Include="@(RestoreGraphProjectInputItems)" Condition=" '%(RestoreGraphProjectInputItems.Extension)' != '.metaproj'                    AND '%(RestoreGraphProjectInputItems.Extension)' != '.shproj'                    AND '%(RestoreGraphProjectInputItems.Extension)' != '.vcxitems'                    AND '%(RestoreGraphProjectInputItems.Extension)' != '' " />
    </ItemGroup>
    <!-- No filtering -->
    <ItemGroup Condition=" '$(RestoreProjectFilterMode)' != 'exclusionlist' AND '$(RestoreProjectFilterMode)' != 'inclusionlist' ">
      <_FilteredRestoreGraphProjectInputItemsTmp Include="@(RestoreGraphProjectInputItems)" />
    </ItemGroup>
    <!-- Remove duplicates -->
    <RemoveDuplicates Inputs="@(_FilteredRestoreGraphProjectInputItemsTmp)">
      <Output TaskParameter="Filtered" ItemName="FilteredRestoreGraphProjectInputItemsWithoutDuplicates" />
    </RemoveDuplicates>
    <!-- Remove projects that do not support restore. -->
    <!-- With SkipNonexistentTargets support -->
    <MsBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' == 'true' " BuildInParallel="$(RestoreBuildInParallel)" Projects="@(FilteredRestoreGraphProjectInputItemsWithoutDuplicates)" Targets="_IsProjectRestoreSupported" SkipNonexistentTargets="true" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="FilteredRestoreGraphProjectInputItems" />
    </MsBuild>
    <!-- Without SkipNonexistentTargets support -->
    <MsBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' != 'true' " Projects="@(FilteredRestoreGraphProjectInputItemsWithoutDuplicates)" Targets="_IsProjectRestoreSupported" ContinueOnError="$(RestoreContinueOnError)" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="FilteredRestoreGraphProjectInputItems" />
    </MsBuild>
    <!-- Warn for projects that do not support restore. -->
    <WarnForInvalidProjectsTask Condition=" '$(DisableWarnForInvalidRestoreProjects)' != 'true' " AllProjects="@(FilteredRestoreGraphProjectInputItemsWithoutDuplicates)" ValidProjects="@(FilteredRestoreGraphProjectInputItems)" />
  </Target>
  <!--
    ============================================================
    _GenerateRestoreGraph
    Entry point for creating the project to project restore graph.
    ============================================================
  -->
  <Target Name="_GenerateRestoreGraph" DependsOnTargets="_FilterRestoreGraphProjectInputItems;_GetAllRestoreProjectPathItems" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Message Text="Generating dg file" Importance="low" />
    <Message Text="%(_RestoreProjectPathItems.Identity)" Importance="low" />
    <!-- Use all projects if RestoreRecursive is true. Otherwise use only the top level projects. -->
    <ItemGroup>
      <_GenerateRestoreGraphProjectEntryInput Include="@(FilteredRestoreGraphProjectInputItems)" Condition=" '$(RestoreRecursive)' != 'true' " />
      <_GenerateRestoreGraphProjectEntryInput Include="@(_RestoreProjectPathItems)" Condition=" '$(RestoreRecursive)' == 'true' " />
    </ItemGroup>
    <!-- Add top level entries to the direct restore list. These projects will also restore tools. -->
    <MsBuild BuildInParallel="$(RestoreBuildInParallel)" Projects="@(_GenerateRestoreGraphProjectEntryInput)" Targets="_GenerateRestoreGraphProjectEntry" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreGraphEntry" />
    </MsBuild>
    <!-- Generate a spec for every project including dependencies. -->
    <MsBuild BuildInParallel="$(RestoreBuildInParallel)" Projects="@(_RestoreProjectPathItems)" Targets="_GenerateProjectRestoreGraph" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreGraphEntry" />
    </MsBuild>
  </Target>
  <!--
    ============================================================
    _GenerateRestoreGraphProjectEntry
    Top level entry point within a project.
    ============================================================
  -->
  <Target Name="_GenerateRestoreGraphProjectEntry" DependsOnTargets="_GenerateRestoreSpecs;_GenerateDotnetCliToolReferenceSpecs" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Returns restore graph entries for the project and all dependencies -->
  </Target>
  <!--
    ============================================================
    _GenerateRestoreSpecs
    Mark entry points for restore.
    ============================================================
  -->
  <Target Name="_GenerateRestoreSpecs" DependsOnTargets="_GetRestoreProjectStyle" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Message Text="Restore entry point $(MSBuildProjectFullPath)" Importance="low" />
    <!-- Mark entry point -->
    <ItemGroup Condition=" '$(RestoreProjects)' == '' OR '$(RestoreProjects)' == 'true' ">
      <_RestoreGraphEntry Include="$([System.Guid]::NewGuid())" Condition=" '$(RestoreProjectStyle)' != 'Unknown' ">
        <Type>RestoreSpec</Type>
        <ProjectUniqueName>$(MSBuildProjectFullPath)</ProjectUniqueName>
      </_RestoreGraphEntry>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GenerateDotnetCliToolReferenceSpecs
    Collect DotnetCliToolReferences
    ============================================================
  -->
  <Target Name="_GenerateDotnetCliToolReferenceSpecs" DependsOnTargets="_GetRestoreSettings" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <DotnetCliToolTargetFramework Condition=" '$(DotnetCliToolTargetFramework)' == '' ">netcoreapp1.0</DotnetCliToolTargetFramework>
    </PropertyGroup>
    <!-- Write out tool references -->
    <GetRestoreDotnetCliToolsTask Condition=" '$(RestoreDotnetCliToolReferences)' == '' OR '$(RestoreDotnetCliToolReferences)' == 'true' " ProjectPath="$(MSBuildProjectFullPath)" ToolFramework="$(DotnetCliToolTargetFramework)" RestorePackagesPath="$(_OutputPackagesPath)" RestoreFallbackFolders="$(_OutputFallbackFolders)" RestoreSources="$(_OutputSources)" RestoreConfigFilePaths="$(_OutputConfigFilePaths)" DotnetCliToolReferences="@(DotnetCliToolReference)">
      <Output TaskParameter="RestoreGraphItems" ItemName="_RestoreGraphEntry" />
    </GetRestoreDotnetCliToolsTask>
  </Target>
  <!--
    ============================================================
    _GetProjectJsonPath
    Discover the project.json path if one exists for the project.
    ============================================================
  -->
  <Target Name="_GetProjectJsonPath" Returns="$(_CurrentProjectJsonPath)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Get project.json path -->
    <!-- Skip this if the project style is already set. -->
    <GetRestoreProjectJsonPathTask ProjectPath="$(MSBuildProjectFullPath)" Condition=" '$(RestoreProjectStyle)' == 'ProjectJson' OR '$(RestoreProjectStyle)' == '' ">
      <Output TaskParameter="ProjectJsonPath" PropertyName="_CurrentProjectJsonPath" />
    </GetRestoreProjectJsonPathTask>
  </Target>
  <!--
    ============================================================
    _GetRestoreProjectStyle
    Determine the project restore type.
    ============================================================
  -->
  <Target Name="_GetRestoreProjectStyle" DependsOnTargets="_GetProjectJsonPath;CollectPackageReferences" Returns="$(RestoreProjectStyle);$(PackageReferenceCompatibleProjectStyle)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This may be overridden by setting RestoreProjectStyle in the project. -->
    <PropertyGroup>
      <!-- If any PackageReferences exist treat it as PackageReference. This has priority over project.json. -->
      <RestoreProjectStyle Condition=" '$(RestoreProjectStyle)' == '' AND @(PackageReference) != '' ">PackageReference</RestoreProjectStyle>
      <!-- If this is not a PackageReference project check if project.json or projectName.project.json exists. -->
      <RestoreProjectStyle Condition=" '$(RestoreProjectStyle)' == '' AND '$(_CurrentProjectJsonPath)' != '' ">ProjectJson</RestoreProjectStyle>
      <!-- This project is either a packages.config project or one that does not use NuGet at all. -->
      <RestoreProjectStyle Condition=" '$(RestoreProjectStyle)' == '' ">Unknown</RestoreProjectStyle>
    </PropertyGroup>
    <PropertyGroup>
      <PackageReferenceCompatibleProjectStyle Condition="  '$(RestoreProjectStyle)' == 'PackageReference' OR '$(RestoreProjectStyle)' == 'DotnetToolReference' ">true</PackageReferenceCompatibleProjectStyle>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
    EnableIntermediateOutputPathMismatchWarning
    If using PackageReference, enable an MSBuild warning if BaseIntermediateOutputPath is set to something different
    than MSBuildProjectExtensionsPath, because it may be unexpected that the assets and related files wouldn't be written
    to the BaseIntermediateOutputPath.
    ============================================================
  -->
  <Target Name="EnableIntermediateOutputPathMismatchWarning" DependsOnTargets="_GetRestoreProjectStyle" BeforeTargets="_CheckForInvalidConfigurationAndPlatform" Condition="'$(RestoreProjectStyle)' == 'PackageReference'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition="'$(EnableBaseIntermediateOutputPathMismatchWarning)' == ''">
      <EnableBaseIntermediateOutputPathMismatchWarning>true</EnableBaseIntermediateOutputPathMismatchWarning>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
    _GetRestoreTargetFrameworksOutput
    Read target frameworks from the project.
    Non-NETCore project frameworks will be returned.
    ============================================================
  -->
  <Target Name="_GetRestoreTargetFrameworksOutput" DependsOnTargets="_GetRestoreProjectStyle" Returns="@(_RestoreTargetFrameworksOutputFiltered)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_RestoreProjectFramework />
    </PropertyGroup>
    <!-- For project.json projects target frameworks will be read from project.json. -->
    <GetProjectTargetFrameworksTask Condition=" '$(RestoreProjectStyle)' != 'ProjectJson' " ProjectPath="$(MSBuildProjectFullPath)" TargetFrameworks="$(TargetFrameworks)" TargetFramework="$(TargetFramework)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetPlatformIdentifier="$(TargetPlatformIdentifier)" TargetPlatformVersion="$(TargetPlatformVersion)" TargetPlatformMinVersion="$(TargetPlatformMinVersion)">
      <Output TaskParameter="ProjectTargetFrameworks" PropertyName="_RestoreProjectFramework" />
    </GetProjectTargetFrameworksTask>
    <ItemGroup Condition=" '$(_RestoreProjectFramework)' != '' ">
      <_RestoreTargetFrameworksOutputFiltered Include="$(_RestoreProjectFramework.Split(';'))" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GetRestoreTargetFrameworksAsItems
    Read $(TargetFrameworks) from the project as items.
    Projects that do not have $(TargetFrameworks) will noop.
    ============================================================
  -->
  <Target Name="_GetRestoreTargetFrameworksAsItems" DependsOnTargets="_GetRestoreProjectStyle" Returns="@(_RestoreTargetFrameworkItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup Condition=" '$(TargetFrameworks)' != '' ">
      <_RestoreTargetFrameworkItems Include="$(TargetFrameworks.Split(';'))" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GetRestoreSettings
    ============================================================
  -->
  <Target Name="_GetRestoreSettings" Condition=" '$(RestoreProjectStyle)' == 'PackageReference' OR '$(RestoreProjectStyle)' == 'ProjectJson' OR '$(RestoreProjectStyle)' == 'DotnetToolReference' " DependsOnTargets="_GetRestoreSettingsOverrides;_GetRestoreSettingsCurrentProject;_GetRestoreSettingsAllFrameworks" Returns="$(_OutputSources);$(_OutputPackagesPath);$(_OutputFallbackFolders);$(_OutputConfigFilePaths)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- For transitive project styles, we rely on evaluating all the settings and including them in the dg spec to faciliate no-op restore-->
    <GetRestoreSettingsTask ProjectUniqueName="$(MSBuildProjectFullPath)" RestoreSources="$(RestoreSources)" RestorePackagesPath="$(RestorePackagesPath)" RestoreFallbackFolders="$(RestoreFallbackFolders)" RestoreConfigFile="$(RestoreConfigFile)" RestoreRootConfigDirectory="$(RestoreRootConfigDirectory)" RestoreSolutionDirectory="$(RestoreSolutionDirectory)" RestoreSettingsPerFramework="@(_RestoreSettingsPerFramework)" RestorePackagesPathOverride="$(_RestorePackagesPathOverride)" RestoreSourcesOverride="$(_RestoreSourcesOverride)" RestoreFallbackFoldersOverride="$(_RestoreFallbackFoldersOverride)" MSBuildStartupDirectory="$(MSBuildStartupDirectory)">
      <Output TaskParameter="OutputSources" PropertyName="_OutputSources" />
      <Output TaskParameter="OutputPackagesPath" PropertyName="_OutputPackagesPath" />
      <Output TaskParameter="OutputFallbackFolders" PropertyName="_OutputFallbackFolders" />
      <Output TaskParameter="OutputConfigFilePaths" PropertyName="_OutputConfigFilePaths" />
    </GetRestoreSettingsTask>
  </Target>
  <!--
    ============================================================
    _GetRestoreSettingsCurrentProject
    Generate items for a single framework.
    ============================================================
  -->
  <Target Name="_GetRestoreSettingsCurrentProject" Condition=" '$(TargetFrameworks)' == '' AND '$(PackageReferenceCompatibleProjectStyle)' == 'true' " DependsOnTargets="_GetRestoreSettingsPerFramework" Returns="@(_RestoreSettingsPerFramework)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    _GetRestoreSettingsCurrentProject
    Generate items for a single framework.
    ============================================================
  -->
  <Target Name="_GetRestoreSettingsAllFrameworks" Condition=" '$(TargetFrameworks)' != '' AND '$(PackageReferenceCompatibleProjectStyle)' == 'true' " DependsOnTargets="_GetRestoreTargetFrameworksAsItems;_GetRestoreProjectStyle" Returns="@(_RestoreSettingsPerFramework)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Read additional sources and fallback folders for each framework  -->
    <MSBuild BuildInParallel="$(RestoreBuildInParallel)" Projects="$(MSBuildProjectFullPath)" Targets="_GetRestoreSettingsPerFramework" Properties="TargetFramework=%(_RestoreTargetFrameworkItems.Identity);                   $(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreSettingsPerFramework" />
    </MSBuild>
  </Target>
  <!--
    ============================================================
    _GetRestoreSettingsPerFramework
    Generate items with framework specific settings.
    ============================================================
  -->
  <Target Name="_GetRestoreSettingsPerFramework" Returns="@(_RestoreSettingsPerFramework)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_RestoreSettingsPerFramework Include="$([System.Guid]::NewGuid())">
        <RestoreAdditionalProjectSources>$(RestoreAdditionalProjectSources)</RestoreAdditionalProjectSources>
        <RestoreAdditionalProjectFallbackFolders>$(RestoreAdditionalProjectFallbackFolders)</RestoreAdditionalProjectFallbackFolders>
        <RestoreAdditionalProjectFallbackFoldersExcludes>$(RestoreAdditionalProjectFallbackFoldersExcludes)</RestoreAdditionalProjectFallbackFoldersExcludes>
      </_RestoreSettingsPerFramework>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GenerateRestoreProjectSpec
    Generate a restore project spec for the current project.
    ============================================================
  -->
  <Target Name="_GenerateRestoreProjectSpec" DependsOnTargets="_GetRestoreProjectStyle;_GetRestoreTargetFrameworksOutput;_GetRestoreSettings" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Determine the restore output path -->
    <PropertyGroup Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' OR '$(RestoreProjectStyle)' == 'ProjectJson' ">
      <RestoreOutputPath Condition=" '$(RestoreOutputPath)' == '' ">$(MSBuildProjectExtensionsPath)</RestoreOutputPath>
    </PropertyGroup>
    <ConvertToAbsolutePath Paths="$(RestoreOutputPath)" Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' OR '$(RestoreProjectStyle)' == 'ProjectJson'">
      <Output TaskParameter="AbsolutePaths" PropertyName="RestoreOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <!--
      Determine project name for the assets file.
      Highest priority: PackageId
      If PackageId does not exist use: AssemblyName
      If AssemblyName does not exist fallback to the project file name without the extension: $(MSBuildProjectName)

      For non-NETCore projects use only: $(MSBuildProjectName)
    -->
    <PropertyGroup>
      <_RestoreProjectName>$(MSBuildProjectName)</_RestoreProjectName>
      <_RestoreProjectName Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' AND '$(AssemblyName)' != '' ">$(AssemblyName)</_RestoreProjectName>
      <_RestoreProjectName Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' AND '$(PackageId)' != '' ">$(PackageId)</_RestoreProjectName>
    </PropertyGroup>
    <!--
      Determine project version for .NETCore projects
      Default to 1.0.0
      Use Version if it exists
      Override with PackageVersion if it exists (same as pack)
    -->
    <PropertyGroup Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' ">
      <_RestoreProjectVersion>1.0.0</_RestoreProjectVersion>
      <_RestoreProjectVersion Condition=" '$(Version)' != '' ">$(Version)</_RestoreProjectVersion>
      <_RestoreProjectVersion Condition=" '$(PackageVersion)' != '' ">$(PackageVersion)</_RestoreProjectVersion>
    </PropertyGroup>
    <!-- Determine if this will use cross targeting -->
    <PropertyGroup Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' AND '$(TargetFrameworks)' != '' ">
      <_RestoreCrossTargeting>true</_RestoreCrossTargeting>
    </PropertyGroup>
    <!-- Determine if ContentFiles should be written by NuGet -->
    <PropertyGroup Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' AND '$(_RestoreSkipContentFileWrite)' == '' ">
      <_RestoreSkipContentFileWrite Condition=" '$(TargetFrameworks)' == '' AND '$(TargetFramework)' == '' ">true</_RestoreSkipContentFileWrite>
    </PropertyGroup>
    <!-- Write properties for the top level entry point -->
    <ItemGroup Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' ">
      <_RestoreGraphEntry Include="$([System.Guid]::NewGuid())">
        <Type>ProjectSpec</Type>
        <Version>$(_RestoreProjectVersion)</Version>
        <ProjectUniqueName>$(MSBuildProjectFullPath)</ProjectUniqueName>
        <ProjectPath>$(MSBuildProjectFullPath)</ProjectPath>
        <ProjectName>$(_RestoreProjectName)</ProjectName>
        <Sources>$(_OutputSources)</Sources>
        <FallbackFolders>$(_OutputFallbackFolders)</FallbackFolders>
        <PackagesPath>$(_OutputPackagesPath)</PackagesPath>
        <ProjectStyle>$(RestoreProjectStyle)</ProjectStyle>
        <OutputPath>$(RestoreOutputAbsolutePath)</OutputPath>
        <TargetFrameworks>@(_RestoreTargetFrameworksOutputFiltered)</TargetFrameworks>
        <RuntimeIdentifiers>$(RuntimeIdentifiers);$(RuntimeIdentifier)</RuntimeIdentifiers>
        <RuntimeSupports>$(RuntimeSupports)</RuntimeSupports>
        <CrossTargeting>$(_RestoreCrossTargeting)</CrossTargeting>
        <RestoreLegacyPackagesDirectory>$(RestoreLegacyPackagesDirectory)</RestoreLegacyPackagesDirectory>
        <ValidateRuntimeAssets>$(ValidateRuntimeIdentifierCompatibility)</ValidateRuntimeAssets>
        <SkipContentFileWrite>$(_RestoreSkipContentFileWrite)</SkipContentFileWrite>
        <ConfigFilePaths>$(_OutputConfigFilePaths)</ConfigFilePaths>
        <TreatWarningsAsErrors>$(TreatWarningsAsErrors)</TreatWarningsAsErrors>
        <WarningsAsErrors>$(WarningsAsErrors)</WarningsAsErrors>
        <NoWarn>$(NoWarn)</NoWarn>
      </_RestoreGraphEntry>
    </ItemGroup>
    <!-- Use project.json -->
    <ItemGroup Condition=" '$(RestoreProjectStyle)' == 'ProjectJson' ">
      <_RestoreGraphEntry Include="$([System.Guid]::NewGuid())">
        <Type>ProjectSpec</Type>
        <ProjectUniqueName>$(MSBuildProjectFullPath)</ProjectUniqueName>
        <ProjectPath>$(MSBuildProjectFullPath)</ProjectPath>
        <ProjectName>$(_RestoreProjectName)</ProjectName>
        <Sources>$(_OutputSources)</Sources>
        <OutputPath>$(RestoreOutputAbsolutePath)</OutputPath>
        <FallbackFolders>$(_OutputFallbackFolders)</FallbackFolders>
        <PackagesPath>$(_OutputPackagesPath)</PackagesPath>
        <ProjectJsonPath>$(_CurrentProjectJsonPath)</ProjectJsonPath>
        <ProjectStyle>$(RestoreProjectStyle)</ProjectStyle>
        <ConfigFilePaths>$(_OutputConfigFilePaths)</ConfigFilePaths>
      </_RestoreGraphEntry>
    </ItemGroup>
    <!-- Non-NuGet type -->
    <ItemGroup Condition=" '$(RestoreProjectStyle)' == 'Unknown' ">
      <_RestoreGraphEntry Include="$([System.Guid]::NewGuid())">
        <Type>ProjectSpec</Type>
        <ProjectUniqueName>$(MSBuildProjectFullPath)</ProjectUniqueName>
        <ProjectPath>$(MSBuildProjectFullPath)</ProjectPath>
        <ProjectName>$(_RestoreProjectName)</ProjectName>
        <ProjectStyle>$(RestoreProjectStyle)</ProjectStyle>
        <TargetFrameworks>@(_RestoreTargetFrameworksOutputFiltered)</TargetFrameworks>
      </_RestoreGraphEntry>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GenerateProjectRestoreGraph
    Recursively walk project to project references.
    ============================================================
  -->
  <Target Name="_GenerateProjectRestoreGraph" DependsOnTargets="       _GetRestoreProjectStyle;       _GetRestoreTargetFrameworksOutput;       _GenerateRestoreProjectSpec;       _GenerateRestoreDependencies" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Output from dependency targets -->
  </Target>
  <!--
    ============================================================
    _GenerateRestoreDependencies
    Generate items for package and project references.
    ============================================================
  -->
  <Target Name="_GenerateRestoreDependencies" DependsOnTargets="_GenerateProjectRestoreGraphAllFrameworks;_GenerateProjectRestoreGraphCurrentProject" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    _GenerateProjectRestoreGraphAllFrameworks
    Walk dependencies for all frameworks.
    ============================================================
  -->
  <Target Name="_GenerateProjectRestoreGraphAllFrameworks" Condition=" '$(TargetFrameworks)' != '' " DependsOnTargets="_GetRestoreTargetFrameworksAsItems" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Get project and package references  -->
    <!-- Evaluate for each framework -->
    <MSBuild BuildInParallel="$(RestoreBuildInParallel)" Projects="$(MSBuildProjectFullPath)" Targets="_GenerateProjectRestoreGraphPerFramework" Properties="TargetFramework=%(_RestoreTargetFrameworkItems.Identity);                   $(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreGraphEntry" />
    </MSBuild>
  </Target>
  <!--
    ============================================================
    _GenerateProjectRestoreGraphCurrentProject
    Walk dependencies with the current framework.
    ============================================================
  -->
  <Target Name="_GenerateProjectRestoreGraphCurrentProject" Condition=" '$(TargetFrameworks)' == '' " DependsOnTargets="_GenerateProjectRestoreGraphPerFramework" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    _GenerateProjectRestoreGraphPerFramework
    Walk dependencies using $(TargetFramework)
    ============================================================
  -->
  <Target Name="_GenerateProjectRestoreGraphPerFramework" DependsOnTargets="_GetRestoreProjectStyle;CollectPackageReferences" Returns="@(_RestoreGraphEntry)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Write out project references -->
    <GetRestoreProjectReferencesTask ProjectUniqueName="$(MSBuildProjectFullPath)" ProjectReferences="@(ProjectReference)" TargetFrameworks="$(TargetFramework)" ParentProjectPath="$(MSBuildProjectFullPath)">
      <Output TaskParameter="RestoreGraphItems" ItemName="_RestoreGraphEntry" />
    </GetRestoreProjectReferencesTask>
    <!-- Write out package references for NETCore -->
    <GetRestorePackageReferencesTask Condition=" '$(PackageReferenceCompatibleProjectStyle)' == 'true' " ProjectUniqueName="$(MSBuildProjectFullPath)" PackageReferences="@(PackageReference)" TargetFrameworks="$(TargetFramework)">
      <Output TaskParameter="RestoreGraphItems" ItemName="_RestoreGraphEntry" />
    </GetRestorePackageReferencesTask>
    <PropertyGroup>
      <_CombinedFallbacks>$(PackageTargetFallback);$(AssetTargetFallback)</_CombinedFallbacks>
    </PropertyGroup>
    <!-- Write out target framework information -->
    <ItemGroup Condition="  '$(PackageReferenceCompatibleProjectStyle)' == 'true' AND '$(_CombinedFallbacks)' != '' ">
      <_RestoreGraphEntry Include="$([System.Guid]::NewGuid())">
        <Type>TargetFrameworkInformation</Type>
        <ProjectUniqueName>$(MSBuildProjectFullPath)</ProjectUniqueName>
        <PackageTargetFallback>$(PackageTargetFallback)</PackageTargetFallback>
        <AssetTargetFallback>$(AssetTargetFallback)</AssetTargetFallback>
        <TargetFramework>$(TargetFramework)</TargetFramework>
      </_RestoreGraphEntry>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GenerateRestoreProjectPathItemsCurrentProject
    Get absolute paths for all project references.
    ============================================================
  -->
  <Target Name="_GenerateRestoreProjectPathItemsCurrentProject" Condition=" '$(TargetFrameworks)' == '' " DependsOnTargets="_GenerateRestoreProjectPathItemsPerFramework" Returns="@(_RestoreProjectPathItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    _GenerateRestoreProjectPathItemsPerFramework
    Get absolute paths for all project references.
    ============================================================
  -->
  <Target Name="_GenerateRestoreProjectPathItemsPerFramework" Returns="@(_RestoreProjectPathItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Get the absolute paths to all projects -->
    <ConvertToAbsolutePath Paths="@(ProjectReference)">
      <Output TaskParameter="AbsolutePaths" PropertyName="_RestoreGraphAbsoluteProjectPaths" />
    </ConvertToAbsolutePath>
    <ItemGroup>
      <_RestoreProjectPathItems Include="$(_RestoreGraphAbsoluteProjectPaths)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GenerateRestoreProjectPathItems
    Get all project references regardless of framework
    ============================================================
  -->
  <Target Name="_GenerateRestoreProjectPathItems" DependsOnTargets="_GenerateRestoreProjectPathItemsAllFrameworks;_GenerateRestoreProjectPathItemsCurrentProject" Returns="@(_CurrentRestoreProjectPathItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Drop any duplicate items -->
    <RemoveDuplicates Inputs="@(_RestoreProjectPathItems)">
      <Output TaskParameter="Filtered" ItemName="_CurrentRestoreProjectPathItems" />
    </RemoveDuplicates>
  </Target>
  <!--
    ============================================================
    _GenerateRestoreProjectPathItemsAllFrameworks
    Get all project references regardless of framework
    ============================================================
  -->
  <Target Name="_GenerateRestoreProjectPathItemsAllFrameworks" Condition=" '$(TargetFrameworks)' != '' " DependsOnTargets="_GetRestoreTargetFrameworksAsItems" Returns="@(_RestoreProjectPathItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Get all project references for the current project  -->
    <!-- With SkipNonexistentTargets support -->
    <MSBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' == 'true' " BuildInParallel="$(RestoreBuildInParallel)" Projects="$(MSBuildProjectFullPath)" Targets="_GenerateRestoreProjectPathItemsPerFramework" SkipNonexistentTargets="true" SkipNonexistentProjects="true" Properties="TargetFramework=%(_RestoreTargetFrameworkItems.Identity);                   $(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreProjectPathItems" />
    </MSBuild>
    <!-- Without SkipNonexistentTargets support -->
    <MSBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' != 'true' " Projects="$(MSBuildProjectFullPath)" Targets="_GenerateRestoreProjectPathItemsPerFramework" ContinueOnError="$(RestoreContinueOnError)" Properties="TargetFramework=%(_RestoreTargetFrameworkItems.Identity);                   $(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreProjectPathItems" />
    </MSBuild>
  </Target>
  <!--
    ============================================================
    _GenerateRestoreProjectPathWalk
    Recursively walk projects
    ============================================================
  -->
  <Target Name="_GenerateRestoreProjectPathWalk" DependsOnTargets="_GenerateRestoreProjectPathItems" Returns="@(_RestoreProjectPathItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Walk project references  -->
    <!-- With SkipNonexistentTargets -->
    <MSBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' == 'true' " BuildInParallel="$(RestoreBuildInParallel)" Projects="@(_CurrentRestoreProjectPathItems)" Targets="_GenerateRestoreProjectPathWalk" SkipNonexistentTargets="true" SkipNonexistentProjects="true" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_GenerateRestoreProjectPathWalkOutputs" />
    </MSBuild>
    <!-- Without SkipNonexistentTargets -->
    <MSBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' != 'true' " Projects="@(_CurrentRestoreProjectPathItems)" Targets="_GenerateRestoreProjectPathWalk" ContinueOnError="$(RestoreContinueOnError)" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_GenerateRestoreProjectPathWalkOutputs" />
    </MSBuild>
    <!-- Include the current project in the result -->
    <ItemGroup>
      <_GenerateRestoreProjectPathWalkOutputs Include="$(MSBuildProjectFullPath)" />
    </ItemGroup>
    <!-- Remove duplicates -->
    <RemoveDuplicates Inputs="@(_GenerateRestoreProjectPathWalkOutputs)">
      <Output TaskParameter="Filtered" ItemName="_RestoreProjectPathItems" />
    </RemoveDuplicates>
  </Target>
  <!--
    ============================================================
    _GetAllRestoreProjectPathItems
    Get the full list of known projects.
    This includes all child projects from all target frameworks.
    ============================================================
  -->
  <Target Name="_GetAllRestoreProjectPathItems" DependsOnTargets="_FilterRestoreGraphProjectInputItems" Returns="@(_RestoreProjectPathItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Walk projects -->
    <!-- With SkipNonexistentTargets -->
    <MsBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' == 'true' " BuildInParallel="$(RestoreBuildInParallel)" Projects="@(FilteredRestoreGraphProjectInputItems)" Targets="_GenerateRestoreProjectPathWalk" SkipNonexistentTargets="true" SkipNonexistentProjects="true" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreProjectPathItemsOutputs" />
    </MsBuild>
    <!-- Without SkipNonexistentTargets -->
    <MsBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' != 'true' " Projects="@(FilteredRestoreGraphProjectInputItems)" Targets="_GenerateRestoreProjectPathWalk" ContinueOnError="$(RestoreContinueOnError)" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreProjectPathItemsOutputs" />
    </MsBuild>
    <!-- Remove duplicates -->
    <RemoveDuplicates Inputs="@(_RestoreProjectPathItemsOutputs)">
      <Output TaskParameter="Filtered" ItemName="_RestoreProjectPathItemsWithoutDupes" />
    </RemoveDuplicates>
    <!-- Remove projects that do not support restore. -->
    <!-- With SkipNonexistentTargets -->
    <MsBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' == 'true' " BuildInParallel="$(RestoreBuildInParallel)" Projects="@(_RestoreProjectPathItemsWithoutDupes)" Targets="_IsProjectRestoreSupported" SkipNonexistentTargets="true" SkipNonexistentProjects="true" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreProjectPathItems" />
    </MsBuild>
    <!-- Without SkipNonexistentTargets -->
    <MsBuild Condition=" '$(RestoreUseSkipNonexistentTargets)' != 'true' " Projects="@(_RestoreProjectPathItemsWithoutDupes)" Targets="_IsProjectRestoreSupported" ContinueOnError="$(RestoreContinueOnError)" Properties="$(_GenerateRestoreGraphProjectEntryInputProperties)">
      <Output TaskParameter="TargetOutputs" ItemName="_RestoreProjectPathItems" />
    </MsBuild>
  </Target>
  <!--
    ============================================================
    _GetRestoreSettingsOverrides
    Get global property overrides that should be resolved
    against the current working directory instead of the project.
    This is done by calling into NuGet.targets in a new scope,
    project properties will not be returned by the calls below.
    ============================================================
  -->
  <Target Name="_GetRestoreSettingsOverrides" Returns="$(_RestorePackagesPathOverride);$(_RestoreSourcesOverride);$(_RestoreFallbackFoldersOverride)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- RestorePackagesPathOverride -->
    <MsBuild BuildInParallel="$(RestoreBuildInParallel)" Condition=" '$(RestorePackagesPath)' != '' " Projects="$(MSBuildThisFileFullPath)" Targets="_GetRestorePackagesPathOverride">
      <Output TaskParameter="TargetOutputs" PropertyName="_RestorePackagesPathOverride" />
    </MsBuild>
    <!-- RestoreSourcesOverride -->
    <MsBuild BuildInParallel="$(RestoreBuildInParallel)" Condition=" '$(RestoreSources)' != '' " Projects="$(MSBuildThisFileFullPath)" Targets="_GetRestoreSourcesOverride">
      <Output TaskParameter="TargetOutputs" PropertyName="_RestoreSourcesOverride" />
    </MsBuild>
    <!-- RestoreFallbackFoldersOverride -->
    <MsBuild BuildInParallel="$(RestoreBuildInParallel)" Condition=" '$(RestoreFallbackFolders)' != '' " Projects="$(MSBuildThisFileFullPath)" Targets="_GetRestoreFallbackFoldersOverride">
      <Output TaskParameter="TargetOutputs" PropertyName="_RestoreFallbackFoldersOverride" />
    </MsBuild>
  </Target>
  <!--
    ============================================================
    _GetRestorePackagesPathOverride
    ============================================================
  -->
  <Target Name="_GetRestorePackagesPathOverride" Returns="$(_RestorePackagesPathOverride)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_RestorePackagesPathOverride>$(RestorePackagesPath)</_RestorePackagesPathOverride>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
    _GetRestoreSourcesOverride
    ============================================================
  -->
  <Target Name="_GetRestoreSourcesOverride" Returns="$(_RestoreSourcesOverride)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_RestoreSourcesOverride>$(RestoreSources)</_RestoreSourcesOverride>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
    _GetRestoreFallbackFoldersOverride
    ============================================================
  -->
  <Target Name="_GetRestoreFallbackFoldersOverride" Returns="$(_RestoreFallbackFoldersOverride)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_RestoreFallbackFoldersOverride>$(RestoreFallbackFolders)</_RestoreFallbackFoldersOverride>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
    _IsProjectRestoreSupported
    Verify restore targets exist in the project.
    ============================================================
  -->
  <Target Name="_IsProjectRestoreSupported" Returns="@(_ValidProjectsForRestore)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_ValidProjectsForRestore Include="$(MSBuildProjectFullPath)" />
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft.Common.CurrentVersion.targets
============================================================================================================================================
-->
  <!--<Import Project="$(CustomAfterMicrosoftCommonTargets)" Condition="'$(CustomAfterMicrosoftCommonTargets)' != '' and Exists('$(CustomAfterMicrosoftCommonTargets)')" />-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportAfter\*" Condition="'$(ImportByWildcardAfterMicrosoftCommonTargets)' == 'true' and exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportAfter')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.targets\ImportAfter\Microsoft.NET.Build.Extensions.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Build.Extensions.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <MicrosoftNETBuildExtensionsTargets Condition="'$(MicrosoftNETBuildExtensionsTargets)' == ''">$(MSBuildExtensionsPath)\Microsoft\Microsoft.NET.Build.Extensions\Microsoft.NET.Build.Extensions.targets</MicrosoftNETBuildExtensionsTargets>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(MicrosoftNETBuildExtensionsTargets)" Condition="Exists('$(MicrosoftNETBuildExtensionsTargets)')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft\Microsoft.NET.Build.Extensions\Microsoft.NET.Build.Extensions.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Build.Extensions.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <_TargetFrameworkVersionWithoutV>$(TargetFrameworkVersion.TrimStart('vV'))</_TargetFrameworkVersionWithoutV>
    <MicrosoftNETBuildExtensionsTasksAssembly Condition="'$(MicrosoftNETBuildExtensionsTasksAssembly)' == '' AND '$(MSBuildRuntimeType)' == 'Core'">$(MSBuildThisFileDirectory)\tools\netcoreapp2.0\Microsoft.NET.Build.Extensions.Tasks.dll</MicrosoftNETBuildExtensionsTasksAssembly>
    <MicrosoftNETBuildExtensionsTasksAssembly Condition="'$(MicrosoftNETBuildExtensionsTasksAssembly)' == ''">$(MSBuildThisFileDirectory)\tools\net46\Microsoft.NET.Build.Extensions.Tasks.dll</MicrosoftNETBuildExtensionsTasksAssembly>
    <!-- Include conflict resolution targets for NETFramework and allow other frameworks to opt-in -->
    <ResolveAssemblyConflicts Condition="'$(ResolveAssemblyConflicts)' == '' AND '$(TargetFrameworkIdentifier)' == '.NETFramework'">true</ResolveAssemblyConflicts>
  </PropertyGroup>
  <!--<Import Project="Microsoft.NET.Build.Extensions.NETFramework.targets" Condition="'$(TargetFrameworkIdentifier)' == '.NETFramework'" />-->
  <!-- Only import ConflictResolution targets for non-SDK projects, SDK projects have ConflictResolution built in -->
  <!--<Import Project="Microsoft.NET.Build.Extensions.ConflictResolution.targets" Condition="'$(ResolveAssemblyConflicts)' == 'true' AND '$(UsingMicrosoftNETSdk)' != 'true'" />-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.targets\ImportAfter\Microsoft.NET.Build.Extensions.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  </Import>
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportAfter\*" Condition="'$(ImportByWildcardAfterMicrosoftCommonTargets)' == 'true' and exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportAfter')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.targets\ImportAfter\Microsoft.TestPlatform.ImportAfter.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.TestPlatform.ImportAfter.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!-- Import Microsoft.TestPlatform.targets for VSTest target -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <VSTestTargets Condition="'$(VSTestTargets)'==''">$(MSBuildExtensionsPath)\Microsoft.TestPlatform.targets</VSTestTargets>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(VSTestTargets)" Condition="Exists('$(VSTestTargets)')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft.TestPlatform.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.TestPlatform.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!-- Load Microsoft.TestPlatform.Build.Tasks.dll, this can be overridden to use a different version with $(VSTestTaskAssemblyFile) -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <VSTestTaskAssemblyFile Condition="$(VSTestTaskAssemblyFile) == ''">Microsoft.TestPlatform.Build.dll</VSTestTaskAssemblyFile>
    <VSTestConsolePath Condition="$(VSTestConsolePath) == ''">$([System.IO.Path]::Combine($(MSBuildThisFileDirectory),"vstest.console.dll"))</VSTestConsolePath>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <UsingTask TaskName="Microsoft.TestPlatform.Build.Tasks.VSTestTask" AssemblyFile="$(VSTestTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="Microsoft.TestPlatform.Build.Tasks.BuildLogTask" AssemblyFile="$(VSTestTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
    Test target
    Main entry point for running tests through vstest.console.exe
    ============================================================
  -->
  <Target Name="VSTest" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CallTarget Condition="'$(VSTestNoBuild)' != 'true'" Targets="BuildProject" />
    <CallTarget Targets="ShowCallOfVSTestTaskWithParameter" />
    <Microsoft.TestPlatform.Build.Tasks.VSTestTask TestFileFullPath="$(TargetPath)" VSTestSetting="$(VSTestSetting)" VSTestTestAdapterPath="$(VSTestTestAdapterPath)" VSTestFramework="$(TargetFrameworkMoniker)" VSTestPlatform="$(PlatformTarget)" VSTestTestCaseFilter="$(VSTestTestCaseFilter)" VSTestLogger="$(VSTestLogger)" VSTestListTests="$(VSTestListTests)" VSTestDiag="$(VSTestDiag)" VSTestCLIRunSettings="$(VSTestCLIRunSettings)" VSTestConsolePath="$(VSTestConsolePath)" VSTestResultsDirectory="$(VSTestResultsDirectory)" VSTestVerbosity="$(VSTestVerbosity)" VSTestCollect="$(VSTestCollect)" VSTestBlame="$(VSTestBlame)" />
  </Target>
  <Target Name="BuildProject" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CallTarget Targets="ShowMsbuildWithParameter" />
    <Microsoft.TestPlatform.Build.Tasks.BuildLogTask BuildStarted="True" />
    <MSBuild Projects="$(MSBuildProjectFullPath)" />
    <Microsoft.TestPlatform.Build.Tasks.BuildLogTask />
    <Message Text="Done Building project $(MSBuildProjectFullPath) for TargetFramework=$(TargetFramework)" Importance="low" />
  </Target>
  <Target Name="ShowMsbuildWithParameter" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Message Text="Building project $(MSBuildProjectFullPath) for TargetFramework=$(TargetFramework)" Importance="low" />
    <Message Text="Value passed to msbuild are..." Importance="low" />
    <Message Text="Configuration = $(Configuration)" Importance="low" />
    <Message Text="TargetFramework = $(TargetFramework)" Importance="low" />
    <Message Text="Platform = $(PlatformTarget)" Importance="low" />
    <Message Text="OutputPath = $(OutputPath)" Importance="low" />
  </Target>
  <Target Name="ShowCallOfVSTestTaskWithParameter" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Message Text="Calling task Microsoft.TestPlatform.Build.Tasks.VSTestTask with following parameter..." Importance="low" />
    <Message Text="TestFileFullPath = $(TargetPath)" Importance="low" />
    <Message Text="VSTestSetting = $(VSTestSetting)" Importance="low" />
    <Message Text="VSTestTestAdapterPath = $(VSTestTestAdapterPath)" Importance="low" />
    <Message Text="VSTestFramework = $(TargetFrameworkMoniker)" Importance="low" />
    <Message Text="VSTestPlatform = $(PlatformTarget)" Importance="low" />
    <Message Text="VSTestTestCaseFilter = $(VSTestTestCaseFilter)" Importance="low" />
    <Message Text="VSTestLogger = $(VSTestLogger)" Importance="low" />
    <Message Text="VSTestListTests = $(VSTestListTests)" Importance="low" />
    <Message Text="VSTestDiag = $(VSTestDiag)" Importance="low" />
    <Message Text="VSTestCLIRunSettings = $(VSTestCLIRunSettings)" Importance="low" />
    <Message Text="VSTestResultsDirectory = $(VSTestResultsDirectory)" Importance="low" />
    <Message Text="VSTestConsolePath = $(VSTestConsolePath)" Importance="low" />
    <Message Text="VSTestVerbosity = $(VSTestVerbosity)" Importance="low" />
    <Message Text="VSTestCollect = $(VSTestCollect)" Importance="low" />
    <Message Text="VSTestBlame = $(VSTestBlame)" Importance="low" />
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\15.0\Microsoft.Common.targets\ImportAfter\Microsoft.TestPlatform.ImportAfter.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft.Common.CurrentVersion.targets
============================================================================================================================================
-->
  <!--<Import Project="$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportAfter\*" Condition="'$(ImportUserLocationsByWildcardAfterMicrosoftCommonTargets)' == 'true' and exists('$(MSBuildUserExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.targets\ImportAfter')" />-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.targets
============================================================================================================================================
-->
  <!--<Import Project="$(MSBuildThisFileDirectory)..\targets\Microsoft.NET.Sdk.CrossTargeting.targets" Condition="'$(IsCrossTargetingBuild)' == 'true'" />-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)..\targets\Microsoft.NET.Sdk.targets" Condition="'$(IsCrossTargetingBuild)' != 'true'">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Sdk.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!-- Workaround: https://github.com/Microsoft/msbuild/issues/1293 -->
  <PropertyGroup Condition="'$(MSBuildRuntimeType)' == 'Core' Or '$(TargetFrameworkIdentifier)' != '.NETFramework'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateResourceMSBuildArchitecture Condition=" '$(GenerateResourceMSBuildArchitecture)' == '' ">CurrentArchitecture</GenerateResourceMSBuildArchitecture>
    <GenerateResourceMSBuildRuntime Condition=" '$(GenerateResourceMSBuildRuntime)' == '' ">CurrentRuntime</GenerateResourceMSBuildRuntime>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="Microsoft.NET.Sdk.Common.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.Common.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Sdk.Common.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <!-- This file is imported by both cross-targeting and inner builds. Set properties that need to be available to both here. -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <MicrosoftNETBuildTasksDirectoryRoot>$(MSBuildThisFileDirectory)..\tools\</MicrosoftNETBuildTasksDirectoryRoot>
    <MicrosoftNETBuildTasksTFM Condition=" '$(MSBuildRuntimeType)' == 'Core'">netcoreapp2.0</MicrosoftNETBuildTasksTFM>
    <MicrosoftNETBuildTasksTFM Condition=" '$(MicrosoftNETBuildTasksTFM)' == ''">net46</MicrosoftNETBuildTasksTFM>
    <MicrosoftNETBuildTasksDirectory>$(MicrosoftNETBuildTasksDirectoryRoot)$(MicrosoftNETBuildTasksTFM)/</MicrosoftNETBuildTasksDirectory>
    <MicrosoftNETBuildTasksAssembly>$(MicrosoftNETBuildTasksDirectory)Microsoft.NET.Build.Tasks.dll</MicrosoftNETBuildTasksAssembly>
    <!--
          Hardcoded list of known implicit packges that are added to project from default SDK targets implicitly.
          Should be re-visited when multiple TFM support is added to Dependencies logic.
    -->
    <DefaultImplicitPackages>Microsoft.NETCore.App;NETStandard.Library</DefaultImplicitPackages>
  </PropertyGroup>
  <!--
     Some versions of Microsoft.NET.Test.Sdk.targets change the OutputType after we've set _IsExecutable and
     HasRuntimeOutput default in Microsfot.NET.Sdk.BeforeCommon.targets. Refresh these value here for backwards
     compatibilty with that.
   -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_IsExecutable Condition="'$(OutputType)' == 'Exe' or '$(OutputType)'=='WinExe'">true</_IsExecutable>
    <HasRuntimeOutput Condition="'$(_UsingDefaultForHasRuntimeOutput)' == 'true'">$(_IsExecutable)</HasRuntimeOutput>
  </PropertyGroup>
  <PropertyGroup Condition="'$(DotnetCliToolTargetFramework)' == '' And '$(BundledNETCoreAppTargetFrameworkVersion)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Set the TFM used to restore .NET CLI tools to match the version of .NET Core bundled in the CLI -->
    <DotnetCliToolTargetFramework>netcoreapp$(BundledNETCoreAppTargetFrameworkVersion)</DotnetCliToolTargetFramework>
  </PropertyGroup>
  <UsingTask TaskName="GetNearestTargetFramework" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NETSdkError" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NETSdkWarning" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="ShowPreviewMessage" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
  ============================================================
                              GetTargetFrameworkProperties

    Invoked by common targets to return the set of properties
    (in the form  "key1=value1;...keyN=valueN") needed to build
    against the target framework that best matches the referring
    project's target framework.

    The referring project's $(TargetFrameworkMoniker) is passed
    in as $(ReferringTargetFramework).

    This is in the common targets so that it will apply to both
    cross-targeted and single-targeted projects.  It is run
    for single-targeted projects so that an error will be
    generated if the referenced project is not compatible
    with the referencing project's target framework.
  ============================================================
   -->
  <Target Name="GetTargetFrameworkProperties" Returns="TargetFramework=$(NearestTargetFramework);ProjectHasSingleTargetFramework=$(_HasSingleTargetFramework);ProjectIsRidAgnostic=$(_IsRidAgnostic)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- indicate to caller that project is RID agnostic so that a global property RuntimeIdentifier value can be removed -->
      <_IsRidAgnostic>false</_IsRidAgnostic>
      <_IsRidAgnostic Condition=" '$(RuntimeIdentifier)' == '' and '$(RuntimeIdentifiers)' == '' ">true</_IsRidAgnostic>
      <!-- If a ReferringTargetFramework was not specified, and we only have one TargetFramework, then don't try to check compatibility -->
      <_SkipNearestTargetFrameworkResolution Condition="'$(TargetFramework)' != '' and '$(ReferringTargetFramework)' == ''">true</_SkipNearestTargetFrameworkResolution>
      <NearestTargetFramework Condition="'$(_SkipNearestTargetFrameworkResolution)' == 'true'">$(TargetFramework)</NearestTargetFramework>
      <!-- A project can only have more than one output if the current global properties are such that the current build is a cross-targeting one. -->
      <_HasSingleTargetFramework Condition="'$(IsCrossTargetingBuild)' != 'true'">true</_HasSingleTargetFramework>
      <_HasSingleTargetFramework Condition="'$(_HasSingleTargetFramework)' == ''">false</_HasSingleTargetFramework>
      <_PossibleTargetFrameworks Condition="'$(TargetFramework)' != ''">$(TargetFramework)</_PossibleTargetFrameworks>
      <_PossibleTargetFrameworks Condition="'$(TargetFramework)' == ''">$(TargetFrameworks)</_PossibleTargetFrameworks>
    </PropertyGroup>
    <GetNearestTargetFramework ReferringTargetFramework="$(ReferringTargetFramework)" PossibleTargetFrameworks="$(_PossibleTargetFrameworks)" ProjectFilePath="$(MSBuildProjectFullPath)" Condition="'$(_SkipNearestTargetFrameworkResolution)' != 'true'">
      <Output PropertyName="NearestTargetFramework" TaskParameter="NearestTargetFramework" />
    </GetNearestTargetFramework>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--<ImportGroup>-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.PackageDependencyResolution.targets" Condition="Exists('$(MSBuildThisFileDirectory)Microsoft.PackageDependencyResolution.targets')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.PackageDependencyResolution.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.PackageDependencyResolution.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!--
    *************************************
    1. INPUT PROPERTIES
    - That configure the PackageDependency targets
    *************************************
    -->
  <!-- General Properties -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectAssetsFile Condition="'$(ProjectAssetsFile)' == ''">$(MSBuildProjectExtensionsPath)/project.assets.json</ProjectAssetsFile>
    <ProjectAssetsFile>$([MSBuild]::NormalizePath($(MSBuildProjectDirectory), $(ProjectAssetsFile)))</ProjectAssetsFile>
    <!-- Note that the assets.cache file has contents that are unique to the current TFM and configuration and therefore cannot
         be stored in a shared directory next to the assets.json file -->
    <ProjectAssetsCacheFile Condition="'$(ProjectAssetsCacheFile)' == ''">$(IntermediateOutputPath)$(MSBuildProjectName).assets.cache</ProjectAssetsCacheFile>
    <ProjectAssetsCacheFile>$([MSBuild]::NormalizePath($(MSBuildProjectDirectory), $(ProjectAssetsCacheFile)))</ProjectAssetsCacheFile>
    <CopyLocalLockFileAssemblies Condition="'$(CopyLocalLockFileAssemblies)' == ''">true</CopyLocalLockFileAssemblies>
    <ContentPreprocessorOutputDirectory Condition="'$(ContentPreprocessorOutputDirectory)' == ''">$(IntermediateOutputPath)NuGet\</ContentPreprocessorOutputDirectory>
    <UseTargetPlatformAsNuGetTargetMoniker Condition="'$(UseTargetPlatformAsNuGetTargetMoniker)' == '' AND '$(TargetFrameworkMoniker)' == '.NETCore,Version=v5.0'">true</UseTargetPlatformAsNuGetTargetMoniker>
    <NuGetTargetMoniker Condition="'$(NuGetTargetMoniker)' == '' AND '$(UseTargetPlatformAsNuGetTargetMoniker)' == 'true'">$(TargetPlatformIdentifier),Version=v$([System.Version]::Parse('$(TargetPlatformMinVersion)').ToString(3))</NuGetTargetMoniker>
    <NuGetTargetMoniker Condition="'$(NuGetTargetMoniker)' == '' AND '$(UseTargetPlatformAsNuGetTargetMoniker)' != 'true'">$(TargetFrameworkMoniker)</NuGetTargetMoniker>
    <EmitAssetsLogMessages Condition="'$(EmitAssetsLogMessages)' == ''">true</EmitAssetsLogMessages>
  </PropertyGroup>
  <!-- Target Moniker + RID-->
  <PropertyGroup Condition="'$(_NugetTargetMonikerAndRID)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_NugetTargetMonikerAndRID Condition="'$(RuntimeIdentifier)' == ''">$(NuGetTargetMoniker)</_NugetTargetMonikerAndRID>
    <_NugetTargetMonikerAndRID Condition="'$(RuntimeIdentifier)' != ''">$(NuGetTargetMoniker)/$(RuntimeIdentifier)</_NugetTargetMonikerAndRID>
  </PropertyGroup>
  <!--
    *************************************
    2. EXTERNAL PROPERTIES and ITEMS
    - Override or add to external targets
    *************************************
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolveAssemblyReferencesDependsOn>
      $(ResolveAssemblyReferencesDependsOn);
      ResolvePackageDependenciesForBuild;
      _HandlePackageFileConflicts;
    </ResolveAssemblyReferencesDependsOn>
    <PrepareResourcesDependsOn>
      ResolvePackageDependenciesForBuild;
      _HandlePackageFileConflicts;
      $(PrepareResourcesDependsOn)
    </PrepareResourcesDependsOn>
  </PropertyGroup>
  <!-- Common tokens used in preprocessed content files -->
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PreprocessorValue Include="rootnamespace">
      <Value>$(RootNamespace)</Value>
    </PreprocessorValue>
    <PreprocessorValue Include="assemblyname">
      <Value>$(AssemblyName)</Value>
    </PreprocessorValue>
    <PreprocessorValue Include="fullpath">
      <Value>$(MSBuildProjectDirectory)</Value>
    </PreprocessorValue>
    <PreprocessorValue Include="outputfilename">
      <Value>$(TargetFileName)</Value>
    </PreprocessorValue>
    <PreprocessorValue Include="filename">
      <Value>$(MSBuildProjectFile)</Value>
    </PreprocessorValue>
    <PreprocessorValue Include="@(NuGetPreprocessorValue)" Exclude="@(PreprocessorValue)" />
  </ItemGroup>
  <!--
    This will prevent RAR from spending time locating dependencies and related files for assemblies
    that came from packages. PackageReference should already be promoted to a closure of Reference
    items and we are responsible for adding package relates files to CopyLocal items, not RAR. This
    is only configurable as a compat opt-out in case skipping the slow RAR code breaks something.
  -->
  <PropertyGroup Condition="'$(MarkPackageReferencesAsExternallyResolved)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MarkPackageReferencesAsExternallyResolved>true</MarkPackageReferencesAsExternallyResolved>
  </PropertyGroup>
  <!--
    *************************************
    3. BUILD TARGETS
    - Override the Depends-On properties, or the individual targets
    *************************************
    -->
  <!--
    ============================================================
                     ResolvePackageDependenciesForBuild

    Populate items for build. This is triggered before target 
    "AssignProjectConfiguration" to ensure ProjectReference items
    are populated before ResolveProjectReferences is run.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolvePackageDependenciesForBuildDependsOn>
      ResolveLockFileReferences;
      ResolveLockFileAnalyzers;
      ResolveLockFileCopyLocalProjectDeps;
      RunProduceContentAssets;
      IncludeTransitiveProjectReferences
    </ResolvePackageDependenciesForBuildDependsOn>
  </PropertyGroup>
  <Target Name="ResolvePackageDependenciesForBuild" Condition=" ('$(DesignTimeBuild)' != 'true' and '$(_CleaningWithoutRebuilding)' != 'true')                       Or Exists('$(ProjectAssetsFile)')" BeforeTargets="AssignProjectConfiguration" DependsOnTargets="$(ResolvePackageDependenciesForBuildDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    *************************************
    4. Package Dependency TASK and TARGETS
    - Raise the lock file to MSBuild Items and create derived items
    *************************************
    -->
  <!--
    ============================================================
                     RunResolvePackageDependencies

    Generate Definitions and Dependencies based on ResolvePackageDependencies task
    ============================================================
    -->
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.ResolvePackageDependencies" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.CheckForTargetInAssetsFile" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.JoinItems" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.ResolvePackageAssets" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!-- The condition on this target causes it to be skipped during design-time builds if
        the restore operation hasn't run yet.  This is to avoid displaying an error in
        the Visual Studio error list when a project is created before NuGet restore has
        run and created the assets file. -->
  <Target Name="RunResolvePackageDependencies" Condition=" '$(DesignTimeBuild)' != 'true' Or Exists('$(ProjectAssetsFile)')" DependsOnTargets="ReportAssetsLogMessages" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Verify that the assets file has a target for the right framework.  Otherwise, if we restored for the
         wrong framework, we'd end up finding no references to pass to the compiler, and we'd get a ton of
         compile errors. -->
    <CheckForTargetInAssetsFile AssetsFilePath="$(ProjectAssetsFile)" TargetFrameworkMoniker="$(NuGetTargetMoniker)" RuntimeIdentifier="$(RuntimeIdentifier)" />
    <ResolvePackageDependencies ProjectPath="$(MSBuildProjectFullPath)" ProjectAssetsFile="$(ProjectAssetsFile)" ProjectLanguage="$(Language)" ContinueOnError="ErrorAndContinue">
      <Output TaskParameter="TargetDefinitions" ItemName="TargetDefinitions" />
      <Output TaskParameter="PackageDefinitions" ItemName="PackageDefinitions" />
      <Output TaskParameter="FileDefinitions" ItemName="FileDefinitions" />
      <Output TaskParameter="PackageDependencies" ItemName="PackageDependencies" />
      <Output TaskParameter="FileDependencies" ItemName="FileDependencies" />
    </ResolvePackageDependencies>
  </Target>
  <Target Name="ResolvePackageAssets" Condition=" '$(DesignTimeBuild)' != 'true' Or Exists('$(ProjectAssetsFile)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition="'$(EnsureRuntimePackageDependencies)' == ''                           and '$(TargetFrameworkIdentifier)' == '.NETCoreApp'                           and '$(EnsureNETCoreAppRuntime)' != 'false'">
      <EnsureRuntimePackageDependencies>true</EnsureRuntimePackageDependencies>
    </PropertyGroup>
    <ResolvePackageAssets ProjectAssetsFile="$(ProjectAssetsFile)" ProjectAssetsCacheFile="$(ProjectAssetsCacheFile)" ProjectPath="$(MSBuildProjectFullPath)" ProjectLanguage="$(Language)" EmitAssetsLogMessages="$(EmitAssetsLogMessages)" TargetFrameworkMoniker="$(NuGetTargetMoniker)" RuntimeIdentifier="$(RuntimeIdentifier)" MarkPackageReferencesAsExternallyResolved="$(MarkPackageReferencesAsExternallyResolved)" DisablePackageAssetsCache="$(DisablePackageAssetsCache)" DisableFrameworkAssemblies="$(DisableLockFileFrameworks)" DisableTransitiveProjectReferences="$(DisableTransitiveProjectReferences)" EnsureRuntimePackageDependencies="$(EnsureRuntimePackageDependencies)" VerifyMatchingImplicitPackageVersion="$(VerifyMatchingImplicitPackageVersion)" ExpectedPlatformPackages="@(ExpectedPlatformPackages)">
      <!-- NOTE: items names here are inconsistent because they match prior implementation
          (that was spread across different tasks/targets) for backwards compatibility.  -->
      <Output TaskParameter="Analyzers" ItemName="ResolvedAnalyzers" />
      <Output TaskParameter="ContentFilesToPreprocess" ItemName="_ContentFilesToPreprocess" />
      <Output TaskParameter="FrameworkAssemblies" ItemName="ResolvedFrameworkAssemblies" />
      <Output TaskParameter="NativeLibraries" ItemName="NativeCopyLocalItems" />
      <Output TaskParameter="ResourceAssemblies" ItemName="ResourceCopyLocalItems" />
      <Output TaskParameter="RuntimeAssemblies" ItemName="RuntimeCopyLocalItems" />
      <Output TaskParameter="RuntimeTargets" ItemName="ResolvedRuntimeTargets" />
      <Output TaskParameter="CompileTimeAssemblies" ItemName="ResolvedCompileFileDefinitions" />
      <Output TaskParameter="TransitiveProjectReferences" ItemName="_TransitiveProjectReferences" />
    </ResolvePackageAssets>
  </Target>
  <Target Name="FilterSatelliteResources" AfterTargets="ResolvePackageAssets" Condition="'$(SatelliteResourceLanguages)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <JoinItems Left="@(ResourceCopyLocalItems)" LeftKey="Culture" LeftMetadata="*" Right="$(SatelliteResourceLanguages)" RightKey="" RightMetadata="" ItemSpecToUse="Left">
      <Output TaskParameter="JoinResult" ItemName="FilteredResourceCopyLocalItems" />
    </JoinItems>
    <ItemGroup>
      <ResourceCopyLocalItems Remove="@(ResourceCopyLocalItems)" />
      <ResourceCopyLocalItems Include="@(FilteredResourceCopyLocalItems)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                     ResolvePackageDependenciesDesignTime

    Aggregate the dependencies produced by ResolvePackageDependencies to a form
    that's consumable by an IDE to display package dependencies.
    ============================================================
    -->
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.PreprocessPackageDependenciesDesignTime" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="ResolvePackageDependenciesDesignTime" Returns="@(_DependenciesDesignTime)" DependsOnTargets="RunResolvePackageDependencies;ResolveAssemblyReferencesDesignTime" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PreprocessPackageDependenciesDesignTime TargetDefinitions="@(TargetDefinitions)" PackageDefinitions="@(PackageDefinitions)" FileDefinitions="@(FileDefinitions)" PackageDependencies="@(PackageDependencies)" FileDependencies="@(FileDependencies)" References="@(Reference)" DefaultImplicitPackages="$(DefaultImplicitPackages)" InputDiagnosticMessages="@(DiagnosticMessages)" TargetFrameworkMoniker="$(NuGetTargetMoniker)">
      <Output TaskParameter="DependenciesDesignTime" ItemName="_DependenciesDesignTime" />
    </PreprocessPackageDependenciesDesignTime>
  </Target>
  <!--
    ============================================================
                     CollectSDKReferencesDesignTime

    Aggregates the sdk specified as project items and implicit
    packages references.
    ============================================================
    -->
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.CollectSDKReferencesDesignTime" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="CollectSDKReferencesDesignTime" Returns="@(_SDKReference)" DependsOnTargets="CollectPackageReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CollectSDKReferencesDesignTime SdkReferences="@(SdkReference)" PackageReferences="@(PackageReference)" DefaultImplicitPackages="$(DefaultImplicitPackages)">
      <Output TaskParameter="SDKReferencesDesignTime" ItemName="_SDKReference" />
    </CollectSDKReferencesDesignTime>
  </Target>
  <!--
    ============================================================
                     CollectResolvedSDKReferencesDesignTime

    Aggregates the sdk specified as project items and implicit
    packages produced by ResolvePackageDependencies.
    ============================================================
    -->
  <Target Name="CollectResolvedSDKReferencesDesignTime" Returns="@(_ResolvedSDKReference)" DependsOnTargets="ResolveSDKReferencesDesignTime;CollectPackageReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CollectSDKReferencesDesignTime SdkReferences="@(ResolvedSdkReference)" PackageReferences="@(PackageReference)" DefaultImplicitPackages="$(DefaultImplicitPackages)">
      <Output TaskParameter="SDKReferencesDesignTime" ItemName="_ResolvedSDKReference" />
    </CollectSDKReferencesDesignTime>
  </Target>
  <!--
    ============================================================
                     RunProduceContentAssets

    Process content assets by handling preprocessing tokens where necessary, and 
    produce copy local items, content items grouped by "build action" and file writes
    ============================================================
    -->
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.ProduceContentAssets" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="RunProduceContentAssets" DependsOnTargets="ResolvePackageAssets" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProduceContentAssets ContentFileDependencies="@(_ContentFilesToPreprocess)" ContentPreprocessorValues="@(PreprocessorValue)" ContentPreprocessorOutputDirectory="$(ContentPreprocessorOutputDirectory)" ProduceOnlyPreprocessorFiles="true" ProjectLanguage="$(Language)">
      <Output TaskParameter="CopyLocalItems" ItemName="_ContentCopyLocalItems" />
      <Output TaskParameter="ProcessedContentItems" ItemName="_ProcessedContentItems" />
      <Output TaskParameter="FileWrites" ItemName="FileWrites" />
    </ProduceContentAssets>
    <!-- The items in _ProcessedContentItems need to go into the appropriately-named item group, 
         but the names depend upon the items themselves. Split it apart. -->
    <CreateItem Include="@(_ProcessedContentItems)" Condition="'@(_ProcessedContentItems)' != ''">
      <Output TaskParameter="Include" ItemName="%(_ProcessedContentItems.ProcessedItemType)" />
    </CreateItem>
  </Target>
  <!--
    ============================================================
                     ReportAssetsLogMessages

    Report Log Messages in the assets file to MSBuild and raise them as
    DiagnosticMessage items that can be consumed downstream (e.g. by the
    dependency node in the solution explorer)
    ============================================================
    -->
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.ReportAssetsLogMessages" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.LoadAssetsFile" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!-- The condition on this target causes it to be skipped during design-time builds if
        the restore operation hasn't run yet.  This is to avoid displaying an error in
        the Visual Studio error list when a project is created before NuGet restore has
        run and created the assets file. -->
  <Target Name="ReportAssetsLogMessages" Condition="'$(EmitAssetsLogMessages)' == 'true' And ('$(DesignTimeBuild)' != 'true' Or Exists('$(ProjectAssetsFile)'))" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Load the assets file in a separate task, so that if the file itself can't be loaded (or isn't set), we
         can generate an error without continuing (since ReportAssetsLogMessages uses ContinueOnError="ErrorAndContinue" -->
    <LoadAssetsFile ProjectAssetsFile="$(ProjectAssetsFile)" />
    <ReportAssetsLogMessages ProjectAssetsFile="$(ProjectAssetsFile)" ContinueOnError="ErrorAndContinue">
      <Output TaskParameter="DiagnosticMessages" ItemName="DiagnosticMessages" />
    </ReportAssetsLogMessages>
  </Target>
  <!--
    ============================================================
    Reference Targets: For populating References based on lock file
    - ResolveLockFileReferences
    ============================================================
    -->
  <Target Name="ResolveLockFileReferences" DependsOnTargets="ResolvePackageAssets" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup Condition="'$(MarkPackageReferencesAsExternallyResolved)' == 'true'">
      <!--
        Update Reference items with NuGetPackageId metadata to set ExternallyResolved appropriately.
        NetStandard.Library adds its assets in targets this way and not in the standard way that
        would get ExternallyResolved set in ResolvePackageAssets.
       -->
      <Reference Condition="'%(Reference.NuGetPackageId)' != ''">
        <ExternallyResolved>true</ExternallyResolved>
      </Reference>
      <!-- Add framework references from NuGet packages here, so that if there is also a matching reference from a NuGet package,
           it will be treated the same as a reference from the project file. -->
      <Reference Include="@(ResolvedFrameworkAssemblies)" />
    </ItemGroup>
    <JoinItems Left="@(ResolvedCompileFileDefinitions)" LeftKey="FileName" LeftMetadata="*" Right="@(Reference)" RightKey="" RightMetadata="*">
      <Output TaskParameter="JoinResult" ItemName="_JoinedResolvedCompileFileDefinitions" />
    </JoinItems>
    <ItemGroup>
      <Reference Remove="@(_JoinedResolvedCompileFileDefinitions)" />
      <Reference Include="@(_JoinedResolvedCompileFileDefinitions)" />
    </ItemGroup>
    <ItemGroup>
      <ResolvedCompileFileDefinitionsToAdd Include="@(ResolvedCompileFileDefinitions)" />
      <ResolvedCompileFileDefinitionsToAdd Remove="%(_JoinedResolvedCompileFileDefinitions.HintPath)" />
      <!-- Add the references we computed -->
      <Reference Include="@(ResolvedCompileFileDefinitionsToAdd)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    ProjectReference Targets: Include transitive project references before 
                              ResolveProjectReferences is called
    - IncludeTransitiveProjectReferences
    ============================================================
    -->
  <Target Name="IncludeTransitiveProjectReferences" DependsOnTargets="ResolvePackageAssets" Condition="'$(DisableTransitiveProjectReferences)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <ProjectReference Include="@(_TransitiveProjectReferences)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    Analyzer Targets: For populating Analyzers based on lock file
    - ResolveLockFileAnalyzers
    ============================================================
    -->
  <Target Name="ResolveLockFileAnalyzers" DependsOnTargets="ResolvePackageAssets" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <Analyzer Include="@(ResolvedAnalyzers)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    CopyLocal Targets: For populating CopyLocal based on lock file
     _ComputeLockFileCopyLocal
    - ResolveLockFileCopyLocalProjectDeps
    ============================================================
    -->
  <Target Name="_ComputeLockFileCopyLocal" DependsOnTargets="ResolvePackageAssets;RunProduceContentAssets" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <AllCopyLocalItems Include="@(NativeCopyLocalItems)" />
      <AllCopyLocalItems Include="@(RuntimeCopyLocalItems)" />
      <AllCopyLocalItems Include="@(ResourceCopyLocalItems)" />
      <AllCopyLocalItems Include="@(_ContentCopyLocalItems)" />
    </ItemGroup>
  </Target>
  <Target Name="ResolveLockFileCopyLocalProjectDeps" Condition="'$(CopyLocalLockFileAssemblies)' == 'true'" DependsOnTargets="_ComputeLockFileCopyLocal" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <ReferenceCopyLocalPaths Include="@(AllCopyLocalItems)" />
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--</ImportGroup>-->
  <!--
============================================================================================================================================
  <Import Project="Microsoft.NET.Sdk.DefaultItems.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.DefaultItems.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Sdk.DefaultItems.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <EnableDefaultItems Condition=" '$(EnableDefaultItems)' == '' ">true</EnableDefaultItems>
    <EnableDefaultCompileItems Condition=" '$(EnableDefaultCompileItems)' == '' ">true</EnableDefaultCompileItems>
    <EnableDefaultEmbeddedResourceItems Condition=" '$(EnableDefaultEmbeddedResourceItems)' == '' ">true</EnableDefaultEmbeddedResourceItems>
    <EnableDefaultNoneItems Condition=" '$(EnableDefaultNoneItems)' == '' ">true</EnableDefaultNoneItems>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Set DefaultItemExcludes property for items that should be excluded from the default Compile, etc items.
         This is in the .targets because it needs to come after the final BaseOutputPath has been evaluated. -->
    <!-- bin folder, by default -->
    <DefaultItemExcludes>$(DefaultItemExcludes);$(BaseOutputPath)/**</DefaultItemExcludes>
    <!-- obj folder, by default -->
    <DefaultItemExcludes>$(DefaultItemExcludes);$(BaseIntermediateOutputPath)/**</DefaultItemExcludes>
    <!-- Various files that should generally always be ignored -->
    <DefaultItemExcludes>$(DefaultItemExcludes);**/*.user</DefaultItemExcludes>
    <DefaultItemExcludes>$(DefaultItemExcludes);**/*.*proj</DefaultItemExcludes>
    <DefaultItemExcludes>$(DefaultItemExcludes);**/*.sln</DefaultItemExcludes>
    <DefaultItemExcludes>$(DefaultItemExcludes);**/*.vssscc</DefaultItemExcludes>
    <!-- WARNING: This pattern is there to ignore folders such as .git and .vs, but it will also match items included with a
         relative path outside the project folder (for example "..\Shared\Shared.cs").  So be sure only to apply it to items
         that are in the project folder. -->
    <DefaultExcludesInProjectFolder>$(DefaultItemExcludesInProjectFolder);**/.*/**</DefaultExcludesInProjectFolder>
  </PropertyGroup>
  <!-- Set the default versions of the NETStandard.Library or Microsoft.NETCore.App packages to reference.
       The implicit package references themselves are defined in Microsoft.NET.Sdk.props, so that they can be overridden
       in the project file. -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETStandard'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- If targeting the same release that is bundled with the .NET Core SDK, use the bundled package version provided by Microsoft.NETCoreSdk.BundledVersions.props -->
    <NETStandardImplicitPackageVersion Condition="'$(NETStandardImplicitPackageVersion)' =='' And '$(_TargetFrameworkVersionWithoutV)' == '$(BundledNETStandardTargetFrameworkVersion)'">$(BundledNETStandardPackageVersion)</NETStandardImplicitPackageVersion>
    <!-- If targeting .NET Standard 1.x, use version 1.6.1 of the package.  This is so that when projects are packed, the dependency on the package produced won't change when
         updating to the 2.0 or higher SDK.  When targeting .NET Standard 2.0 or higher, the NETStandard.Library reference won't show up as a dependency of the package
         produced, so we will roll forward to the latest version. -->
    <NETStandardImplicitPackageVersion Condition="'$(NETStandardImplicitPackageVersion)' =='' And '$(_TargetFrameworkVersionWithoutV)' &lt; '2.0'">1.6.1</NETStandardImplicitPackageVersion>
    <!-- Default to use the latest stable release. -->
    <NETStandardImplicitPackageVersion Condition="'$(NETStandardImplicitPackageVersion)' ==''">2.0.2</NETStandardImplicitPackageVersion>
  </PropertyGroup>
  <!--
    Determine the version (including patch) of .NET Core to target.
    
    When targeting .NET Core, the TargetFramework is used to specify the major and minor version of the runtime to use.  By default,
    the patch version is inferred.  The general logic is that self-contained apps will target the latest patch that the SDK
    knows about, while framework-dependent apps will target the ".0" patch (and roll forward to the latest patch installed at
    runtime).
    
    When targeting .NET Core 1.0 and 1.1, framework-dependent apps use 1.0.5 and 1.1.2, respectively.  This is done for compatibility
    with previous releases that bumped the self-contained and framework-dependent versions together.
    
    The TargetLatestRuntimePatch property can be set to true or false to explicitly opt in or out of the logic to roll forward
    to the latest patch, regardless of whether the app is self-contained or framework-dependent.
    
    The RuntimeFrameworkVersion is where the actual version of the .NET Core runtime to target is stored.  It is the version that is
    used in the implicit PackageReference to Microsoft.NETCore.App.  The RuntimeFrameworkVersion can also be set explicitly, which
    will disable all the other logic that automatically selects the version of .NET Core to target.
    
    The framework version that is written to the runtimeconfig.json file is based on the actual resolved package version
    of Microsoft.NETCore.App.  This is to allow floating the verion number (ie the RuntimeFrameworkVersion could be set to
    "2.0-*".
  
  -->
  <!--
      Possible property names to enable roll-forward:
      - TargetLatestRuntimePatch
      - TargetLatestNetCoreRuntimePatch
      - RollForwardRuntime
      - RollForwardNetCoreRuntime
      
     Possible property names for roll-forward/not roll-forward versions
      - LatestNetCorePatchVersion / DefaultNetCorePatchVersion
      
      TODO: Get feedback on these names and then delete this comment
  -->
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- These properties will allow the latest patch versions to be set in the CLI (via BundledVersions.props) or overridden by tests -->
    <LatestPatchVersionForNetCore1_0 Condition="'$(LatestPatchVersionForNetCore1_0)' == ''">1.0.10</LatestPatchVersionForNetCore1_0>
    <LatestPatchVersionForNetCore1_1 Condition="'$(LatestPatchVersionForNetCore1_1)' == ''">1.1.7</LatestPatchVersionForNetCore1_1>
    <LatestPatchVersionForNetCore2_0 Condition="'$(LatestPatchVersionForNetCore2_0)' == ''">2.0.6</LatestPatchVersionForNetCore2_0>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(DefaultNetCorePatchVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DefaultNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '1.0'">1.0.5</DefaultNetCorePatchVersion>
    <DefaultNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '1.1'">1.1.2</DefaultNetCorePatchVersion>
    <!-- If targeting the same pre-release that is bundled with the .NET Core SDK, use the bundled package version
         provided by Microsoft.NETCoreSdk.BundledVersions.props -->
    <DefaultNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '$(BundledNETCoreAppTargetFrameworkVersion)'">$(BundledNETCoreAppPackageVersion)</DefaultNetCorePatchVersion>
    <!-- If not covered by the previous cases use the target framework version for the default patch version -->
    <DefaultNetCorePatchVersion Condition="'$(DefaultNetCorePatchVersion)' == ''">$(_TargetFrameworkVersionWithoutV)</DefaultNetCorePatchVersion>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(LatestNetCorePatchVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <LatestNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '1.0'">$(LatestPatchVersionForNetCore1_0)</LatestNetCorePatchVersion>
    <LatestNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '1.1'">$(LatestPatchVersionForNetCore1_1)</LatestNetCorePatchVersion>
    <LatestNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '2.0'">$(LatestPatchVersionForNetCore2_0)</LatestNetCorePatchVersion>
    <!-- If targeting the same pre-release that is bundled with the .NET Core SDK, use the bundled package version
         provided by Microsoft.NETCoreSdk.BundledVersions.props -->
    <LatestNetCorePatchVersion Condition="'$(_TargetFrameworkVersionWithoutV)' == '$(BundledNETCoreAppTargetFrameworkVersion)'">$(BundledNETCoreAppPackageVersion)</LatestNetCorePatchVersion>
    <!-- If not covered by the previous cases use the target framework version for the latest patch version -->
    <LatestNetCorePatchVersion Condition="'$(LatestNetCorePatchVersion)' == ''">$(_TargetFrameworkVersionWithoutV)</LatestNetCorePatchVersion>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetLatestRuntimePatch)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetLatestRuntimePatch Condition="'$(SelfContained)' == 'true' ">true</TargetLatestRuntimePatch>
    <TargetLatestRuntimePatch Condition="'$(SelfContained)' != 'true' ">false</TargetLatestRuntimePatch>
  </PropertyGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(RuntimeFrameworkVersion)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RuntimeFrameworkVersion Condition="'$(TargetLatestRuntimePatch)' == 'true' ">$(LatestNetCorePatchVersion)</RuntimeFrameworkVersion>
    <RuntimeFrameworkVersion Condition="'$(TargetLatestRuntimePatch)' != 'true' ">$(DefaultNetCorePatchVersion)</RuntimeFrameworkVersion>
  </PropertyGroup>
  <ItemGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(DisableImplicitFrameworkReferences)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- This property is different than MicrosoftNETPlatformLibrary.  MicrosoftNETPlatformLibrary is
         used to trim the dependencies published with a framework-dependent app, and is overridden
         by ASP.NET packages.
         
         ExpectedPlatformPackages is the list of packages that are actually implicitly
         referenced by the SDK, and is passed into the ResolvePackageAssets task
         to verify that the restored versions of the packages matches the expected versions
         -->
    <ExpectedPlatformPackages Include="Microsoft.NETCore.App" ExpectedVersion="$(RuntimeFrameworkVersion)" />
  </ItemGroup>
  <PropertyGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' And '$(DisableImplicitFrameworkReferences)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <VerifyMatchingImplicitPackageVersion Condition="'$(VerifyMatchingImplicitPackageVersion)' == ''">true</VerifyMatchingImplicitPackageVersion>
  </PropertyGroup>
  <!--
    Automatically add Link metadata to items of specific types if they are outside of the project folder and don't already have the Link metadata set.
    This will cause them to be shown in the Solution Explorer.  If an item has LinkBase metadata, the automatic Link will start with that value, and
    the items will appear in the Solution Explorer under the folder specified by LinkBase.
    -->
  <ItemGroup Condition="'$(SetLinkMetadataAutomatically)' != 'false'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Compile Update="@(Compile)">
      <!-- First, add a trailing slash to the LinkBase metadata if necessary.  This allows us to use the same value
           for the Link metadata whether or not LinkBase metadata is set: %(LinkBase)%(RecursiveDir)%(Filename)%(Extension) 
           
           Note that RecursiveDir already includes the trailing slash.
      -->
      <LinkBase Condition="'%(LinkBase)' != ''">$([MSBuild]::EnsureTrailingSlash(%(LinkBase)))</LinkBase>
      <!-- Set the Link metadata if it's not already set, if the item wasn't defined in a shared project,  and the item is outside of the project directory.
           Check whether the item was defined in a shared project by checking whether the extension of the defining project was .projitems.
           Check whether an item is inside the project directory by seeing if the FullPath starts with EnsureTrailingSlash(MSBuildProjectDirectory)
           The FullPath and the MSBuildProjectDirectory will both already be normalized full paths.
           The call to [MSBuild]::ValueOrDefault() is there in order to allow calling StartsWith on the FullPath value, since it's
           not possible to call a string method on a metadata item directly.  The intrinsic ValueOrDefault() will be more
           performant than calling String.Copy(), which has been used for this in other contexts, but actually makes a copy
           of the string data.
      -->
      <Link Condition="'%(Link)' == '' And '%(DefiningProjectExtension)' != '.projitems' And !$([MSBuild]::ValueOrDefault('%(FullPath)', '').StartsWith($([MSBuild]::EnsureTrailingSlash($(MSBuildProjectDirectory)))))">%(LinkBase)%(RecursiveDir)%(Filename)%(Extension)</Link>
    </Compile>
    <AdditionalFiles Update="@(AdditionalFiles)">
      <LinkBase Condition="'%(LinkBase)' != ''">$([MSBuild]::EnsureTrailingSlash(%(LinkBase)))</LinkBase>
      <Link Condition="'%(Link)' == '' And '%(DefiningProjectExtension)' != '.projitems' And !$([MSBuild]::ValueOrDefault('%(FullPath)', '').StartsWith($([MSBuild]::EnsureTrailingSlash($(MSBuildProjectDirectory)))))">%(LinkBase)%(RecursiveDir)%(Filename)%(Extension)</Link>
    </AdditionalFiles>
    <None Update="@(None)">
      <LinkBase Condition="'%(LinkBase)' != ''">$([MSBuild]::EnsureTrailingSlash(%(LinkBase)))</LinkBase>
      <Link Condition="'%(Link)' == '' And '%(DefiningProjectExtension)' != '.projitems' And !$([MSBuild]::ValueOrDefault('%(FullPath)', '').StartsWith($([MSBuild]::EnsureTrailingSlash($(MSBuildProjectDirectory)))))">%(LinkBase)%(RecursiveDir)%(Filename)%(Extension)</Link>
    </None>
    <Content Update="@(Content)">
      <LinkBase Condition="'%(LinkBase)' != ''">$([MSBuild]::EnsureTrailingSlash(%(LinkBase)))</LinkBase>
      <Link Condition="'%(Link)' == '' And '%(DefiningProjectExtension)' != '.projitems' And !$([MSBuild]::ValueOrDefault('%(FullPath)', '').StartsWith($([MSBuild]::EnsureTrailingSlash($(MSBuildProjectDirectory)))))">%(LinkBase)%(RecursiveDir)%(Filename)%(Extension)</Link>
    </Content>
    <EmbeddedResource Update="@(EmbeddedResource)">
      <LinkBase Condition="'%(LinkBase)' != ''">$([MSBuild]::EnsureTrailingSlash(%(LinkBase)))</LinkBase>
      <Link Condition="'%(Link)' == '' And '%(DefiningProjectExtension)' != '.projitems' And !$([MSBuild]::ValueOrDefault('%(FullPath)', '').StartsWith($([MSBuild]::EnsureTrailingSlash($(MSBuildProjectDirectory)))))">%(LinkBase)%(RecursiveDir)%(Filename)%(Extension)</Link>
    </EmbeddedResource>
  </ItemGroup>
  <UsingTask TaskName="CheckForImplicitPackageReferenceOverrides" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!-- Remove package references with metadata IsImplicitlyDefined = true, if there are other PackageReference items with the same identity -->
  <Target Name="CheckForImplicitPackageReferenceOverrides" BeforeTargets="_CheckForInvalidConfigurationAndPlatform;CollectPackageReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <ImplicitPackageReferenceInformationLink>https://aka.ms/sdkimplicitrefs</ImplicitPackageReferenceInformationLink>
    </PropertyGroup>
    <CheckForImplicitPackageReferenceOverrides PackageReferenceItems="@(PackageReference)" MoreInformationLink="$(ImplicitPackageReferenceInformationLink)">
      <Output TaskParameter="ItemsToRemove" ItemName="_PackageReferenceToRemove" />
    </CheckForImplicitPackageReferenceOverrides>
    <ItemGroup>
      <!-- Note that the condition here is important, otherwise the Remove will operate based just on item identity and remove all items
           that had duplicates, instead of leaving the ones without IsImplicitlyDefined set to true. -->
      <PackageReference Remove="@(_PackageReferenceToRemove)" Condition="'%(PackageReference.IsImplicitlyDefined)' == 'true' " />
    </ItemGroup>
    <!-- If any implicit package references were overridden, then don't check that RuntimeFrameworkVersion matches the package version -->
    <PropertyGroup Condition="'@(_PackageReferenceToRemove)' != ''">
      <VerifyMatchingImplicitPackageVersion>false</VerifyMatchingImplicitPackageVersion>
    </PropertyGroup>
  </Target>
  <UsingTask TaskName="CheckForDuplicateItems" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="CheckForDuplicateItems" BeforeTargets="_CheckForInvalidConfigurationAndPlatform;CoreCompile" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <DefaultItemsMoreInformationLink>https://aka.ms/sdkimplicititems</DefaultItemsMoreInformationLink>
      <!-- For the design-time build, we will continue on error and remove the duplicate items.
           This is because otherwise there won't be any references to pass to the compiler, leading to design-time
           compilation errors for every API that is used in the project.  Amidst all the compile errors, it would
           be easy to miss the duplicate items error which is the real source of the problem. -->
      <CheckForDuplicateItemsContinueOnError>false</CheckForDuplicateItemsContinueOnError>
      <CheckForDuplicateItemsContinueOnError Condition="'$(DesignTimeBuild)' == 'true'">ErrorAndContinue</CheckForDuplicateItemsContinueOnError>
    </PropertyGroup>
    <CheckForDuplicateItems Items="@(Compile)" ItemName="Compile" DefaultItemsEnabled="$(EnableDefaultItems)" DefaultItemsOfThisTypeEnabled="$(EnableDefaultCompileItems)" PropertyNameToDisableDefaultItems="EnableDefaultCompileItems" MoreInformationLink="$(DefaultItemsMoreInformationLink)" ContinueOnError="$(CheckForDuplicateItemsContinueOnError)">
      <Output TaskParameter="DeduplicatedItems" ItemName="DeduplicatedCompileItems" />
    </CheckForDuplicateItems>
    <CheckForDuplicateItems Items="@(EmbeddedResource)" ItemName="EmbeddedResource" DefaultItemsEnabled="$(EnableDefaultItems)" DefaultItemsOfThisTypeEnabled="$(EnableDefaultEmbeddedResourceItems)" PropertyNameToDisableDefaultItems="EnableDefaultEmbeddedResourceItems" MoreInformationLink="$(DefaultItemsMoreInformationLink)" ContinueOnError="$(CheckForDuplicateItemsContinueOnError)">
      <Output TaskParameter="DeduplicatedItems" ItemName="DeduplicatedEmbeddedResourceItems" />
    </CheckForDuplicateItems>
    <!-- Default content items are enabled by the Web SDK, not the .NET SDK, but we check it here for simplicity -->
    <CheckForDuplicateItems Items="@(Content)" ItemName="Content" DefaultItemsEnabled="$(EnableDefaultItems)" DefaultItemsOfThisTypeEnabled="$(EnableDefaultContentItems)" PropertyNameToDisableDefaultItems="EnableDefaultContentItems" MoreInformationLink="$(DefaultItemsMoreInformationLink)" ContinueOnError="$(CheckForDuplicateItemsContinueOnError)">
      <Output TaskParameter="DeduplicatedItems" ItemName="DeduplicatedContentItems" />
    </CheckForDuplicateItems>
    <ItemGroup Condition="'$(DesignTimeBuild)' == 'true' And '@(DeduplicatedCompileItems)' != ''">
      <Compile Remove="@(Compile)" />
      <Compile Include="@(DeduplicatedCompileItems)" />
    </ItemGroup>
    <ItemGroup Condition="'$(DesignTimeBuild)' == 'true' And '@(DeduplicatedEmbeddedResourceItems)' != ''">
      <EmbeddedResource Remove="@(EmbeddedResource)" />
      <EmbeddedResource Include="@(DeduplicatedEmbeddedResourceItems)" />
    </ItemGroup>
    <ItemGroup Condition="'$(DesignTimeBuild)' == 'true' And '@(DeduplicatedContentItems)' != ''">
      <Content Remove="@(Content)" />
      <Content Include="@(DeduplicatedContentItems)" />
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <UsingTask TaskName="GenerateDepsFile" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="GenerateRuntimeConfigurationFiles" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="GetAssemblyVersion" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="GenerateSatelliteAssemblies" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <DisableStandardFrameworkResolution Condition="'$(DisableStandardFrameworkResolution)' == ''">$(_IsNETCoreOrNETStandard)</DisableStandardFrameworkResolution>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateRuntimeConfigurationFiles Condition=" '$(GenerateRuntimeConfigurationFiles)' == '' and '$(TargetFrameworkIdentifier)' == '.NETCoreApp' and '$(HasRuntimeOutput)' == 'true' ">true</GenerateRuntimeConfigurationFiles>
    <UserRuntimeConfig Condition=" '$(UserRuntimeConfig)' == '' ">$(MSBuildProjectDirectory)/runtimeconfig.template.json</UserRuntimeConfig>
    <GenerateSatelliteAssembliesForCore Condition=" '$(GenerateSatelliteAssembliesForCore)' == '' and '$(MSBuildRuntimeType)' == 'Core' ">true</GenerateSatelliteAssembliesForCore>
    <ComputeNETCoreBuildOutputFiles Condition=" '$(ComputeNETCoreBuildOutputFiles)' == '' and '$(TargetFrameworkIdentifier)' == '.NETCoreApp'">true</ComputeNETCoreBuildOutputFiles>
  </PropertyGroup>
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateRuntimeConfigurationFilesInputs Include="$(ProjectAssetsFile)" />
    <GenerateRuntimeConfigurationFilesInputs Include="$(UserRuntimeConfig)" Condition=" Exists($(UserRuntimeConfig)) " />
  </ItemGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectDepsFileName Condition="'$(ProjectDepsFileName)' == ''">$(AssemblyName).deps.json</ProjectDepsFileName>
    <ProjectDepsFilePath Condition="'$(ProjectDepsFilePath)' == ''">$(TargetDir)$(ProjectDepsFileName)</ProjectDepsFilePath>
    <ProjectRuntimeConfigFileName Condition="'$(ProjectRuntimeConfigFileName)' == ''">$(AssemblyName).runtimeconfig.json</ProjectRuntimeConfigFileName>
    <ProjectRuntimeConfigFilePath Condition="'$(ProjectRuntimeConfigFilePath)' == ''">$(TargetDir)$(ProjectRuntimeConfigFileName)</ProjectRuntimeConfigFilePath>
    <ProjectRuntimeConfigDevFilePath Condition="'$(ProjectRuntimeConfigDevFilePath)' == ''">$(TargetDir)$(AssemblyName).runtimeconfig.dev.json</ProjectRuntimeConfigDevFilePath>
    <IncludeMainProjectInDepsFile Condition=" '$(IncludeMainProjectInDepsFile)' == '' ">true</IncludeMainProjectInDepsFile>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_NativeLibraryPrefix Condition="'$(_NativeLibraryPrefix)' == '' and !$(RuntimeIdentifier.StartsWith('win'))">lib</_NativeLibraryPrefix>
    <_NativeLibraryExtension Condition="'$(_NativeLibraryExtension)' == '' and $(RuntimeIdentifier.StartsWith('win'))">.dll</_NativeLibraryExtension>
    <_NativeLibraryExtension Condition="'$(_NativeLibraryExtension)' == '' and $(RuntimeIdentifier.StartsWith('osx'))">.dylib</_NativeLibraryExtension>
    <_NativeLibraryExtension Condition="'$(_NativeLibraryExtension)' == ''">.so</_NativeLibraryExtension>
    <_NativeExecutableExtension Condition="'$(_NativeExecutableExtension)' == '' and $(RuntimeIdentifier.StartsWith('win'))">.exe</_NativeExecutableExtension>
    <_DotNetHostExecutableName>dotnet$(_NativeExecutableExtension)</_DotNetHostExecutableName>
    <_DotNetAppHostExecutableName>apphost$(_NativeExecutableExtension)</_DotNetAppHostExecutableName>
    <_DotNetHostPolicyLibraryName>$(_NativeLibraryPrefix)hostpolicy$(_NativeLibraryExtension)</_DotNetHostPolicyLibraryName>
    <_DotNetHostFxrLibraryName>$(_NativeLibraryPrefix)hostfxr$(_NativeLibraryExtension)</_DotNetHostFxrLibraryName>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_DefaultUserProfileRuntimeStorePath>$(HOME)</_DefaultUserProfileRuntimeStorePath>
    <_DefaultUserProfileRuntimeStorePath Condition="'$(OS)' == 'Windows_NT'">$(USERPROFILE)</_DefaultUserProfileRuntimeStorePath>
    <_DefaultUserProfileRuntimeStorePath>$([System.IO.Path]::Combine($(_DefaultUserProfileRuntimeStorePath), '.dotnet', 'store'))</_DefaultUserProfileRuntimeStorePath>
    <UserProfileRuntimeStorePath Condition="'$(UserProfileRuntimeStorePath)' == ''">$(_DefaultUserProfileRuntimeStorePath)</UserProfileRuntimeStorePath>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CoreBuildDependsOn>
      $(CoreBuildDependsOn);
      GenerateBuildDependencyFile;
      GenerateBuildRuntimeConfigurationFiles
    </CoreBuildDependsOn>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CoreCleanDependsOn>
      _SdkBeforeClean
      $(CoreCleanDependsOn)
    </CoreCleanDependsOn>
  </PropertyGroup>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RebuildDependsOn>
      _SdkBeforeRebuild;
      $(RebuildDependsOn)
    </RebuildDependsOn>
  </PropertyGroup>
  <!--
    ============================================================
                                        GenerateBuildDependencyFile

    Generates the $(project).deps.json file during Build
    ============================================================
    -->
  <Target Name="GenerateBuildDependencyFile" DependsOnTargets="_DefaultMicrosoftNETPlatformLibrary;                             _HandlePackageFileConflicts;                             _ComputeReferenceAssemblies" BeforeTargets="CopyFilesToOutputDirectory" Condition=" '$(GenerateDependencyFile)' == 'true'" Inputs="$(ProjectAssetsFile);$(MSBuildAllProjects)" Outputs="$(ProjectDepsFilePath)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
    Explicitly not passing any ExcludeFromPublishPackageReferences information during 'Build', since these dependencies
    should be included during 'Build'.  They are only excluded on 'Publish'.
    -->
    <GenerateDepsFile ProjectPath="$(MSBuildProjectFullPath)" AssetsFilePath="$(ProjectAssetsFile)" DepsFilePath="$(ProjectDepsFilePath)" TargetFramework="$(TargetFrameworkMoniker)" AssemblyName="$(AssemblyName)" AssemblyExtension="$(TargetExt)" AssemblyVersion="$(Version)" AssemblySatelliteAssemblies="@(IntermediateSatelliteAssembliesWithTargetPath)" ReferencePaths="@(ReferencePath)" ReferenceDependencyPaths="@(ReferenceDependencyPaths)" ReferenceSatellitePaths="@(ReferenceSatellitePaths)" ReferenceAssemblies="@(_ReferenceAssemblies)" IncludeMainProject="$(IncludeMainProjectInDepsFile)" RuntimeIdentifier="$(RuntimeIdentifier)" PlatformLibraryName="$(MicrosoftNETPlatformLibrary)" FilesToSkip="@(_ConflictPackageFiles)" CompilerOptions="@(DependencyFileCompilerOptions)" IsSelfContained="$(SelfContained)" IncludeRuntimeFileVersions="$(IncludeFileVersionsInDependencyFile)" />
    <ItemGroup>
      <!-- Do this in an ItemGroup instead of as an output parameter of the GenerateDepsFile task so that it still gets added to the item set
           during incremental builds when the task is skipped -->
      <FileWrites Include="$(ProjectDepsFilePath)" Condition="Exists('$(ProjectDepsFilePath)')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GenerateBuildRuntimeConfigurationFiles

    Generates the $(project).runtimeconfig.json and $(project).runtimeconfig.dev.json files during Build
    ============================================================
    -->
  <Target Name="GenerateBuildRuntimeConfigurationFiles" DependsOnTargets="_DefaultMicrosoftNETPlatformLibrary" BeforeTargets="CopyFilesToOutputDirectory" Condition=" '$(GenerateRuntimeConfigurationFiles)' == 'true'" Inputs="@(GenerateRuntimeConfigurationFilesInputs)" Outputs="$(ProjectRuntimeConfigFilePath);$(ProjectRuntimeConfigDevFilePath)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateRuntimeConfigurationFiles AssetsFilePath="$(ProjectAssetsFile)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetFramework="$(TargetFramework)" RuntimeConfigPath="$(ProjectRuntimeConfigFilePath)" RuntimeConfigDevPath="$(ProjectRuntimeConfigDevFilePath)" RuntimeIdentifier="$(RuntimeIdentifier)" PlatformLibraryName="$(MicrosoftNETPlatformLibrary)" UserRuntimeConfig="$(UserRuntimeConfig)" HostConfigurationOptions="@(RuntimeHostConfigurationOption)" AdditionalProbingPaths="@(AdditionalProbingPath)" IsSelfContained="$(SelfContained)" />
    <ItemGroup>
      <!-- Do this in an ItemGroup instead of as an output parameter of the GenerateDepsFile task so that it still gets added to the item set
          during incremental builds when the task is skipped -->
      <FileWrites Include="$(ProjectRuntimeConfigFilePath)" Condition="Exists('$(ProjectRuntimeConfigFilePath)')" />
      <FileWrites Include="$(ProjectRuntimeConfigDevFilePath)" Condition="Exists('$(ProjectRuntimeConfigDevFilePath)')" />
    </ItemGroup>
  </Target>
  <!-- Add runtimeconfig.json file to BuiltProjectOutputGroupOutput, so that it will get included in the NuGet package by the Pack target -->
  <Target Name="AddRuntimeConfigFileToBuiltProjectOutputGroupOutput" Condition=" '$(GenerateRuntimeConfigurationFiles)' == 'true'" BeforeTargets="BuiltProjectOutputGroup" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <BuiltProjectOutputGroupOutput Include="$(ProjectRuntimeConfigFilePath)" FinalOutputPath="$(ProjectRuntimeConfigFilePath)" />
    </ItemGroup>
  </Target>
  <Target Name="_SdkBeforeClean" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition="'$(_CleaningWithoutRebuilding)' == ''">
      <_CleaningWithoutRebuilding>true</_CleaningWithoutRebuilding>
      <EmitAssetsLogMessages>false</EmitAssetsLogMessages>
    </PropertyGroup>
  </Target>
  <Target Name="_SdkBeforeRebuild" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_CleaningWithoutRebuilding>false</_CleaningWithoutRebuilding>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        DefaultRuntimeHostConfigurationOptions

    Defaults @(RuntimeHostConfigurationOption) items based on MSBuild properties.
    ============================================================
    -->
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RuntimeHostConfigurationOption Include="System.GC.Concurrent" Condition="'$(ConcurrentGarbageCollection)' != ''" Value="$(ConcurrentGarbageCollection)" />
    <RuntimeHostConfigurationOption Include="System.GC.Server" Condition="'$(ServerGarbageCollection)' != ''" Value="$(ServerGarbageCollection)" />
    <RuntimeHostConfigurationOption Include="System.GC.RetainVM" Condition="'$(RetainVMGarbageCollection)' != ''" Value="$(RetainVMGarbageCollection)" />
    <RuntimeHostConfigurationOption Include="System.Runtime.TieredCompilation" Condition="'$(TieredCompilation)' != ''" Value="$(TieredCompilation)" />
    <RuntimeHostConfigurationOption Include="System.Threading.ThreadPool.MinThreads" Condition="'$(ThreadPoolMinThreads)' != ''" Value="$(ThreadPoolMinThreads)" />
    <RuntimeHostConfigurationOption Include="System.Threading.ThreadPool.MaxThreads" Condition="'$(ThreadPoolMaxThreads)' != ''" Value="$(ThreadPoolMaxThreads)" />
    <RuntimeHostConfigurationOption Include="System.Globalization.Invariant" Condition="'$(InvariantGlobalization)' != ''" Value="$(InvariantGlobalization)" />
  </ItemGroup>
  <!--
    ============================================================
                                        DefaultAdditionalProbingPaths

    Adds the default @(AdditionalProbingPath) items.
    ============================================================
    -->
  <ItemGroup Condition="'$(GenerateRuntimeConfigurationFiles)' == 'true' and '$(SkipDefaultAdditionalProbingPaths)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Note: can't use Path.Combine here since `|` is an illegal path character -->
    <AdditionalProbingPath Include="$(UserProfileRuntimeStorePath)$([System.IO.Path]::DirectorySeparatorChar)|arch|$([System.IO.Path]::DirectorySeparatorChar)|tfm|" />
  </ItemGroup>
  <!--
    ============================================================
                                        _ComputeNETCoreBuildOutputFiles

    Computes any files that need to be copied to the build output folder for .NET Core.
    ============================================================
    -->
  <UsingTask TaskName="EmbedAppNameInHost" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="_ComputeNETCoreBuildOutputFiles" DependsOnTargets="ResolvePackageAssets" AfterTargets="ResolveReferences" BeforeTargets="AssignTargetPaths" Condition="'$(ComputeNETCoreBuildOutputFiles)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
    During "build" and "run" of .NET Core projects, the assemblies coming from NuGet packages
    are loaded from the NuGet cache. But, in order for a self-contained app to be runnable,
    it requires a host in the output directory to load the app.
    During "publish", all required assets are copied to the publish directory.
    -->
    <ItemGroup Condition="'$(SelfContained)' == 'true' and '$(RuntimeIdentifier)' != '' and '$(_IsExecutable)' == 'true'">
      <NativeNETCoreCopyLocalItems Include="@(NativeCopyLocalItems)" Condition="'%(NativeCopyLocalItems.FileName)%(NativeCopyLocalItems.Extension)' == '$(_DotNetHostPolicyLibraryName)' or                                               '%(NativeCopyLocalItems.FileName)%(NativeCopyLocalItems.Extension)' == '$(_DotNetHostFxrLibraryName)'" />
      <NativeRestoredAppHostNETCore Include="@(NativeCopyLocalItems)" Condition="'%(NativeCopyLocalItems.FileName)%(NativeCopyLocalItems.Extension)' == '$(_DotNetAppHostExecutableName)'" />
    </ItemGroup>
    <PropertyGroup Condition="'@(NativeRestoredAppHostNETCore)' != '' ">
      <AppHostDestinationDirectoryPath>$(BaseIntermediateOutputPath)\$(TargetFramework)\$(RuntimeIdentifier)\host</AppHostDestinationDirectoryPath>
    </PropertyGroup>
    <NETSdkError Condition="'@(NativeRestoredAppHostNETCore-&gt;Count())' &gt; 1" ResourceName="MultipleFilesResolved" FormatArguments="$(_DotNetAppHostExecutableName)" />
    <EmbedAppNameInHost AppHostSourcePath="@(NativeRestoredAppHostNETCore)" AppHostDestinationDirectoryPath="$(AppHostDestinationDirectoryPath)" AppBinaryName="$(AssemblyName)$(TargetExt)" Condition="'@(NativeRestoredAppHostNETCore)' != '' ">
      <Output TaskParameter="ModifiedAppHostPath" ItemName="NativeAppHostNETCore" />
    </EmbedAppNameInHost>
    <ItemGroup Condition="'@(NativeAppHostNETCore)' == '' ">
      <NativeAppHostNETCore Include="@(NativeCopyLocalItems)" Condition="'%(NativeCopyLocalItems.FileName)%(NativeCopyLocalItems.Extension)' == '$(_DotNetHostExecutableName)'" />
    </ItemGroup>
    <NETSdkError Condition="'@(NativeAppHostNETCore-&gt;Count())' &gt; 1" ResourceName="MultipleFilesResolved" FormatArguments="@(NativeAppHostNETCore)" />
    <ItemGroup Condition="'@(NativeAppHostNETCore)' != '' ">
      <NativeNETCoreCopyLocalItems Include="@(NativeAppHostNETCore)">
        <!-- Rename the host executable to the app's name -->
        <Link>$(AssemblyName)%(NativeAppHostNETCore.Extension)</Link>
      </NativeNETCoreCopyLocalItems>
    </ItemGroup>
    <ItemGroup Condition="'$(SelfContained)' == 'true' and '$(RuntimeIdentifier)' != '' and '$(_IsExecutable)' == 'true'">
      <AllNETCoreCopyLocalItems Include="@(NativeNETCoreCopyLocalItems)">
        <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
        <CopyToPublishDirectory>Never</CopyToPublishDirectory>
      </AllNETCoreCopyLocalItems>
    </ItemGroup>
    <ItemGroup>
      <!-- Use 'None' so we can rename files using the 'Link' metadata as necessary -->
      <None Include="@(AllNETCoreCopyLocalItems)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _ComputeReferenceAssemblies

    Computes references that are only used at compile-time.
    ============================================================
    -->
  <Target Name="_ComputeReferenceAssemblies" DependsOnTargets="ResolveAssemblyReferences" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_FrameworkReferenceAssemblies Include="@(ReferencePath)" Condition="%(ReferencePath.FrameworkFile) == 'true' or                                                 %(ReferencePath.ResolvedFrom) == 'ImplicitlyExpandDesignTimeFacades'" />
      <!--
      "ReferenceOnly" assemblies are assemblies that are only used at compile-time, and they can't be resolved
      by the normal compile-assembly resolvers at runtime:
      1. App local
      2. NuGet/Package layout
      3. ProgramFiles\Reference Assemblies
      These assemblies need to be copied to the 'refs' folder for both build and publish.
      -->
      <_ReferenceOnlyAssemblies Include="@(ReferencePath)" Exclude="@(_FrameworkReferenceAssemblies)" Condition="%(ReferencePath.CopyLocal) != 'true' and                                            %(ReferencePath.NuGetSourceType) == ''" />
      <_ReferenceAssemblies Include="@(_FrameworkReferenceAssemblies)" />
      <_ReferenceAssemblies Include="@(_ReferenceOnlyAssemblies)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        Run Information

    The ProcessStart information that can be used to run this project.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RunWorkingDirectory Condition="'$(RunWorkingDirectory)' == ''">$(StartWorkingDirectory)</RunWorkingDirectory>
  </PropertyGroup>
  <Choose xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <When Condition="'$(StartAction)' == 'Program'">
      <PropertyGroup>
        <RunCommand Condition="'$(RunCommand)' == ''">$(StartProgram)</RunCommand>
        <RunArguments Condition="'$(RunArguments)' == ''">$(StartArguments)</RunArguments>
      </PropertyGroup>
    </When>
    <When Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' and '$(_IsExecutable)' == 'true'">
      <PropertyGroup Condition="'$(SelfContained)' != 'true'">
        <!-- TODO: https://github.com/dotnet/sdk/issues/20 Need to get the DotNetHost path from MSBuild -->
        <RunCommand Condition="'$(RunCommand)' == ''">dotnet</RunCommand>
        <_NetCoreRunArguments>exec "$(TargetPath)"</_NetCoreRunArguments>
        <RunArguments Condition="'$(RunArguments)' == '' and '$(StartArguments)' != ''">$(_NetCoreRunArguments) $(StartArguments)</RunArguments>
        <RunArguments Condition="'$(RunArguments)' == ''">$(_NetCoreRunArguments)</RunArguments>
      </PropertyGroup>
      <PropertyGroup Condition="'$(SelfContained)' == 'true'">
        <RunCommand Condition="'$(RunCommand)' == ''">$(TargetDir)$(AssemblyName)$(_NativeExecutableExtension)</RunCommand>
        <RunArguments Condition="'$(RunArguments)' == ''">$(StartArguments)</RunArguments>
      </PropertyGroup>
    </When>
    <When Condition="'$(TargetFrameworkIdentifier)' == '.NETFramework' and '$(_IsExecutable)' == 'true'">
      <PropertyGroup>
        <RunCommand Condition="'$(RunCommand)' == ''">$(TargetPath)</RunCommand>
        <RunArguments Condition="'$(RunArguments)' == ''">$(StartArguments)</RunArguments>
      </PropertyGroup>
    </When>
  </Choose>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Ensure $(RunWorkingDirectory) is a full path -->
    <RunWorkingDirectory Condition="'$(RunWorkingDirectory)' != '' and '$([System.IO.Path]::IsPathRooted($(RunWorkingDirectory)))' != 'true'">$([System.IO.Path]::GetFullPath($([System.IO.Path]::Combine('$(MSBuildProjectDirectory)', '$(RunWorkingDirectory)'))))</RunWorkingDirectory>
  </PropertyGroup>
  <!--
    ============================================================
                    CoreGenerateSatelliteAssemblies
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <CreateSatelliteAssembliesDependsOn>
      $(CreateSatelliteAssembliesDependsOn);
      CoreGenerateSatelliteAssemblies
    </CreateSatelliteAssembliesDependsOn>
  </PropertyGroup>
  <UsingTask TaskName="GetAssemblyAttributes" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="CoreGenerateSatelliteAssemblies" DependsOnTargets="ResolveAssemblyReferences;_GetAssemblyInfoFromTemplateFile" Inputs="$(MSBuildAllProjects);@(_SatelliteAssemblyResourceInputs);$(IntermediateOutputPath)$(TargetName)$(TargetExt)" Outputs="$(IntermediateOutputPath)%(Culture)\$(TargetName).resources.dll" Condition="'@(_SatelliteAssemblyResourceInputs)' != ''  and '$(GenerateSatelliteAssembliesForCore)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MakeDir Directories="@(_SatelliteAssemblyResourceInputs->'$(IntermediateOutputPath)%(Culture)')" />
    <PropertyGroup>
      <_AssemblyInfoFile>$(IntermediateOutputPath)%(_SatelliteAssemblyResourceInputs.Culture)\$(TargetName).resources.cs</_AssemblyInfoFile>
      <_OutputAssembly>$(IntermediateOutputPath)%(_SatelliteAssemblyResourceInputs.Culture)\$(TargetName).resources.dll</_OutputAssembly>
    </PropertyGroup>
    <ItemGroup>
      <SatelliteAssemblyAttribute Include="System.Reflection.AssemblyCultureAttribute" Condition="'%(_SatelliteAssemblyResourceInputs.Culture)' != ''">
        <_Parameter1>%(_SatelliteAssemblyResourceInputs.Culture)</_Parameter1>
      </SatelliteAssemblyAttribute>
    </ItemGroup>
    <WriteCodeFragment AssemblyAttributes="@(SatelliteAssemblyAttribute)" Language="C#" OutputFile="$(_AssemblyInfoFile)">
      <Output TaskParameter="OutputFile" ItemName="FileWrites" />
    </WriteCodeFragment>
    <PropertyGroup Condition="'$(UseSharedCompilation)' == ''">
      <UseSharedCompilation>true</UseSharedCompilation>
    </PropertyGroup>
    <Csc Resources="@(_SatelliteAssemblyResourceInputs)" Sources="$(_AssemblyInfoFile)" OutputAssembly="$(_OutputAssembly)" References="@(ReferencePath)" KeyContainer="$(KeyContainerName)" KeyFile="$(KeyOriginatorFile)" NoConfig="true" NoLogo="$(NoLogo)" NoStandardLib="$(NoCompilerStandardLib)" PublicSign="$(PublicSign)" DelaySign="$(DelaySign)" Deterministic="$(Deterministic)" DisabledWarnings="$(DisabledWarnings)" WarningLevel="$(WarningLevel)" WarningsAsErrors="$(WarningsAsErrors)" WarningsNotAsErrors="$(WarningsNotAsErrors)" TargetType="Library" ToolExe="$(CscToolExe)" ToolPath="$(CscToolPath)" UseSharedCompilation="$(UseSharedCompilation)">
      <Output TaskParameter="OutputAssembly" ItemName="FileWrites" />
    </Csc>
  </Target>
  <Target Name="_GetAssemblyInfoFromTemplateFile" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetAssemblyAttributes PathToTemplateFile="$(IntermediateOutputPath)$(TargetName)$(TargetExt)">
      <Output TaskParameter="AssemblyAttributes" ItemName="_AssemblyAttributesFromTemplateFile" />
    </GetAssemblyAttributes>
    <ItemGroup>
      <SatelliteAssemblyAttribute Include="@(_AssemblyAttributesFromTemplateFile)" />
    </ItemGroup>
  </Target>
  <!--
  ============================================================
                           _DefaultMicrosoftNETPlatformLibrary

  .NET Core apps can have shared frameworks that are pre-installed on the target machine, thus the app is "portable"
  to any machine that already has the shared framework installed. In order to enable this, a "platform" library
  has to be declared. The platform library and its dependencies will be excluded from the runtime assemblies.
  ============================================================
  -->
  <Target Name="_DefaultMicrosoftNETPlatformLibrary" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition="'$(MicrosoftNETPlatformLibrary)' == ''">
      <MicrosoftNETPlatformLibrary Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp'">Microsoft.NETCore.App</MicrosoftNETPlatformLibrary>
    </PropertyGroup>
  </Target>
  <!--
  ============================================================
                                      GetAllRuntimeIdentifiers
  ============================================================
  -->
  <Target Name="GetAllRuntimeIdentifiers" Returns="$(RuntimeIdentifiers);$(RuntimeIdentifier)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
  ============================================================
                                      InjectTargetPathMetadata

  Update TargetPathWithTargetPlatformMoniker with target framework
  identifier and version metadata.  This is so that the
  ImplicitlyExpandNETStandardFacades target can determine if a
  referenced project needs the .NET Standard facades even if
  the project hasn't been compiled to disk yet.

  See https://github.com/dotnet/sdk/issues/1403 for more context
  ============================================================
  -->
  <ItemDefinitionGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <TargetPathWithTargetPlatformMoniker>
      <TargetFrameworkIdentifier>$(TargetFrameworkIdentifier)</TargetFrameworkIdentifier>
      <TargetFrameworkVersion>$(_TargetFrameworkVersionWithoutV)</TargetFrameworkVersion>
    </TargetPathWithTargetPlatformMoniker>
  </ItemDefinitionGroup>
  <!--
  ============================================================
                                         Project Capabilities
  ============================================================
  -->
  <ItemGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp' and '$(_IsExecutable)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectCapability Include="CrossPlatformExecutable" />
  </ItemGroup>
  <!-- Reference Manager capabilities -->
  <ItemGroup Condition="'$(TargetFrameworkIdentifier)' == '.NETCoreApp'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectCapability Remove="ReferenceManagerAssemblies" />
    <ProjectCapability Remove="ReferenceManagerCOM" />
  </ItemGroup>
  <!-- Publish capabilities -->
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectCapability Include="FolderPublish" />
  </ItemGroup>
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.DisableStandardFrameworkResolution.targets" Condition="'$(DisableStandardFrameworkResolution)' == 'true'">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.DisableStandardFrameworkResolution.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.DisableStandardFrameworkResolution.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <Target Name="GetReferenceAssemblyPaths" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="GetFrameworkPaths" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <_TargetFrameworkDirectories />
    <FrameworkPathOverride />
    <TargetFrameworkDirectory />
    <!-- all references (even the StdLib) come from packages -->
    <NoStdLib>true</NoStdLib>
  </PropertyGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.GenerateAssemblyInfo.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.GenerateAssemblyInfo.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.GenerateAssemblyInfo.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!--
    ============================================================
                                     GenerateAssemblyInfo

    Generates assembly info source to intermediate directory
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <GeneratedAssemblyInfoFile Condition="'$(GeneratedAssemblyInfoFile)' ==''">$(IntermediateOutputPath)$(MSBuildProjectName).AssemblyInfo$(DefaultLanguageSourceExtension)</GeneratedAssemblyInfoFile>
    <GenerateAssemblyInfo Condition="'$(GenerateAssemblyInfo)' == ''">true</GenerateAssemblyInfo>
  </PropertyGroup>
  <PropertyGroup Condition="'$(GenerateAssemblyInfo)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateAssemblyCompanyAttribute Condition="'$(GenerateAssemblyCompanyAttribute)' == ''">true</GenerateAssemblyCompanyAttribute>
    <GenerateAssemblyConfigurationAttribute Condition="'$(GenerateAssemblyConfigurationAttribute)' == ''">true</GenerateAssemblyConfigurationAttribute>
    <GenerateAssemblyCopyrightAttribute Condition="'$(GenerateAssemblyCopyrightAttribute)' == ''">true</GenerateAssemblyCopyrightAttribute>
    <GenerateAssemblyDescriptionAttribute Condition="'$(GenerateAssemblyDescriptionAttribute)' == ''">true</GenerateAssemblyDescriptionAttribute>
    <GenerateAssemblyFileVersionAttribute Condition="'$(GenerateAssemblyFileVersionAttribute)' == ''">true</GenerateAssemblyFileVersionAttribute>
    <GenerateAssemblyInformationalVersionAttribute Condition="'$(GenerateAssemblyInformationalVersionAttribute)' == ''">true</GenerateAssemblyInformationalVersionAttribute>
    <GenerateAssemblyProductAttribute Condition="'$(GenerateAssemblyProductAttribute)' == ''">true</GenerateAssemblyProductAttribute>
    <GenerateAssemblyTitleAttribute Condition="'$(GenerateAssemblyTitleAttribute)' == ''">true</GenerateAssemblyTitleAttribute>
    <GenerateAssemblyVersionAttribute Condition="'$(GenerateAssemblyVersionAttribute)' == ''">true</GenerateAssemblyVersionAttribute>
    <GenerateNeutralResourcesLanguageAttribute Condition="'$(GenerateNeutralResourcesLanguageAttribute)' == ''">true</GenerateNeutralResourcesLanguageAttribute>
    <IncludeSourceRevisionInInformationalVersion Condition="'$(IncludeSourceRevisionInInformationalVersion)' == ''">true</IncludeSourceRevisionInInformationalVersion>
  </PropertyGroup>
  <!-- 
    Note that this must run before every invocation of CoreCompile to ensure that all compiler
    runs see the generated assembly info. There is at least one scenario involving Xaml 
    where CoreCompile is invoked without other potential hooks such as Compile or CoreBuild,
    etc., so we hook directly on to CoreCompile. Furthermore, we  must run *after* 
    PrepareForBuild to ensure that the intermediate directory has been created.
   -->
  <Target Name="GenerateAssemblyInfo" BeforeTargets="CoreCompile" DependsOnTargets="PrepareForBuild;CoreGenerateAssemblyInfo" Condition="'$(GenerateAssemblyInfo)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="AddSourceRevisionToInformationalVersion" DependsOnTargets="GetAssemblyVersion;InitializeSourceControlInformation" Condition="'$(SourceControlInformationFeatureSupported)' == 'true' and '$(IncludeSourceRevisionInInformationalVersion)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition="'$(SourceRevisionId)' != ''">
      <!-- Follow SemVer 2.0 rules -->
      <_InformationalVersionContainsPlus>false</_InformationalVersionContainsPlus>
      <_InformationalVersionContainsPlus Condition="$(InformationalVersion.Contains('+'))">true</_InformationalVersionContainsPlus>
      <InformationalVersion Condition="!$(_InformationalVersionContainsPlus)">$(InformationalVersion)+$(SourceRevisionId)</InformationalVersion>
      <InformationalVersion Condition="$(_InformationalVersionContainsPlus)">$(InformationalVersion).$(SourceRevisionId)</InformationalVersion>
    </PropertyGroup>
  </Target>
  <Target Name="GetAssemblyAttributes" DependsOnTargets="GetAssemblyVersion;AddSourceRevisionToInformationalVersion" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <AssemblyAttribute Include="System.Reflection.AssemblyCompanyAttribute" Condition="'$(Company)' != '' and '$(GenerateAssemblyCompanyAttribute)' == 'true'">
        <_Parameter1>$(Company)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyConfigurationAttribute" Condition="'$(Configuration)' != '' and '$(GenerateAssemblyConfigurationAttribute)' == 'true'">
        <_Parameter1>$(Configuration)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyCopyrightAttribute" Condition="'$(Copyright)' != '' and '$(GenerateAssemblyCopyrightAttribute)' == 'true'">
        <_Parameter1>$(Copyright)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyDescriptionAttribute" Condition="'$(Description)' != '' and '$(GenerateAssemblyDescriptionAttribute)' == 'true'">
        <_Parameter1>$(Description)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyFileVersionAttribute" Condition="'$(FileVersion)' != '' and '$(GenerateAssemblyFileVersionAttribute)' == 'true'">
        <_Parameter1>$(FileVersion)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyInformationalVersionAttribute" Condition="'$(InformationalVersion)' != '' and '$(GenerateAssemblyInformationalVersionAttribute)' == 'true'">
        <_Parameter1>$(InformationalVersion)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyProductAttribute" Condition="'$(Product)' != '' and '$(GenerateAssemblyProductAttribute)' == 'true'">
        <_Parameter1>$(Product)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyTitleAttribute" Condition="'$(AssemblyTitle)' != '' and '$(GenerateAssemblyTitleAttribute)' == 'true'">
        <_Parameter1>$(AssemblyTitle)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Reflection.AssemblyVersionAttribute" Condition="'$(AssemblyVersion)' != '' and '$(GenerateAssemblyVersionAttribute)' == 'true'">
        <_Parameter1>$(AssemblyVersion)</_Parameter1>
      </AssemblyAttribute>
      <AssemblyAttribute Include="System.Resources.NeutralResourcesLanguageAttribute" Condition="'$(NeutralLanguage)' != '' and '$(GenerateNeutralResourcesLanguageAttribute)' == 'true'">
        <_Parameter1>$(NeutralLanguage)</_Parameter1>
      </AssemblyAttribute>
    </ItemGroup>
  </Target>
  <!-- 
    To allow version changes to be respected on incremental builds (e.g. through CLI parameters),
    create a hash of all assembly attributes so that the cache file will change with the calculated
    assembly attribute values and msbuild will then execute CoreGenerateAssembly to generate a new file.
  -->
  <Target Name="CreateGeneratedAssemblyInfoInputsCacheFile" DependsOnTargets="GetAssemblyAttributes" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <GeneratedAssemblyInfoInputsCacheFile>$(IntermediateOutputPath)$(MSBuildProjectName).AssemblyInfoInputs.cache</GeneratedAssemblyInfoInputsCacheFile>
    </PropertyGroup>
    <!-- We only use up to _Parameter1 for most attributes, but other targets may add additional assembly attributes with multiple parameters. -->
    <Hash ItemsToHash="@(AssemblyAttribute->'%(Identity)%(_Parameter1)%(_Parameter2)%(_Parameter3)%(_Parameter4)%(_Parameter5)%(_Parameter6)%(_Parameter7)%(_Parameter8)')">
      <Output TaskParameter="HashResult" PropertyName="_AssemblyAttributesHash" />
    </Hash>
    <WriteLinesToFile Lines="$(_AssemblyAttributesHash)" File="$(GeneratedAssemblyInfoInputsCacheFile)" Overwrite="True" WriteOnlyWhenDifferent="True" />
    <ItemGroup>
      <FileWrites Include="$(GeneratedAssemblyInfoInputsCacheFile)" />
    </ItemGroup>
  </Target>
  <Target Name="CoreGenerateAssemblyInfo" Condition="'$(Language)'=='VB' or '$(Language)'=='C#'" DependsOnTargets="CreateGeneratedAssemblyInfoInputsCacheFile" Inputs="$(GeneratedAssemblyInfoInputsCacheFile)" Outputs="$(GeneratedAssemblyInfoFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <!-- Ensure the generated assemblyinfo file is not already part of the Compile sources, as a workaround for https://github.com/dotnet/sdk/issues/114 -->
      <Compile Remove="$(GeneratedAssemblyInfoFile)" />
    </ItemGroup>
    <WriteCodeFragment AssemblyAttributes="@(AssemblyAttribute)" Language="$(Language)" OutputFile="$(GeneratedAssemblyInfoFile)">
      <Output TaskParameter="OutputFile" ItemName="Compile" />
      <Output TaskParameter="OutputFile" ItemName="FileWrites" />
    </WriteCodeFragment>
  </Target>
  <!--
    ==================================================================
                                            GetAssemblyVersion

    Parses the nuget package version set in $(Version) and returns
    the implied $(AssemblyVersion) and $(FileVersion).

    e.g.:
        <Version>1.2.3-beta.4</Version>

    implies:
        <AssemblyVersion>1.2.3</AssemblyVersion>
        <FileVersion>1.2.3</FileVersion>

    Note that if $(AssemblyVersion) or $(FileVersion) are are already set, it
    is considered an override of the default inference from $(Version) and they
    are left unchanged by this target.
    ==================================================================
  -->
  <Target Name="GetAssemblyVersion" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GetAssemblyVersion Condition="'$(AssemblyVersion)' == ''" NuGetVersion="$(Version)">
      <Output TaskParameter="AssemblyVersion" PropertyName="AssemblyVersion" />
    </GetAssemblyVersion>
    <PropertyGroup>
      <FileVersion Condition="'$(FileVersion)' == ''">$(AssemblyVersion)</FileVersion>
      <InformationalVersion Condition="'$(InformationalVersion)' == ''">$(Version)</InformationalVersion>
    </PropertyGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.ComposeStore.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.ComposeStore.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.ComposeStore.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <!--
    ============================================================
                                        ComposeStore
 
    The main store entry point.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <Target Name="ComposeStore" DependsOnTargets="PrepareForComposeStore;                             PrepOptimizer;                             StoreWorkerMain;                             _CopyResolvedUnOptimizedFiles;                             StoreFinalizer;" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        StoreWorkerMain

   Processes the store project files
    ============================================================
    -->
  <Target Name="StoreWorkerMain" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_AllProjects Include="$(AdditionalProjects.Split('%3B'))" />
      <_AllProjects Include="$(MSBuildProjectFullPath)" />
    </ItemGroup>
    <MSBuild Projects="%(_AllProjects.Identity)" Targets="StoreWorkerMapper" BuildinParallel="$(BuildinParallel)" Properties="ComposeWorkingDir=$(ComposeWorkingDir);                              PublishDir=$(PublishDir);                              StoreStagingDir=$(StoreStagingDir);                              TargetFramework=$(_TFM);                              JitPath=$(JitPath);                              Crossgen=$(Crossgen);                              DisableImplicitFrameworkReferences=true;                              SkipUnchangedFiles=$(SkipUnchangedFiles);                              PreserveStoreLayout=$(PreserveStoreLayout);                              CreateProfilingSymbols=$(CreateProfilingSymbols);                              StoreSymbolsStagingDir=$(StoreSymbolsStagingDir)" ContinueOnError="WarnAndContinue">
      <Output ItemName="AllResolvedPackagesPublished" TaskParameter="TargetOutputs" />
    </MSBuild>
  </Target>
  <!--
    ============================================================
                                        StoreWorkerMapper

   Processes each package specified in a store project file
    ============================================================
    -->
  <Target Name="StoreWorkerMapper" Returns="@(ResolvedPackagesFromMapper)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <PackageReferencesToStore Include="$(MSBuildProjectFullPath)">
        <AdditionalProperties>
          StorePackageName=%(PackageReference.Identity);
          StorePackageVersion=%(PackageReference.Version);
          ComposeWorkingDir=$(ComposeWorkingDir);
          PublishDir=$(PublishDir);
          StoreStagingDir=$(StoreStagingDir);
          TargetFramework=$(TargetFramework);
          RuntimeIdentifier=$(RuntimeIdentifier);
          JitPath=$(JitPath);
          Crossgen=$(Crossgen);
          SkipUnchangedFiles=$(SkipUnchangedFiles);
          PreserveStoreLayout=$(PreserveStoreLayout);
          CreateProfilingSymbols=$(CreateProfilingSymbols);
          StoreSymbolsStagingDir=$(StoreSymbolsStagingDir);
          DisableImplicitFrameworkReferences=false;
        </AdditionalProperties>
      </PackageReferencesToStore>
    </ItemGroup>
    <!-- Restore phase -->
    <MSBuild Projects="@(PackageReferencesToStore)" Targets="RestoreForComposeStore" BuildInParallel="$(BuildInParallel)" ContinueOnError="WarnAndContinue" />
    <!-- Resolve phase-->
    <MSBuild Projects="@(PackageReferencesToStore)" Targets="StoreResolver" Properties="MSBuildProjectExtensionsPath=$(ComposeWorkingDir)\%(PackageReference.Identity)_$([System.String]::Copy('%(PackageReference.Version)').Replace('*','-'))\;" BuildInParallel="$(BuildInParallel)" ContinueOnError="WarnAndContinue">
      <Output ItemName="ResolvedPackagesFromMapper" TaskParameter="TargetOutputs" />
    </MSBuild>
  </Target>
  <Target Name="StoreResolver" Returns="@(ResolvedPackagesPublished)" DependsOnTargets="PrepforRestoreForComposeStore;                             StoreWorkerPerformWork" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="StoreWorkerPerformWork" DependsOnTargets="ComputeAndCopyFilesToStoreDirectory;" Condition="Exists($(StoreWorkerWorkingDir))" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        StoreFinalizer

   Cleans up and produces artifacts after completion of store
    ============================================================
    -->
  <UsingTask TaskName="RemoveDuplicatePackageReferences" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="StoreFinalizer" DependsOnTargets="StoreWorkerMain;                             _CopyResolvedOptimizedFiles" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <RemoveDuplicatePackageReferences InputPackageReferences="@(AllResolvedPackagesPublished)">
      <Output TaskParameter="UniquePackageReferences" ItemName="AllResolvedPackagesPublishedAfterFilter" />
    </RemoveDuplicatePackageReferences>
    <ItemGroup>
      <ListOfPackageReference Include="@(AllResolvedPackagesPublishedAfterFilter -> '%20%20&lt;Package Id=&quot;%(Identity)&quot; Version=&quot;%(Version)&quot; /&gt;')" />
    </ItemGroup>
    <PropertyGroup>
      <_StoreArtifactContent><![CDATA[
<StoreArtifacts>
@(ListOfPackageReference)
</StoreArtifacts>
]]></_StoreArtifactContent>
    </PropertyGroup>
    <WriteLinesToFile File="$(StoreArtifactXml)" Lines="$(_StoreArtifactContent)" Overwrite="true" />
    <Message Text="Files were composed in $(PublishDir)" Importance="high" />
    <Message Text="The list of packages stored is in $(StoreArtifactXml) " Importance="high" />
    <RemoveDir Condition="'$(PreserveComposeWorkingDir)' != 'true'" Directories="$(ComposeWorkingDir)" ContinueOnError="WarnAndContinue" />
  </Target>
  <!--
    ============================================================
                                        _CopyResolvedUnOptimizedFiles

    Copy OptimizedResolvedFileToPublish items to the publish directory.
    ============================================================
    -->
  <Target Name="_CopyResolvedOptimizedFiles" DependsOnTargets="StoreWorkerMain;" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_OptimizedResolvedFileToPublish Include="$(StoreStagingDir)\**\*.*" />
      <_OptimizedSymbolFileToPublish Include="$(StoreSymbolsStagingDir)\**\*.*" />
    </ItemGroup>
    <Copy SourceFiles="@(_OptimizedResolvedFileToPublish)" DestinationFolder="$(PublishDir)%(RecursiveDir)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" Condition="'@(_OptimizedResolvedFileToPublish)' != ''" SkipUnchangedFiles="$(SkipUnchangedFiles)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <Copy SourceFiles="@(_OptimizedSymbolFileToPublish)" DestinationFolder="$(ProfilingSymbolsDir)%(RecursiveDir)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" Condition="'@(_OptimizedSymbolFileToPublish)' != ''" SkipUnchangedFiles="$(SkipUnchangedFiles)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        PrepareForComposeStore

    Prepare the prerequisites for ComposeStore.
    ============================================================
    -->
  <Target Name="PrepareForComposeStore" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <PreserveStoreLayout Condition="'$(PreserveStoreLayout)' == ''">true</PreserveStoreLayout>
      <SkipOptimization Condition="'$(RuntimeIdentifier)' == ''">true</SkipOptimization>
      <_TFM Condition="'$(_TFM)' == ''">$(TargetFramework)</_TFM>
      <SkipUnchangedFiles Condition="'$(SkipUnchangedFiles)' == ''">true</SkipUnchangedFiles>
    </PropertyGroup>
    <NETSdkError Condition="'2.0' &gt; '$(_TargetFrameworkVersionWithoutV)'" ResourceName="NU1008" FormatArguments="$(TargetFrameworkMoniker)" />
    <NETSdkError Condition="'$(RuntimeIdentifier)' =='' and '$(_PureManagedAssets)' == ''" ResourceName="RuntimeIdentifierWasNotSpecified" />
    <NETSdkError Condition="'$(_TFM)' ==''" ResourceName="AtLeastOneTargetFrameworkMustBeSpecified" />
    <PropertyGroup>
      <DefaultComposeDir>$(UserProfileRuntimeStorePath)</DefaultComposeDir>
      <_ProfilingSymbolsDirectoryName>symbols</_ProfilingSymbolsDirectoryName>
      <DefaultProfilingSymbolsDir>$([System.IO.Path]::Combine($(DefaultComposeDir), $(_ProfilingSymbolsDirectoryName)))</DefaultProfilingSymbolsDir>
      <ProfilingSymbolsDir Condition="'$(ProfilingSymbolsDir)' == '' and '$(ComposeDir)' != ''">$([System.IO.Path]::Combine($(ComposeDir), $(_ProfilingSymbolsDirectoryName)))</ProfilingSymbolsDir>
      <ProfilingSymbolsDir Condition="'$(ProfilingSymbolsDir)' != '' and '$(DoNotDecorateComposeDir)' != 'true'">$([System.IO.Path]::Combine($(ProfilingSymbolsDir), $(PlatformTarget)))</ProfilingSymbolsDir>
      <ProfilingSymbolsDir Condition="'$(ProfilingSymbolsDir)' == ''">$(DefaultProfilingSymbolsDir)</ProfilingSymbolsDir>
      <ProfilingSymbolsDir Condition="'$(DoNotDecorateComposeDir)' != 'true'">$([System.IO.Path]::Combine($(ProfilingSymbolsDir), $(_TFM)))</ProfilingSymbolsDir>
      <ProfilingSymbolsDir Condition="!HasTrailingSlash('$(ProfilingSymbolsDir)')">$(ProfilingSymbolsDir)\</ProfilingSymbolsDir>
      <ComposeDir Condition="'$(ComposeDir)' == ''">$(DefaultComposeDir)</ComposeDir>
      <ComposeDir Condition="'$(DoNotDecorateComposeDir)' != 'true'">$([System.IO.Path]::Combine($(ComposeDir), $(PlatformTarget)))</ComposeDir>
      <ComposeDir Condition="'$(DoNotDecorateComposeDir)' != 'true'">$([System.IO.Path]::Combine($(ComposeDir), $(_TFM)))</ComposeDir>
      <StoreArtifactXml>$([System.IO.Path]::Combine($(ComposeDir),"artifact.xml"))</StoreArtifactXml>
      <PublishDir>$([System.IO.Path]::GetFullPath($(ComposeDir)))</PublishDir>
      <_RandomFileName>$([System.IO.Path]::GetRandomFileName())</_RandomFileName>
      <TEMP Condition="'$(TEMP)' == ''">$([System.IO.Path]::GetTempPath())</TEMP>
      <ComposeWorkingDir Condition="'$(ComposeWorkingDir)' == ''">$([System.IO.Path]::Combine($(TEMP), $(_RandomFileName)))</ComposeWorkingDir>
      <ComposeWorkingDir>$([System.IO.Path]::GetFullPath($(ComposeWorkingDir)))</ComposeWorkingDir>
      <StoreStagingDir>$([System.IO.Path]::Combine($(ComposeWorkingDir),"StagingDir"))</StoreStagingDir>
      <!-- Will contain optimized managed assemblies in nuget cache layout -->
      <StoreSymbolsStagingDir>$([System.IO.Path]::Combine($(ComposeWorkingDir),"SymbolsStagingDir"))</StoreSymbolsStagingDir>
      <!-- Ensure any PublishDir has a trailing slash, so it can be concatenated -->
      <PublishDir Condition="!HasTrailingSlash('$(PublishDir)')">$(PublishDir)\</PublishDir>
    </PropertyGroup>
    <PropertyGroup Condition="'$(CreateProfilingSymbols)' == ''">
      <!-- There is no support for profiling symbols on OSX -->
      <CreateProfilingSymbols Condition="$(RuntimeIdentifier.StartsWith('osx'))">false</CreateProfilingSymbols>
      <CreateProfilingSymbols Condition="'$(CreateProfilingSymbols)' == ''">true</CreateProfilingSymbols>
    </PropertyGroup>
    <NETSdkError Condition="Exists($(ComposeWorkingDir))" ResourceName="FolderAlreadyExists" FormatArguments="$(ComposeWorkingDir)" />
    <MakeDir Directories="$(PublishDir)" />
    <MakeDir Directories="$(StoreStagingDir)" />
  </Target>
  <Target Name="PrepforRestoreForComposeStore" DependsOnTargets="_DefaultMicrosoftNETPlatformLibrary" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <StorePackageVersionForFolderName>$(StorePackageVersion.Replace('*','-'))</StorePackageVersionForFolderName>
      <StoreWorkerWorkingDir>$([System.IO.Path]::Combine($(ComposeWorkingDir),"$(StorePackageName)_$(StorePackageVersionForFolderName)"))</StoreWorkerWorkingDir>
      <_PackageProjFile>$([System.IO.Path]::Combine($(StoreWorkerWorkingDir), "Restore.csproj"))</_PackageProjFile>
      <BaseIntermediateOutputPath>$(StoreWorkerWorkingDir)\</BaseIntermediateOutputPath>
      <ProjectAssetsFile>$(BaseIntermediateOutputPath)\project.assets.json</ProjectAssetsFile>
    </PropertyGroup>
    <PropertyGroup>
      <PackagesToPrune>$(MicrosoftNETPlatformLibrary)</PackagesToPrune>
      <SelfContained Condition="'$(SelfContained)' == ''">true</SelfContained>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        RestoreForComposeStore

    Restores the package
    ============================================================
    -->
  <Target Name="RestoreForComposeStore" DependsOnTargets="PrepforRestoreForComposeStore;" Condition="!Exists($(StoreWorkerWorkingDir))" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MakeDir Directories="$(StoreWorkerWorkingDir)" />
    <MSBuild Projects="$(MSBuildProjectFullPath)" Targets="Restore" Properties="RestoreGraphProjectInput=$(MSBuildProjectFullPath);                              RestoreOutputPath=$(BaseIntermediateOutputPath);                              StorePackageName=$(StorePackageName);                              StorePackageVersion=$(StorePackageVersion);                              RuntimeIdentifier=$(RuntimeIdentifier);                              TargetFramework=$(TargetFramework);" />
  </Target>
  <!--
    ============================================================
                                        ComputeAndCopyFilesToStoreDirectory

    Computes the list of all files to copy to the publish directory and then publishes them.
    ============================================================
    -->
  <Target Name="ComputeAndCopyFilesToStoreDirectory" DependsOnTargets="ComputeFilesToStore;                             CopyFilesToStoreDirectory" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        CopyFilesToStoreDirectory

    Copy all build outputs, satellites and other necessary files to the publish directory.
    ============================================================
    -->
  <Target Name="CopyFilesToStoreDirectory" DependsOnTargets="_CopyResolvedUnOptimizedFiles" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _CopyResolvedUnOptimizedFiles

    Copy _UnOptimizedResolvedFileToPublish items to the publish directory.
    ============================================================
    -->
  <Target Name="_CopyResolvedUnOptimizedFiles" DependsOnTargets="_ComputeResolvedFilesToStoreTypes;                             _RunOptimizer" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Copy SourceFiles="@(_UnOptimizedResolvedFileToPublish)" DestinationFiles="$(PublishDir)%(_UnOptimizedResolvedFileToPublish.DestinationSubPath)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" SkipUnchangedFiles="$(SkipUnchangedFiles)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        _ComputeResolvedFilesToStoreTypes
    ============================================================
    -->
  <Target Name="_ComputeResolvedFilesToStoreTypes" DependsOnTargets="_GetResolvedFilesToStore;_SplitResolvedFiles;" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _SplitResolvedFiles

    Splits ResolvedFileToPublish items into 'managed' and 'unmanaged' buckets.
    ============================================================
    -->
  <Target Name="_SplitResolvedFiles" Condition="$(SkipOptimization) !='true' " DependsOnTargets="_GetResolvedFilesToStore" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_ManagedResolvedFileToPublishCandidates Include="@(ResolvedFileToPublish)" Condition="'%(ResolvedFileToPublish.AssetType)'=='runtime'" />
      <_UnOptimizedResolvedFileToPublish Include="@(ResolvedFileToPublish)" Condition="'%(ResolvedFileToPublish.AssetType)'!='runtime'" />
    </ItemGroup>
    <PropertyGroup>
      <SkipOptimization Condition="'@(_ManagedResolvedFileToPublishCandidates)'==''">true</SkipOptimization>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        _GetResolvedFilesToStore
    ============================================================
    -->
  <Target Name="_GetResolvedFilesToStore" Condition="$(SkipOptimization) == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_UnOptimizedResolvedFileToPublish Include="@(ResolvedFileToPublish)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        ComputeFilesToStore

    Gathers all the files that need to be copied to the publish directory.
    ============================================================
    -->
  <UsingTask TaskName="FilterResolvedFiles" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="ComputeFilesToStore" DependsOnTargets="_ComputeNetPublishAssets;                             _ComputeCopyToPublishDirectoryItems" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <CopyBuildOutputToPublishDirectory Condition="'$(CopyBuildOutputToPublishDirectory)'==''">true</CopyBuildOutputToPublishDirectory>
      <CopyOutputSymbolsToPublishDirectory Condition="'$(CopyOutputSymbolsToPublishDirectory)'==''">true</CopyOutputSymbolsToPublishDirectory>
    </PropertyGroup>
    <FilterResolvedFiles AssetsFilePath="$(ProjectAssetsFile)" ResolvedFiles="@(ResolvedAssembliesToPublish)" PackagesToPrune="$(PackagesToPrune)" TargetFramework="$(TargetFrameworkMoniker)" RuntimeIdentifier="$(RuntimeIdentifier)" IsSelfContained="$(SelfContained)">
      <Output TaskParameter="AssembliesToPublish" ItemName="ResolvedFileToPublish" />
      <Output TaskParameter="PublishedPackges" ItemName="PackagesThatWereResolved" />
    </FilterResolvedFiles>
    <ItemGroup>
      <ResolvedPackagesPublished Include="@(PackagesThatWereResolved)" Condition="$(DoNotTrackPackageAsResolved) !='true'" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                       PrepRestoreForStoreProjects 

    Removes specified PackageReference for store and inserts the specified StorePackageName
    ============================================================
    -->
  <Target Name="PrepRestoreForStoreProjects" BeforeTargets="_GenerateProjectRestoreGraphPerFramework;" Condition="'$(StorePackageName)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <PackageReference Remove="@(PackageReference)" Condition="'%(PackageReference.IsImplicitlyDefined)' != 'true'" />
      <PackageReference Include="$(StorePackageName)" Version="$(StorePackageVersion)" />
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.CrossGen.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.CrossGen.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.CrossGen.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!--
    ============================================================
                                        PrepOptimizer

    Sets up the common infrastructure for the optimization phase
    Outputs:
        JitPath
        Crossgen
    ============================================================
    -->
  <Target Name="PrepOptimizer" DependsOnTargets="_RestoreCrossgen;" Condition="$(SkipOptimization) != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Get the coreclr path -->
    <ItemGroup>
      <_CoreclrResolvedPath Include="@(CrossgenResolvedAssembliesToPublish)" Condition="'%(CrossgenResolvedAssembliesToPublish.Filename)'=='coreclr'" />
      <_CoreclrResolvedPath Include="@(CrossgenResolvedAssembliesToPublish)" Condition="'%(CrossgenResolvedAssembliesToPublish.Filename)'=='libcoreclr'" />
      <_JitResolvedPath Include="@(CrossgenResolvedAssembliesToPublish)" Condition="'%(CrossgenResolvedAssembliesToPublish.Filename)'=='clrjit'" />
      <_JitResolvedPath Include="@(CrossgenResolvedAssembliesToPublish)" Condition="'%(CrossgenResolvedAssembliesToPublish.Filename)'=='libclrjit'" />
    </ItemGroup>
    <NETSdkError Condition="'@(_CoreclrResolvedPath-&gt;Count())' &gt; 1" ResourceName="MultipleFilesResolved" FormatArguments="coreclr" />
    <NETSdkError Condition="'@(_CoreclrResolvedPath)'== ''" ResourceName="UnableToFindResolvedPath" FormatArguments="coreclr" />
    <NETSdkError Condition="'@(_JitResolvedPath-&gt;Count())' &gt; 1" ResourceName="MultipleFilesResolved" FormatArguments="jit" />
    <NETSdkError Condition="'@(_JitResolvedPath)'== ''" ResourceName="UnableToFindResolvedPath" FormatArguments="jit" />
    <!-- Get the crossgen and jit path-->
    <PropertyGroup>
      <_CoreclrPath>@(_CoreclrResolvedPath)</_CoreclrPath>
      <JitPath>@(_JitResolvedPath)</JitPath>
      <_CoreclrDir>$([System.IO.Path]::GetDirectoryName($(_CoreclrPath)))</_CoreclrDir>
      <_CoreclrPkgDir>$([System.IO.Path]::Combine($(_CoreclrDir),"..\..\..\"))</_CoreclrPkgDir>
      <CrossgenDir>$([System.IO.Path]::Combine($(_CoreclrPkgDir),"tools"))</CrossgenDir>
      <!-- TODO override with rid specific tools path for x-arch -->
      <Crossgen>$([System.IO.Path]::Combine($(CrossgenDir),"crossgen"))</Crossgen>
      <Crossgen Condition="'$(OS)' == 'Windows_NT'">$([System.IO.Path]::Combine($(CrossgenDir),"crossgen.exe"))</Crossgen>
    </PropertyGroup>
    <NETSdkError Condition="!Exists($(Crossgen))" ResourceName="UnableToFindResolvedPath" FormatArguments="$(Crossgen)" />
    <!-- Copy crossgen into the netcoreapp folder to ensure it can load Microsoft.DiaSymReader.Native when creating PDBs -->
    <Copy SourceFiles="$(Crossgen)" DestinationFolder="$(_NetCoreRefDir)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <PropertyGroup>
      <Crossgen>$([System.IO.Path]::GetFullPath($([System.IO.Path]::Combine($(_NetCoreRefDir), $([System.IO.Path]::GetFileName($(Crossgen)))))))</Crossgen>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        _RunOptimizer

    Start the optimization phase
    ============================================================
    -->
  <Target Name="_RunOptimizer" DependsOnTargets="_InitializeBasicProps;                             _ComputeResolvedFilesToStoreTypes;                             _SetupStageForCrossgen" Condition="$(SkipOptimization) != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <AssembliestoCrossgen Include="$(MSBuildProjectFullPath)">
        <Properties>
          CrossgenExe=$(Crossgen);
          CrossgenJit=$(JitPath);
          CrossgenInputAssembly=%(_ManagedResolvedFilesToOptimize.Fullpath);
          CrossgenOutputAssembly=$(_RuntimeOptimizedDir)$(DirectorySeparatorChar)%(FileName)%(Extension);
          CrossgenSubOutputPath=%(DestinationSubPath);
          _RuntimeOptimizedDir=$(_RuntimeOptimizedDir);
          PublishDir=$(StoreStagingDir);
          CrossgenPlatformAssembliesPath=$(_RuntimeRefDir)$(PathSeparator)$(_NetCoreRefDir);
          CreateProfilingSymbols=$(CreateProfilingSymbols);
          StoreSymbolsStagingDir=$(StoreSymbolsStagingDir);
          _RuntimeSymbolsDir=$(_RuntimeSymbolsDir)
        </Properties>
      </AssembliestoCrossgen>
    </ItemGroup>
    <!-- CrossGen the assemblies  -->
    <MSBuild Projects="@(AssembliestoCrossgen)" Targets="RunCrossGen" BuildInParallel="$(BuildInParallel)" Condition="'@(_ManagedResolvedFilesToOptimize)' != ''" />
  </Target>
  <!--
    ============================================================
                                        RunCrossGen
    Target Encapsulating the crossgen command  
    ============================================================
    -->
  <Target Name="RunCrossGen" DependsOnTargets="_InitializeBasicProps;" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <CrossgenProfilingSymbolsOutputDirectory>$([System.IO.Path]::GetDirectoryName($(_RuntimeSymbolsDir)\$(CrossgenSubOutputPath)))</CrossgenProfilingSymbolsOutputDirectory>
      <CrossgenSymbolsStagingDirectory>$([System.IO.Path]::GetDirectoryName($(StoreSymbolsStagingDir)\$(CrossgenSubOutputPath)))</CrossgenSymbolsStagingDirectory>
      <CrossgenCommandline>$(CrossgenExe) -readytorun -in "$(CrossgenInputAssembly)" -out "$(CrossgenOutputAssembly)" -jitpath "$(CrossgenJit)" -platform_assemblies_paths "$(CrossgenPlatformAssembliesPath)"</CrossgenCommandline>
      <CreateProfilingSymbolsOptionName Condition="'$(OS)' == 'Windows_NT'">CreatePDB</CreateProfilingSymbolsOptionName>
      <CreateProfilingSymbolsOptionName Condition="'$(CreateProfilingSymbolsOptionName)' == ''">CreatePerfMap</CreateProfilingSymbolsOptionName>
    </PropertyGroup>
    <Message Text="CrossgenCommandline: $(CrossgenCommandline)" />
    <!--Optimization skip if the assembly is already present in the final output directory-->
    <Exec Command="$(CrossgenCommandline)" Condition="!Exists($([System.IO.Path]::Combine($(PublishDir),$(CrossgenSubOutputPath))))" />
    <Copy SourceFiles="$(CrossgenOutputAssembly)" DestinationFiles="$(PublishDir)\$(CrossgenSubOutputPath)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" Condition="!Exists($([System.IO.Path]::Combine($(PublishDir),$(CrossgenSubOutputPath))))">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
    <!-- Create profiling symbols if requested -->
    <MakeDir Directories="$(CrossgenProfilingSymbolsOutputDirectory)" Condition="'$(CreateProfilingSymbols)' == 'true' and Exists($(CrossgenOutputAssembly))" />
    <Exec Command="$(CrossgenExe) -readytorun -platform_assemblies_paths $(CrossgenPlatformAssembliesPath) -$(CreateProfilingSymbolsOptionName) $(CrossgenProfilingSymbolsOutputDirectory) $(CrossgenOutputAssembly)" Condition="'$(CreateProfilingSymbols)' == 'true' and Exists($(CrossgenOutputAssembly))" />
    <ItemGroup>
      <_ProfilingSymbols Include="$(CrossgenProfilingSymbolsOutputDirectory)\*" Condition="'$(CreateProfilingSymbols)' == 'true'" />
    </ItemGroup>
    <Copy SourceFiles="@(_ProfilingSymbols)" DestinationFolder="$(CrossgenSymbolsStagingDirectory)" Condition="'$(CreateProfilingSymbols)' == 'true'" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <Target Name="_InitializeBasicProps" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <PathSeparator>$([System.IO.Path]::PathSeparator)</PathSeparator>
      <DirectorySeparatorChar>$([System.IO.Path]::DirectorySeparatorChar)</DirectorySeparatorChar>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                       _GetCrossgenProps
    Generates props used by Crossgen
    ============================================================
    -->
  <Target Name="_GetCrossgenProps" Condition="$(SkipOptimization) != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_CrossProjFileDir>$([System.IO.Path]::Combine($(ComposeWorkingDir),"Optimize"))</_CrossProjFileDir>
      <_NetCoreRefDir>$([System.IO.Path]::Combine($(_CrossProjFileDir), "netcoreapp"))</_NetCoreRefDir>
      <!-- flat netcore app assemblies-->
    </PropertyGroup>
    <MakeDir Directories="$(_CrossProjFileDir)" />
    <PropertyGroup>
      <_CrossProjAssetsFile>$([System.IO.Path]::Combine($(_CrossProjFileDir),  project.assets.json))</_CrossProjAssetsFile>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        _SetupStageForCrossgen
    ============================================================
    -->
  <Target Name="_SetupStageForCrossgen" DependsOnTargets="_GetCrossgenProps;" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_RuntimeRefDir>$([System.IO.Path]::Combine($(StoreWorkerWorkingDir), "runtimeref"))</_RuntimeRefDir>
      <!-- flat app managed assemblies -->
      <_RuntimeOptimizedDir>$([System.IO.Path]::Combine($(StoreWorkerWorkingDir), "runtimopt"))</_RuntimeOptimizedDir>
      <!-- optimized app managed assemblies in nuget cache layout -->
      <_RuntimeSymbolsDir>$([System.IO.Path]::Combine($(StoreWorkerWorkingDir), "runtimesymbols"))</_RuntimeSymbolsDir>
    </PropertyGroup>
    <ItemGroup>
      <_ManagedResolvedFilesToOptimize Include="@(_ManagedResolvedFileToPublishCandidates)" />
    </ItemGroup>
    <MakeDir Directories="$(_RuntimeOptimizedDir)" />
    <MakeDir Directories="$(_RuntimeSymbolsDir)" Condition="'$(CreateProfilingSymbols)' == 'true'" />
    <!-- Copy managed files to  a flat temp directory for passing it as ref -->
    <Copy SourceFiles="@(_ManagedResolvedFilesToOptimize)" DestinationFolder="$(_RuntimeRefDir)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        _RestoreCrossgen
Restores netcoreapp and publishes it to a temp directory
    ============================================================
    -->
  <Target Name="_RestoreCrossgen" DependsOnTargets="PrepforRestoreForComposeStore;                            _SetupStageForCrossgen;" Condition="$(SkipOptimization) != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuild Projects="$(MSBuildProjectFullPath)" Targets="Restore" Properties="RestoreGraphProjectInput=$(MSBuildProjectFullPath);                              DisableImplicitFrameworkReferences=true;                              RestoreOutputPath=$(_CrossProjFileDir);                              StorePackageName=$(MicrosoftNETPlatformLibrary);                              StorePackageVersion=$(RuntimeFrameworkVersion);" />
    <ResolvePublishAssemblies ProjectPath="$(MSBuildProjectFullPath)" AssetsFilePath="$(_CrossProjAssetsFile)" TargetFramework="$(_TFM)" RuntimeIdentifier="$(RuntimeIdentifier)" PlatformLibraryName="$(MicrosoftNETPlatformLibrary)" ExcludeFromPublishPackageReferences="@(_ExcludeFromPublishPackageReference)" IsSelfContained="$(SelfContained)" PreserveStoreLayout="false">
      <Output TaskParameter="AssembliesToPublish" ItemName="CrossgenResolvedAssembliesToPublish" />
    </ResolvePublishAssemblies>
    <!-- Copy managed files to  a flat temp directory for passing it as ref for crossgen -->
    <Copy SourceFiles="@(CrossgenResolvedAssembliesToPublish)" DestinationFolder="$(_NetCoreRefDir)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.ObsoleteReferences.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.ObsoleteReferences.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.ObsoleteReferences.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <PropertyGroup Condition="'$(NETCoreSdkBundledCliToolsProps)' == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETCoreSdkBundledCliToolsProps>$(MSBuildThisFileDirectory)..\..\..\Microsoft.NETCoreSdk.BundledCliTools.props</NETCoreSdkBundledCliToolsProps>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(NETCoreSdkBundledCliToolsProps)" Condition="Exists('$(NETCoreSdkBundledCliToolsProps)')">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Microsoft.NETCoreSdk.BundledCliTools.props
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NETCoreSdk.BundledCliTools.props

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <ItemGroup>
    <BundledDotNetCliToolReference Include="Microsoft.EntityFrameworkCore.Tools.DotNet" />
    <BundledDotNetCliToolReference Include="Microsoft.Extensions.Caching.SqlConfig.Tools" />
    <BundledDotNetCliToolReference Include="Microsoft.Extensions.SecretManager.Tools" />
    <BundledDotNetCliToolReference Include="Microsoft.DotNet.Watcher.Tools" />
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.ObsoleteReferences.targets
============================================================================================================================================
-->
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_ReferenceToObsoleteDotNetCliTool Include="@(DotNetCliToolReference)" />
    <DotNetCliToolReference Remove="@(BundledDotNetCliToolReference)" />
    <_ReferenceToObsoleteDotNetCliTool Remove="@(DotNetCliToolReference)" />
  </ItemGroup>
  <Target Name="_CheckForObsoleteDotNetCliToolReferences" BeforeTargets="CollectPackageReferences" Condition=" '$(SuppressObsoleteDotNetCliToolWarning)' != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkWarning Condition=" '%(_ReferenceToObsoleteDotNetCliTool.Identity)' != '' " ResourceName="ProjectContainsObsoleteDotNetCliTool" FormatArguments="%(_ReferenceToObsoleteDotNetCliTool.Identity)" />
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Publish.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Publish.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.Publish.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <DefaultCopyToPublishDirectoryMetadata Condition="'$(DefaultCopyToPublishDirectoryMetadata)' == ''">true</DefaultCopyToPublishDirectoryMetadata>
    <_GetChildProjectCopyToPublishDirectoryItems Condition="'$(_GetChildProjectCopyToPublishDirectoryItems)' == ''">true</_GetChildProjectCopyToPublishDirectoryItems>
    <!-- publishing self-contained apps should publish the native host as $(AssemblyName).exe -->
    <DeployAppHost Condition=" '$(DeployAppHost)' == '' and '$(_IsExecutable)' == 'true' and '$(RuntimeIdentifier)' != '' and '$(SelfContained)' == 'true'">true</DeployAppHost>
    <IsPublishable Condition="'$(IsPublishable)'==''">true</IsPublishable>
  </PropertyGroup>
  <ItemDefinitionGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolvedFileToPublish>
      <CopyToPublishDirectory>Always</CopyToPublishDirectory>
    </ResolvedFileToPublish>
  </ItemDefinitionGroup>
  <!--
    ============================================================
                                        Publish
 
    The main publish entry point.
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- We still need to resolve references even if we are not building during publish. -->
    <!-- BuildOnlySettings are required for RAR to find satellites and dependencies -->
    <_BeforePublishNoBuildTargets>
      BuildOnlySettings;
      _PreventProjectReferencesFromBuilding;
      ResolveReferences;
      PrepareResourceNames;
      ComputeIntermediateSatelliteAssemblies;
    </_BeforePublishNoBuildTargets>
    <_CorePublishTargets>
      PrepareForPublish;
      ComputeAndCopyFilesToPublishDirectory;
      GeneratePublishDependencyFile;
      GeneratePublishRuntimeConfigurationFile;
    </_CorePublishTargets>
  </PropertyGroup>
  <Target Name="_PublishBuildAlternative" Condition="'$(NoBuild)' != 'true'" DependsOnTargets="Build;$(_CorePublishTargets)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="_PublishNoBuildAlternative" Condition="'$(NoBuild)' == 'true'" DependsOnTargets="$(_BeforePublishNoBuildTargets);$(_CorePublishTargets)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="Publish" Condition="$(IsPublishable) == 'true'" DependsOnTargets="_PublishBuildAlternative;_PublishNoBuildAlternative" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Ensure there is minimal verbosity output pointing to the publish directory and not just the
         build step's minimal output. Otherwise there is no indication at minimal verbosity of where
         the published assets were copied. -->
    <Message Importance="High" Text="$(MSBuildProjectName) -&gt; $([System.IO.Path]::GetFullPath('$(PublishDir)'))" />
  </Target>
  <!-- Don't let project reference resolution build project references in NoBuild case. -->
  <Target Name="_PreventProjectReferencesFromBuilding" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <BuildProjectReferences>false</BuildProjectReferences>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
                                        PrepareForPublish

    Prepare the prerequisites for publishing.
    ============================================================
    -->
  <Target Name="PrepareForPublish" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- Ensure any PublishDir has a trailing slash, so it can be concatenated -->
      <PublishDir Condition="!HasTrailingSlash('$(PublishDir)')">$(PublishDir)\</PublishDir>
    </PropertyGroup>
    <MakeDir Directories="$(PublishDir)" />
  </Target>
  <!--
    ============================================================
                                        ComputeAndCopyFilesToPublishDirectory

    Computes the list of all files to copy to the publish directory and then publishes them.
    ============================================================
    -->
  <Target Name="ComputeAndCopyFilesToPublishDirectory" DependsOnTargets="ComputeFilesToPublish;                             CopyFilesToPublishDirectory" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        CopyFilesToPublishDirectory

    Copy all build outputs, satellites and other necessary files to the publish directory.
    ============================================================
    -->
  <Target Name="CopyFilesToPublishDirectory" DependsOnTargets="_CopyResolvedFilesToPublishPreserveNewest;                             _CopyResolvedFilesToPublishAlways" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    ============================================================
                                        _CopyResolvedFilesToPublishPreserveNewest

    Copy _ResolvedFileToPublishPreserveNewest items to the publish directory.
    ============================================================
    -->
  <Target Name="_CopyResolvedFilesToPublishPreserveNewest" DependsOnTargets="_ComputeResolvedFilesToPublishTypes" Inputs="@(_ResolvedFileToPublishPreserveNewest)" Outputs="@(_ResolvedFileToPublishPreserveNewest->'$(PublishDir)%(RelativePath)')" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Not using SkipUnchangedFiles="true" because the application may want to change
        one of these files and not have an incremental build replace it.
        -->
    <Copy SourceFiles="@(_ResolvedFileToPublishPreserveNewest)" DestinationFiles="@(_ResolvedFileToPublishPreserveNewest->'$(PublishDir)%(RelativePath)')" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        _CopyResolvedFilesToPublishAlways

    Copy _ResolvedFileToPublishAlways items to the publish directory.
    ============================================================
    -->
  <Target Name="_CopyResolvedFilesToPublishAlways" DependsOnTargets="_ComputeResolvedFilesToPublishTypes" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!--
        Not using SkipUnchangedFiles="true" because the application may want to change
        one of these files and not have an incremental build replace it.
        -->
    <Copy SourceFiles="@(_ResolvedFileToPublishAlways)" DestinationFiles="@(_ResolvedFileToPublishAlways->'$(PublishDir)%(RelativePath)')" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForPublishFilesIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForPublishFilesIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
    ============================================================
                                        _ComputeResolvedFilesToPublishTypes

    Splits ResolvedFileToPublish items into 'PreserveNewest' and 'Always' buckets.
    ============================================================
    -->
  <Target Name="_ComputeResolvedFilesToPublishTypes" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_ResolvedFileToPublishPreserveNewest Include="@(ResolvedFileToPublish)" Condition="'%(ResolvedFileToPublish.CopyToPublishDirectory)'=='PreserveNewest'" />
      <_ResolvedFileToPublishAlways Include="@(ResolvedFileToPublish)" Condition="'%(ResolvedFileToPublish.CopyToPublishDirectory)'=='Always'" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        ComputeFilesToPublish

    Gathers all the files that need to be copied to the publish directory.
    ============================================================
    -->
  <Target Name="ComputeFilesToPublish" DependsOnTargets="_ComputeNetPublishAssets;                             _ComputeCopyToPublishDirectoryItems" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <CopyBuildOutputToPublishDirectory Condition="'$(CopyBuildOutputToPublishDirectory)'==''">true</CopyBuildOutputToPublishDirectory>
      <CopyOutputSymbolsToPublishDirectory Condition="'$(CopyOutputSymbolsToPublishDirectory)'==''">true</CopyOutputSymbolsToPublishDirectory>
    </PropertyGroup>
    <ItemGroup>
      <!-- Copy the build product (.dll or .exe). -->
      <ResolvedFileToPublish Include="@(IntermediateAssembly)" Condition="'$(CopyBuildOutputToPublishDirectory)' == 'true'">
        <RelativePath>@(IntermediateAssembly->'%(Filename)%(Extension)')</RelativePath>
      </ResolvedFileToPublish>
      <!-- Copy the app.config (if any) -->
      <ResolvedFileToPublish Include="@(AppConfigWithTargetPath)" Condition="'$(CopyBuildOutputToPublishDirectory)' == 'true'">
        <RelativePath>@(AppConfigWithTargetPath->'%(TargetPath)')</RelativePath>
      </ResolvedFileToPublish>
      <!-- Copy the debug information file (.pdb), if any -->
      <ResolvedFileToPublish Include="@(_DebugSymbolsIntermediatePath)" Condition="'$(_DebugSymbolsProduced)'=='true' and '$(CopyOutputSymbolsToPublishDirectory)'=='true'">
        <RelativePath>@(_DebugSymbolsIntermediatePath->'%(Filename)%(Extension)')</RelativePath>
      </ResolvedFileToPublish>
      <!-- Copy satellite assemblies. -->
      <ResolvedFileToPublish Include="@(IntermediateSatelliteAssembliesWithTargetPath)">
        <RelativePath>%(IntermediateSatelliteAssembliesWithTargetPath.Culture)\%(Filename)%(Extension)</RelativePath>
      </ResolvedFileToPublish>
      <!-- Copy all the assemblies -->
      <ResolvedFileToPublish Include="@(ResolvedAssembliesToPublish)">
        <RelativePath>%(ResolvedAssembliesToPublish.DestinationSubPath)</RelativePath>
      </ResolvedFileToPublish>
      <!-- Copy the xml documentation (if enabled) -->
      <ResolvedFileToPublish Include="@(FinalDocFile)" Condition="'$(PublishDocumentationFile)' == 'true'">
        <RelativePath>@(FinalDocFile->'%(Filename)%(Extension)')</RelativePath>
      </ResolvedFileToPublish>
    </ItemGroup>
  </Target>
  <Target Name="_ComputeNetPublishAssets" DependsOnTargets="RunResolvePublishAssemblies" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- TODO get the content files -->
    <!-- TODO perform any preprocess transforms on the files -->
    <ItemGroup>
      <ResolvedAssembliesToPublish Include="@(ReferenceCopyLocalPaths)" Exclude="@(ResolvedAssembliesToPublish)" Condition="'$(PublishReferencesDocumentationFiles)' == 'true' or '%(Extension)' != '.xml'">
        <DestinationSubPath>%(ReferenceCopyLocalPaths.DestinationSubDirectory)%(Filename)%(Extension)</DestinationSubPath>
      </ResolvedAssembliesToPublish>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                     RunResolvePublishAssemblies

    Gets the assemblies to be copied to the publish directory
    ============================================================
    -->
  <UsingTask TaskName="ResolvePublishAssemblies" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="RunResolvePublishAssemblies" DependsOnTargets="_ComputeExcludeFromPublishPackageReferences;                             _ParseTargetManifestFiles;                             _DefaultMicrosoftNETPlatformLibrary" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolvePublishAssemblies ProjectPath="$(MSBuildProjectFullPath)" AssetsFilePath="$(ProjectAssetsFile)" TargetFramework="$(TargetFrameworkMoniker)" RuntimeIdentifier="$(RuntimeIdentifier)" PlatformLibraryName="$(MicrosoftNETPlatformLibrary)" ExcludeFromPublishPackageReferences="@(_ExcludeFromPublishPackageReference)" RuntimeStorePackages="@(RuntimeStorePackages)" PreserveStoreLayout="$(PreserveStoreLayout)" IsSelfContained="$(SelfContained)">
      <Output TaskParameter="AssembliesToPublish" ItemName="ResolvedAssembliesToPublish" />
    </ResolvePublishAssemblies>
  </Target>
  <Target Name="FilterPublishSatelliteResources" AfterTargets="RunResolvePublishAssemblies" Condition="'$(SatelliteResourceLanguages)' != ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <PublishSatelliteResources Include="@(ResolvedAssembliesToPublish)" Condition="'%(ResolvedAssembliesToPublish.AssetType)' == 'resources'" />
    </ItemGroup>
    <JoinItems Left="@(PublishSatelliteResources)" LeftKey="Culture" LeftMetadata="*" Right="$(SatelliteResourceLanguages)" RightKey="" RightMetadata="" ItemSpecToUse="Left">
      <Output TaskParameter="JoinResult" ItemName="FilteredPublishSatelliteResources" />
    </JoinItems>
    <ItemGroup Condition="'@(PublishSatelliteResources)' != ''">
      <ResolvedAssembliesToPublish Remove="@(PublishSatelliteResources)" />
      <ResolvedAssembliesToPublish Include="@(FilteredPublishSatelliteResources)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _ComputeCopyToPublishDirectoryItems
    ============================================================
    -->
  <Target Name="_ComputeCopyToPublishDirectoryItems" DependsOnTargets="GetCopyToPublishDirectoryItems" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <ResolvedFileToPublish Include="@(_SourceItemsToCopyToPublishDirectoryAlways)">
        <RelativePath>%(_SourceItemsToCopyToPublishDirectoryAlways.TargetPath)</RelativePath>
        <CopyToPublishDirectory>Always</CopyToPublishDirectory>
      </ResolvedFileToPublish>
      <ResolvedFileToPublish Include="@(_SourceItemsToCopyToPublishDirectory)">
        <RelativePath>%(_SourceItemsToCopyToPublishDirectory.TargetPath)</RelativePath>
        <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
      </ResolvedFileToPublish>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GetCopyToPublishDirectoryItems

    Get all project items that may need to be transferred to the publish directory.
    This includes baggage items from transitively referenced projects. It would appear
    that this target computes full transitive closure of content items for all referenced
    projects; however that is not the case. It only collects the content items from its
    immediate children and not children of children. 
    
    See comment on GetCopyToOutputDirectoryItems, from which this logic was taken.
    ============================================================
    -->
  <Target Name="GetCopyToPublishDirectoryItems" Returns="@(AllPublishItemsFullPathWithTargetPath)" KeepDuplicateOutputs=" '$(MSBuildDisableGetCopyToPublishDirectoryItemsOptimization)' == '' " DependsOnTargets="AssignTargetPaths;                             DefaultCopyToPublishDirectoryMetadata;                             _SplitProjectReferencesByFileExistence;                             _GetProjectReferenceTargetFrameworkProperties" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- In the general case, clients need very little of the metadata which is generated by invoking this target on this project and its children.  For those
         cases, we can immediately discard the unwanted metadata, reducing memory usage, particularly in very large and interconnected systems of projects.
         However, if some client does require the original functionality, it is sufficient to set MSBuildDisableGetCopyToPublishDirectoryItemsOptimization to
         a non-empty value and the original behavior will be restored. -->
    <PropertyGroup Condition=" '$(MSBuildDisableGetCopyToPublishDirectoryItemsOptimization)' == '' ">
      <_GCTPDIKeepDuplicates>false</_GCTPDIKeepDuplicates>
      <_GCTPDIKeepMetadata>CopyToPublishDirectory;TargetPath</_GCTPDIKeepMetadata>
    </PropertyGroup>
    <!-- Get items from child projects first. -->
    <MSBuild Projects="@(_MSBuildProjectReferenceExistent)" Targets="GetCopyToPublishDirectoryItems" BuildInParallel="$(BuildInParallel)" Properties="%(_MSBuildProjectReferenceExistent.SetConfiguration); %(_MSBuildProjectReferenceExistent.SetPlatform); %(_MSBuildProjectReferenceExistent.SetTargetFramework)" Condition="'@(_MSBuildProjectReferenceExistent)' != '' and '$(_GetChildProjectCopyToPublishDirectoryItems)' == 'true' and '%(_MSBuildProjectReferenceExistent.Private)' != 'false'" ContinueOnError="$(ContinueOnError)" RemoveProperties="%(_MSBuildProjectReferenceExistent.GlobalPropertiesToRemove)">
      <Output TaskParameter="TargetOutputs" ItemName="_AllChildProjectPublishItemsWithTargetPath" />
    </MSBuild>
    <!-- Target outputs must be full paths because they will be consumed by a different project. -->
    <ItemGroup>
      <_SourceItemsToCopyToPublishDirectoryAlways KeepDuplicates=" '$(_GCTPDIKeepDuplicates)' != 'false' " KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(_AllChildProjectPublishItemsWithTargetPath->'%(FullPath)')" Condition="'%(_AllChildProjectPublishItemsWithTargetPath.CopyToPublishDirectory)'=='Always'" />
      <_SourceItemsToCopyToPublishDirectory KeepDuplicates=" '$(_GCTPDIKeepDuplicates)' != 'false' " KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(_AllChildProjectPublishItemsWithTargetPath->'%(FullPath)')" Condition="'%(_AllChildProjectPublishItemsWithTargetPath.CopyToPublishDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <!-- Remove items which we will never again use - they just sit around taking up memory otherwise -->
    <ItemGroup>
      <_AllChildProjectPublishItemsWithTargetPath Remove="@(_AllChildProjectPublishItemsWithTargetPath)" />
    </ItemGroup>
    <!-- Get items from this project last so that they will be copied last. -->
    <ItemGroup>
      <_SourceItemsToCopyToPublishDirectoryAlways KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(ContentWithTargetPath->'%(FullPath)')" Condition="'%(ContentWithTargetPath.CopyToPublishDirectory)'=='Always'" />
      <_SourceItemsToCopyToPublishDirectory KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(ContentWithTargetPath->'%(FullPath)')" Condition="'%(ContentWithTargetPath.CopyToPublishDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <_SourceItemsToCopyToPublishDirectoryAlways KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(EmbeddedResource->'%(FullPath)')" Condition="'%(EmbeddedResource.CopyToPublishDirectory)'=='Always'" />
      <_SourceItemsToCopyToPublishDirectory KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(EmbeddedResource->'%(FullPath)')" Condition="'%(EmbeddedResource.CopyToPublishDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <_CompileItemsToPublish Include="@(Compile->'%(FullPath)')" Condition="'%(Compile.CopyToPublishDirectory)'=='Always' or '%(Compile.CopyToPublishDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <AssignTargetPath Files="@(_CompileItemsToPublish)" RootFolder="$(MSBuildProjectDirectory)">
      <Output TaskParameter="AssignedFiles" ItemName="_CompileItemsToPublishWithTargetPath" />
    </AssignTargetPath>
    <ItemGroup>
      <_SourceItemsToCopyToPublishDirectoryAlways KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(_CompileItemsToPublishWithTargetPath)" Condition="'%(_CompileItemsToPublishWithTargetPath.CopyToPublishDirectory)'=='Always'" />
      <_SourceItemsToCopyToPublishDirectory KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(_CompileItemsToPublishWithTargetPath)" Condition="'%(_CompileItemsToPublishWithTargetPath.CopyToPublishDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <_SourceItemsToCopyToPublishDirectoryAlways KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(_NoneWithTargetPath->'%(FullPath)')" Condition="'%(_NoneWithTargetPath.CopyToPublishDirectory)'=='Always'" />
      <_SourceItemsToCopyToPublishDirectory KeepMetadata="$(_GCTPDIKeepMetadata)" Include="@(_NoneWithTargetPath->'%(FullPath)')" Condition="'%(_NoneWithTargetPath.CopyToPublishDirectory)'=='PreserveNewest'" />
    </ItemGroup>
    <ItemGroup>
      <AllPublishItemsFullPathWithTargetPath Include="@(_SourceItemsToCopyToPublishDirectoryAlways->'%(FullPath)');@(_SourceItemsToCopyToPublishDirectory->'%(FullPath)')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        DefaultCopyToPublishDirectoryMetadata

    If CopyToPublishDirectory isn't set on these items, the value should be taken from CopyToOutputDirectory.
    This way, projects can just set "CopyToOutputDirectory = Always/PreserveNewest" and by default the item will be copied
    to both the build output and publish directories.
    ============================================================
    -->
  <Target Name="DefaultCopyToPublishDirectoryMetadata" DependsOnTargets="AssignTargetPaths" Condition=" '$(DefaultCopyToPublishDirectoryMetadata)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <ContentWithTargetPath Condition="'%(ContentWithTargetPath.CopyToOutputDirectory)'=='Always' and '%(ContentWithTargetPath.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>Always</CopyToPublishDirectory>
      </ContentWithTargetPath>
      <ContentWithTargetPath Condition="'%(ContentWithTargetPath.CopyToOutputDirectory)'=='PreserveNewest' and '%(ContentWithTargetPath.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
      </ContentWithTargetPath>
      <EmbeddedResource Condition="'%(EmbeddedResource.CopyToOutputDirectory)'=='Always' and '%(EmbeddedResource.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>Always</CopyToPublishDirectory>
      </EmbeddedResource>
      <EmbeddedResource Condition="'%(EmbeddedResource.CopyToOutputDirectory)'=='PreserveNewest' and '%(EmbeddedResource.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
      </EmbeddedResource>
      <Compile Condition="'%(Compile.CopyToOutputDirectory)'=='Always' and '%(Compile.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>Always</CopyToPublishDirectory>
      </Compile>
      <Compile Condition="'%(Compile.CopyToOutputDirectory)'=='PreserveNewest' and '%(Compile.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
      </Compile>
      <_NoneWithTargetPath Condition="'%(_NoneWithTargetPath.CopyToOutputDirectory)'=='Always' and '%(_NoneWithTargetPath.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>Always</CopyToPublishDirectory>
      </_NoneWithTargetPath>
      <_NoneWithTargetPath Condition="'%(_NoneWithTargetPath.CopyToOutputDirectory)'=='PreserveNewest' and '%(_NoneWithTargetPath.CopyToPublishDirectory)' == ''">
        <CopyToPublishDirectory>PreserveNewest</CopyToPublishDirectory>
      </_NoneWithTargetPath>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        GeneratePublishDependencyFile

    Generates the $(project).deps.json file for a published app
    ============================================================
    -->
  <Target Name="GeneratePublishDependencyFile" DependsOnTargets="_ComputeExcludeFromPublishPackageReferences;                             _ParseTargetManifestFiles;                             _DefaultMicrosoftNETPlatformLibrary;                             _HandlePackageFileConflicts;                             _HandlePublishFileConflicts;                             _ComputeReferenceAssemblies" Condition="'$(GenerateDependencyFile)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <PublishDepsFilePath Condition=" '$(PublishDepsFilePath)' == '' ">$(PublishDir)$(ProjectDepsFileName)</PublishDepsFilePath>
    </PropertyGroup>
    <GenerateDepsFile ProjectPath="$(MSBuildProjectFullPath)" AssetsFilePath="$(ProjectAssetsFile)" DepsFilePath="$(PublishDepsFilePath)" TargetFramework="$(TargetFrameworkMoniker)" AssemblyName="$(AssemblyName)" AssemblyExtension="$(TargetExt)" AssemblyVersion="$(Version)" AssemblySatelliteAssemblies="@(IntermediateSatelliteAssembliesWithTargetPath)" ReferencePaths="@(ReferencePath)" ReferenceDependencyPaths="@(ReferenceDependencyPaths)" ReferenceSatellitePaths="@(ReferenceSatellitePaths)" ReferenceAssemblies="@(_ReferenceAssemblies)" IncludeMainProject="$(IncludeMainProjectInDepsFile)" RuntimeIdentifier="$(RuntimeIdentifier)" PlatformLibraryName="$(MicrosoftNETPlatformLibrary)" FilesToSkip="@(_ConflictPackageFiles);@(_PublishConflictPackageFiles)" CompilerOptions="@(DependencyFileCompilerOptions)" ExcludeFromPublishPackageReferences="@(_ExcludeFromPublishPackageReference)" RuntimeStorePackages="@(RuntimeStorePackages)" IsSelfContained="$(SelfContained)" IncludeRuntimeFileVersions="$(IncludeFileVersionsInDependencyFile)" />
  </Target>
  <!--
    ============================================================
                                        _ComputeExcludeFromPublishPackageReferences

    Builds up the @(_ExcludeFromPublishPackageReference) item by looking for @(PackageReference) items where
    that have Publish=false metadata, or that have PrivateAssets=All and don't specify Publish
    ============================================================
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_ComputeExcludeFromPublishPackageReferences Condition="'$(_ComputeExcludeFromPublishPackageReferences)' == ''">true</_ComputeExcludeFromPublishPackageReferences>
  </PropertyGroup>
  <Target Name="_ComputeExcludeFromPublishPackageReferences" Condition="'$(_ComputeExcludeFromPublishPackageReferences)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <!-- PrivateAssets="All" means exclude from publish, unless Publish metadata is specified separately -->
      <PackageReference Publish="false" Condition="('%(PackageReference.PrivateAssets)' == 'All') And ('%(PackageReference.Publish)' == '')" />
      <_ExcludeFromPublishPackageReference Include="@(PackageReference)" Condition="('%(PackageReference.Publish)' == 'false')" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _ParseTargetManifestFiles

    Parses the $(TargetManifestFiles) which contains a list of files into @(RuntimeStorePackages) items
    which describes which packages should be excluded from publish since they are contained in the runtime store.
    ============================================================
    -->
  <UsingTask TaskName="ParseTargetManifests" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="_ParseTargetManifestFiles" Condition="'$(TargetManifestFiles)' != ''" Returns="@(RuntimeStorePackages)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ParseTargetManifests TargetManifestFiles="$(TargetManifestFiles)">
      <Output TaskParameter="RuntimeStorePackages" ItemName="RuntimeStorePackages" />
    </ParseTargetManifests>
  </Target>
  <!--
    ============================================================
                                        GeneratePublishRuntimeConfigurationFile

    Generates the $(project).runtimeconfig.json file for a published app
    ============================================================
    -->
  <Target Name="GeneratePublishRuntimeConfigurationFile" DependsOnTargets="_DefaultMicrosoftNETPlatformLibrary" Condition="'$(GenerateRuntimeConfigurationFiles)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <PublishRuntimeConfigFilePath Condition=" '$(PublishRuntimeConfigFilePath)' == '' ">$(PublishDir)$(ProjectRuntimeConfigFileName)</PublishRuntimeConfigFilePath>
    </PropertyGroup>
    <GenerateRuntimeConfigurationFiles AssetsFilePath="$(ProjectAssetsFile)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetFramework="$(TargetFramework)" RuntimeConfigPath="$(PublishRuntimeConfigFilePath)" RuntimeIdentifier="$(RuntimeIdentifier)" PlatformLibraryName="$(MicrosoftNETPlatformLibrary)" UserRuntimeConfig="$(UserRuntimeConfig)" HostConfigurationOptions="@(RuntimeHostConfigurationOption)" IsSelfContained="$(SelfContained)" />
  </Target>
  <!--
    ============================================================
                                        DeployAppHost

    Deploys the host to run the stand alone app and ensures it matches the app name
    ============================================================
    -->
  <Target Name="DeployAppHost" DependsOnTargets="_ComputeNETCoreBuildOutputFiles" AfterTargets="ComputeFilesToPublish" BeforeTargets="CopyFilesToPublishDirectory" Condition="'$(DeployAppHost)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <ResolvedFileToRemove Include="%(ResolvedFileToPublish.Identity)" Condition="'%(ResolvedFileToPublish.RelativePath)' == '$(_DotNetHostExecutableName)' Or '%(ResolvedFileToPublish.RelativePath)' == '$(_DotNetAppHostExecutableName)'" />
      <ResolvedFileToPublish Remove="%(ResolvedFileToRemove.Identity)" />
      <ResolvedFileToPublish Include="%(NativeAppHostNETCore.Identity)">
        <RelativePath>$(AssemblyName)$(_NativeExecutableExtension)</RelativePath>
      </ResolvedFileToPublish>
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.PackTool.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.PackTool.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.PackTool.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <UsingTask TaskName="Microsoft.NET.Build.Tasks.GenerateToolsSettingsFile" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <!--
    Mark all dependecy as private assets. But keep them as Publish. So dependency DLLs will be included in NuGet package, while
    there is no dependency in nuspec. And add Microsoft.NETCore.Platforms, which is used to select correct RID assets.
    -->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <_ToolsSettingsFilePath>$(BaseIntermediateOutputPath)DotnetToolSettings.xml</_ToolsSettingsFilePath>
  </PropertyGroup>
  <ItemGroup Condition=" '$(PackAsTool)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageReference Update="@(PackageReference)">
      <PrivateAssets>All</PrivateAssets>
      <Publish Condition=" '%(PackageReference.Publish)' != 'false' ">true</Publish>
    </PackageReference>
    <ProjectReference Update="@(ProjectReference)">
      <PrivateAssets>All</PrivateAssets>
      <Publish Condition=" '%(ProjectReference.Publish)' != 'false' ">true</Publish>
    </ProjectReference>
  </ItemGroup>
  <Target Name="PackTool" DependsOnTargets="GenerateToolsSettingsFileFromBuildProperty;Publish" Condition=" '$(PackAsTool)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NETSdkError Condition=" '$(SelfContained)' == 'true' " ResourceName="PackAsToolCannotSupportSelfContained" />
    <NETSdkError Condition=" '$(TargetFrameworkIdentifier)' != '.NETCoreApp' " ResourceName="DotnetToolOnlySupportNetcoreapp" />
    <NETSdkError Condition=" '$(_TargetFrameworkVersionWithoutV)' &lt; '2.1' " ResourceName="DotnetToolDoesNotSupportTFMLowerThanNetcoreapp21" />
    <ItemGroup>
      <_GeneratedFiles Include="$(PublishDepsFilePath)" />
      <_GeneratedFiles Include="$(PublishRuntimeConfigFilePath)" />
      <_GeneratedFiles Include="$(_ToolsSettingsFilePath)" />
    </ItemGroup>
    <ItemGroup>
      <TfmSpecificPackageFile Include="@(_GeneratedFiles)">
        <PackagePath>tools/$(targetframework)/any/%(_GeneratedFiles.RecursiveDir)%(_GeneratedFiles.Filename)%(_GeneratedFiles.Extension)</PackagePath>
      </TfmSpecificPackageFile>
      <TfmSpecificPackageFile Include="@(ResolvedFileToPublish->'$([MSBuild]::NormalizeDirectory($(PublishDir)))%(RelativePath)')">
        <PackagePath>tools/$(targetframework)/any/%(ResolvedFileToPublish.RelativePath)</PackagePath>
      </TfmSpecificPackageFile>
    </ItemGroup>
  </Target>
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ToolCommandName Condition=" '$(ToolCommandName)' == '' ">$(TargetName)</ToolCommandName>
    <ToolEntryPoint Condition=" '$(ToolEntryPoint)' == '' ">$(TargetFileName)</ToolEntryPoint>
  </PropertyGroup>
  <Target Name="GenerateToolsSettingsFileFromBuildProperty" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateToolsSettingsFile EntryPointRelativePath="$(ToolEntryPoint)" CommandName="$(ToolCommandName)" ToolsSettingsFilePath="$(_ToolsSettingsFilePath)" />
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.PreserveCompilationContext.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.PreserveCompilationContext.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.PreserveCompilationContext.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
    <RefAssembliesFolderName Condition="'$(RefAssembliesFolderName)' == ''">refs</RefAssembliesFolderName>
  </PropertyGroup>
  <Target Name="ComputeDependencyFileCompilerOptions" Condition="'$(PreserveCompilationContext)' == 'true'" BeforeTargets="GenerateBuildDependencyFile;                          GeneratePublishDependencyFile" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <DependencyFileCompilerOptions Include="CompilerOptions">
        <DefineConstants>$(DefineConstants)</DefineConstants>
        <LangVersion>$(LangVersion)</LangVersion>
        <PlatformTarget>$(PlatformTarget)</PlatformTarget>
        <AllowUnsafeBlocks>$(AllowUnsafeBlocks)</AllowUnsafeBlocks>
        <TreatWarningsAsErrors>$(TreatWarningsAsErrors)</TreatWarningsAsErrors>
        <Optimize>$(Optimize)</Optimize>
        <AssemblyOriginatorKeyFile>$(AssemblyOriginatorKeyFile)</AssemblyOriginatorKeyFile>
        <DelaySign>$(DelaySign)</DelaySign>
        <PublicSign>$(DelaySign)</PublicSign>
        <DebugType>$(DebugType)</DebugType>
        <OutputType>$(OutputType)</OutputType>
        <GenerateDocumentationFile>$(GenerateDocumentationFile)</GenerateDocumentationFile>
      </DependencyFileCompilerOptions>
    </ItemGroup>
  </Target>
  <UsingTask TaskName="FindItemsFromPackages" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="ComputeRefAssembliesToPublish" Condition="'$(PreserveCompilationContext)' == 'true'" DependsOnTargets="ResolvePackageAssets;                             _ParseTargetManifestFiles" AfterTargets="ComputeFilesToPublish" BeforeTargets="CopyFilesToPublishDirectory" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <FindItemsFromPackages Items="@(RuntimeCopyLocalItems)" Packages="@(RuntimeStorePackages)">
      <Output TaskParameter="ItemsFromPackages" ItemName="_RuntimeItemsInRuntimeStore" />
    </FindItemsFromPackages>
    <ItemGroup>
      <!--
      Don't copy a compilation assembly if it's also a runtime assembly. There is no need to copy the same
      assembly to the 'refs' folder, if it is already in the publish directory.
      -->
      <_RefAssembliesToExclude Include="@(ResolvedAssembliesToPublish->'%(FullPath)')" />
      <!--
      Similarly, don't copy a compilation assembly if it's also a runtime assembly that is in a runtime store.
      It will be resolved from the runtime store directory at runtime.
      -->
      <_RefAssembliesToExclude Include="@(_RuntimeItemsInRuntimeStore)" />
      <ResolvedFileToPublish Include="@(ReferencePath)" Exclude="@(_RefAssembliesToExclude)">
        <RelativePath>$(RefAssembliesFolderName)\%(Filename)%(Extension)</RelativePath>
      </ResolvedFileToPublish>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
                                        _CopyReferenceOnlyAssembliesForBuild

    Copies reference assemblies that normally can't be resolved at runtime to the 'refs' folder in the build output.
    This is necessary in order for the running app to resolve these reference assemblies.
    ============================================================
    -->
  <Target Name="_CopyReferenceOnlyAssembliesForBuild" Condition="'$(PreserveCompilationContext)' == 'true'" DependsOnTargets="_ComputeReferenceAssemblies" AfterTargets="CopyFilesToOutputDirectory" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <Copy SourceFiles="@(_ReferenceOnlyAssemblies)" DestinationFolder="$(OutDir)$(RefAssembliesFolderName)" SkipUnchangedFiles="$(SkipCopyUnchangedFiles)" OverwriteReadOnlyFiles="$(OverwriteReadOnlyFiles)" Retries="$(CopyRetryCount)" RetryDelayMilliseconds="$(CopyRetryDelayMilliseconds)" UseHardlinksIfPossible="$(CreateHardLinksForCopyFilesToOutputDirectoryIfPossible)" UseSymboliclinksIfPossible="$(CreateSymbolicLinksForCopyFilesToOutputDirectoryIfPossible)">
      <Output TaskParameter="DestinationFiles" ItemName="FileWrites" />
    </Copy>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  <Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.ConflictResolution.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.ConflictResolution.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.ConflictResolution.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="Microsoft.NET.DefaultPackageConflictOverrides.targets">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.DefaultPackageConflictOverrides.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
Microsoft.NET.DefaultPackageConflictOverrides.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved. 
***********************************************************************************************
-->
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <ItemGroup Condition="'$(DisableDefaultPackageConflictOverrides)' != 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageConflictOverrides Include="Microsoft.NETCore.App">
      <OverriddenPackages>
        Microsoft.CSharp|4.4.0;
        Microsoft.Win32.Primitives|4.3.0;
        Microsoft.Win32.Registry|4.4.0;
        runtime.debian.8-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.fedora.23-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.fedora.24-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.opensuse.13.2-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.opensuse.42.1-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.osx.10.10-x64.runtime.native.System.Security.Cryptography.Apple|4.3.0;
        runtime.osx.10.10-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.rhel.7-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.ubuntu.14.04-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.ubuntu.16.04-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        runtime.ubuntu.16.10-x64.runtime.native.System.Security.Cryptography.OpenSsl|4.3.0;
        System.AppContext|4.3.0;
        System.Buffers|4.4.0;
        System.Collections|4.3.0;
        System.Collections.Concurrent|4.3.0;
        System.Collections.Immutable|1.4.0;
        System.Collections.NonGeneric|4.3.0;
        System.Collections.Specialized|4.3.0;
        System.ComponentModel|4.3.0;
        System.ComponentModel.EventBasedAsync|4.3.0;
        System.ComponentModel.Primitives|4.3.0;
        System.ComponentModel.TypeConverter|4.3.0;
        System.Console|4.3.0;
        System.Data.Common|4.3.0;
        System.Diagnostics.Contracts|4.3.0;
        System.Diagnostics.Debug|4.3.0;
        System.Diagnostics.DiagnosticSource|4.4.0;
        System.Diagnostics.FileVersionInfo|4.3.0;
        System.Diagnostics.Process|4.3.0;
        System.Diagnostics.StackTrace|4.3.0;
        System.Diagnostics.TextWriterTraceListener|4.3.0;
        System.Diagnostics.Tools|4.3.0;
        System.Diagnostics.TraceSource|4.3.0;
        System.Diagnostics.Tracing|4.3.0;
        System.Dynamic.Runtime|4.3.0;
        System.Globalization|4.3.0;
        System.Globalization.Calendars|4.3.0;
        System.Globalization.Extensions|4.3.0;
        System.IO|4.3.0;
        System.IO.Compression|4.3.0;
        System.IO.Compression.ZipFile|4.3.0;
        System.IO.FileSystem|4.3.0;
        System.IO.FileSystem.AccessControl|4.4.0;
        System.IO.FileSystem.DriveInfo|4.3.0;
        System.IO.FileSystem.Primitives|4.3.0;
        System.IO.FileSystem.Watcher|4.3.0;
        System.IO.IsolatedStorage|4.3.0;
        System.IO.MemoryMappedFiles|4.3.0;
        System.IO.Pipes|4.3.0;
        System.IO.UnmanagedMemoryStream|4.3.0;
        System.Linq|4.3.0;
        System.Linq.Expressions|4.3.0;
        System.Linq.Queryable|4.3.0;
        System.Net.Http|4.3.0;
        System.Net.NameResolution|4.3.0;
        System.Net.Primitives|4.3.0;
        System.Net.Requests|4.3.0;
        System.Net.Security|4.3.0;
        System.Net.Sockets|4.3.0;
        System.Net.WebHeaderCollection|4.3.0;
        System.ObjectModel|4.3.0;
        System.Private.DataContractSerialization|4.3.0;
        System.Reflection|4.3.0;
        System.Reflection.Emit|4.3.0;
        System.Reflection.Emit.ILGeneration|4.3.0;
        System.Reflection.Emit.Lightweight|4.3.0;
        System.Reflection.Extensions|4.3.0;
        System.Reflection.Metadata|1.5.0;
        System.Reflection.Primitives|4.3.0;
        System.Reflection.TypeExtensions|4.3.0;
        System.Resources.ResourceManager|4.3.0;
        System.Runtime|4.3.0;
        System.Runtime.Extensions|4.3.0;
        System.Runtime.Handles|4.3.0;
        System.Runtime.InteropServices|4.3.0;
        System.Runtime.InteropServices.RuntimeInformation|4.3.0;
        System.Runtime.Loader|4.3.0;
        System.Runtime.Numerics|4.3.0;
        System.Runtime.Serialization.Formatters|4.3.0;
        System.Runtime.Serialization.Json|4.3.0;
        System.Runtime.Serialization.Primitives|4.3.0;
        System.Security.AccessControl|4.4.0;
        System.Security.Claims|4.3.0;
        System.Security.Cryptography.Algorithms|4.3.0;
        System.Security.Cryptography.Cng|4.4.0;
        System.Security.Cryptography.Csp|4.3.0;
        System.Security.Cryptography.Encoding|4.3.0;
        System.Security.Cryptography.OpenSsl|4.4.0;
        System.Security.Cryptography.Primitives|4.3.0;
        System.Security.Cryptography.X509Certificates|4.3.0;
        System.Security.Cryptography.Xml|4.4.0;
        System.Security.Principal|4.3.0;
        System.Security.Principal.Windows|4.4.0;
        System.Text.Encoding|4.3.0;
        System.Text.Encoding.Extensions|4.3.0;
        System.Text.RegularExpressions|4.3.0;
        System.Threading|4.3.0;
        System.Threading.Overlapped|4.3.0;
        System.Threading.Tasks|4.3.0;
        System.Threading.Tasks.Extensions|4.3.0;
        System.Threading.Tasks.Parallel|4.3.0;
        System.Threading.Thread|4.3.0;
        System.Threading.ThreadPool|4.3.0;
        System.Threading.Timer|4.3.0;
        System.ValueTuple|4.3.0;
        System.Xml.ReaderWriter|4.3.0;
        System.Xml.XDocument|4.3.0;
        System.Xml.XmlDocument|4.3.0;
        System.Xml.XmlSerializer|4.3.0;
        System.Xml.XPath|4.3.0;
        System.Xml.XPath.XDocument|4.3.0;
      </OverriddenPackages>
    </PackageConflictOverrides>
    <PackageConflictOverrides Include="NETStandard.Library">
      <OverriddenPackages>
        Microsoft.Win32.Primitives|4.3.0;
        System.AppContext|4.3.0;
        System.Collections|4.3.0;
        System.Collections.Concurrent|4.3.0;
        System.Collections.Immutable|1.4.0;
        System.Collections.NonGeneric|4.3.0;
        System.Collections.Specialized|4.3.0;
        System.ComponentModel|4.3.0;
        System.ComponentModel.EventBasedAsync|4.3.0;
        System.ComponentModel.Primitives|4.3.0;
        System.ComponentModel.TypeConverter|4.3.0;
        System.Console|4.3.0;
        System.Data.Common|4.3.0;
        System.Diagnostics.Contracts|4.3.0;
        System.Diagnostics.Debug|4.3.0;
        System.Diagnostics.FileVersionInfo|4.3.0;
        System.Diagnostics.Process|4.3.0;
        System.Diagnostics.StackTrace|4.3.0;
        System.Diagnostics.TextWriterTraceListener|4.3.0;
        System.Diagnostics.Tools|4.3.0;
        System.Diagnostics.TraceSource|4.3.0;
        System.Diagnostics.Tracing|4.3.0;
        System.Dynamic.Runtime|4.3.0;
        System.Globalization|4.3.0;
        System.Globalization.Calendars|4.3.0;
        System.Globalization.Extensions|4.3.0;
        System.IO|4.3.0;
        System.IO.Compression|4.3.0;
        System.IO.Compression.ZipFile|4.3.0;
        System.IO.FileSystem|4.3.0;
        System.IO.FileSystem.DriveInfo|4.3.0;
        System.IO.FileSystem.Primitives|4.3.0;
        System.IO.FileSystem.Watcher|4.3.0;
        System.IO.IsolatedStorage|4.3.0;
        System.IO.MemoryMappedFiles|4.3.0;
        System.IO.Pipes|4.3.0;
        System.IO.UnmanagedMemoryStream|4.3.0;
        System.Linq|4.3.0;
        System.Linq.Expressions|4.3.0;
        System.Linq.Queryable|4.3.0;
        System.Net.Http|4.3.0;
        System.Net.NameResolution|4.3.0;
        System.Net.Primitives|4.3.0;
        System.Net.Requests|4.3.0;
        System.Net.Security|4.3.0;
        System.Net.Sockets|4.3.0;
        System.Net.WebHeaderCollection|4.3.0;
        System.ObjectModel|4.3.0;
        System.Private.DataContractSerialization|4.3.0;
        System.Reflection|4.3.0;
        System.Reflection.Emit|4.3.0;
        System.Reflection.Emit.ILGeneration|4.3.0;
        System.Reflection.Emit.Lightweight|4.3.0;
        System.Reflection.Extensions|4.3.0;
        System.Reflection.Primitives|4.3.0;
        System.Reflection.TypeExtensions|4.3.0;
        System.Resources.ResourceManager|4.3.0;
        System.Runtime|4.3.0;
        System.Runtime.Extensions|4.3.0;
        System.Runtime.Handles|4.3.0;
        System.Runtime.InteropServices|4.3.0;
        System.Runtime.InteropServices.RuntimeInformation|4.3.0;
        System.Runtime.Loader|4.3.0;
        System.Runtime.Numerics|4.3.0;
        System.Runtime.Serialization.Formatters|4.3.0;
        System.Runtime.Serialization.Json|4.3.0;
        System.Runtime.Serialization.Primitives|4.3.0;
        System.Security.AccessControl|4.4.0;
        System.Security.Claims|4.3.0;
        System.Security.Cryptography.Algorithms|4.3.0;
        System.Security.Cryptography.Csp|4.3.0;
        System.Security.Cryptography.Encoding|4.3.0;
        System.Security.Cryptography.Primitives|4.3.0;
        System.Security.Cryptography.X509Certificates|4.3.0;
        System.Security.Cryptography.Xml|4.4.0;
        System.Security.Principal|4.3.0;
        System.Security.Principal.Windows|4.4.0;
        System.Text.Encoding|4.3.0;
        System.Text.Encoding.Extensions|4.3.0;
        System.Text.RegularExpressions|4.3.0;
        System.Threading|4.3.0;
        System.Threading.Overlapped|4.3.0;
        System.Threading.Tasks|4.3.0;
        System.Threading.Tasks.Extensions|4.3.0;
        System.Threading.Tasks.Parallel|4.3.0;
        System.Threading.Thread|4.3.0;
        System.Threading.ThreadPool|4.3.0;
        System.Threading.Timer|4.3.0;
        System.ValueTuple|4.3.0;
        System.Xml.ReaderWriter|4.3.0;
        System.Xml.XDocument|4.3.0;
        System.Xml.XmlDocument|4.3.0;
        System.Xml.XmlSerializer|4.3.0;
        System.Xml.XPath|4.3.0;
        System.Xml.XPath.XDocument|4.3.0;
      </OverriddenPackages>
    </PackageConflictOverrides>
  </ItemGroup>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.ConflictResolution.targets
============================================================================================================================================
-->
  <UsingTask TaskName="ResolvePackageFileConflicts" AssemblyFile="$(MicrosoftNETBuildTasksAssembly)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="_HandlePackageFileConflicts" DependsOnTargets="GetReferenceAssemblyPaths" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup Condition="'$(CopyLocalLockFileAssemblies)' != 'true'">
      <!-- We need to find all the files that will be loaded from deps for conflict resolution.
          To do this, we look at the files that would be copied local when CopyLocalLockFileAssemblies is true.
          However, if CopyLocalLockFileAssemblies is true, then we don't add these items, as they
          will always be included in ReferenceCopyLocalPaths.
          -->
      <_LockFileAssemblies Include="@(RuntimeCopyLocalItems)" />
      <_LockFileAssemblies Include="@(NativeCopyLocalItems)" />
      <_LockFileAssemblies Include="@(ResourceCopyLocalItems)" />
    </ItemGroup>
    <!-- Also include RuntimeTarget items, which aren't ever included in ReferenceCopyLocalPaths, but need to be considered
         for conflict resolution. -->
    <ItemGroup>
      <_LockFileAssemblies Include="@(ResolvedRuntimeTargets)" />
    </ItemGroup>
    <ResolvePackageFileConflicts References="@(Reference)" ReferenceCopyLocalPaths="@(ReferenceCopyLocalPaths)" OtherRuntimeItems="@(_LockFileAssemblies)" PlatformManifests="@(PackageConflictPlatformManifests)" TargetFrameworkDirectories="$(TargetFrameworkDirectory)" PackageOverrides="@(PackageConflictOverrides)" PreferredPackages="$(PackageConflictPreferredPackages)">
      <Output TaskParameter="ReferencesWithoutConflicts" ItemName="_ReferencesWithoutConflicts" />
      <Output TaskParameter="ReferenceCopyLocalPathsWithoutConflicts" ItemName="_ReferenceCopyLocalPathsWithoutConflicts" />
      <Output TaskParameter="Conflicts" ItemName="_ConflictPackageFiles" />
    </ResolvePackageFileConflicts>
    <!-- Replace Reference / ReferenceCopyLocalPaths with the filtered lists.
         We must remove all and include rather than just remove since removal is based
         only on ItemSpec and duplicate ItemSpecs may exist with different metadata 
         (eg: HintPath) -->
    <ItemGroup>
      <Reference Remove="@(Reference)" />
      <Reference Include="@(_ReferencesWithoutConflicts)" />
      <ReferenceCopyLocalPaths Remove="@(ReferenceCopyLocalPaths)" />
      <ReferenceCopyLocalPaths Include="@(_ReferenceCopyLocalPathsWithoutConflicts)" />
    </ItemGroup>
  </Target>
  <Target Name="_HandlePublishFileConflicts" AfterTargets="RunResolvePublishAssemblies" DependsOnTargets="GetReferenceAssemblyPaths" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ResolvePackageFileConflicts ReferenceCopyLocalPaths="@(ResolvedAssembliesToPublish)" PlatformManifests="@(PackageConflictPlatformManifests)" TargetFrameworkDirectories="$(TargetFrameworkDirectory)" PreferredPackages="$(PackageConflictPreferredPackages)">
      <Output TaskParameter="ReferenceCopyLocalPathsWithoutConflicts" ItemName="_ResolvedAssembliesToPublishWithoutConflicts" />
      <Output TaskParameter="Conflicts" ItemName="_PublishConflictPackageFiles" />
    </ResolvePackageFileConflicts>
    <ItemGroup>
      <ResolvedAssembliesToPublish Remove="@(ResolvedAssembliesToPublish)" />
      <ResolvedAssembliesToPublish Include="@(_ResolvedAssembliesToPublishWithoutConflicts)" />
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\targets\Microsoft.NET.Sdk.targets
============================================================================================================================================
-->
  <!--<Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Sdk.CSharp.targets" Condition="'$(Language)' == 'C#'" />-->
  <!--<Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Sdk.VisualBasic.targets" Condition="'$(Language)' == 'VB'" />-->
  <!--<Import Project="$(MSBuildThisFileDirectory)Microsoft.NET.Sdk.FSharp.targets" Condition="'$(Language)' == 'F#'" />-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.targets
============================================================================================================================================
-->
  <!-- Import targets from NuGet.Build.Tasks.Pack package/Sdk -->
  <PropertyGroup Condition="'$(NuGetBuildTasksPackTargets)' == '' AND '$(ImportNuGetBuildTasksPackTargetsFromSdk)' != 'false'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IncludeBuildOutput Condition=" '$(PackAsTool)' == 'true' ">false</IncludeBuildOutput>
    <PackageType Condition=" '$(PackAsTool)' == 'true' ">DotnetTool</PackageType>
    <NuGetBuildTasksPackTargets Condition="'$(IsCrossTargetingBuild)' == 'true'">$(MSBuildThisFileDirectory)..\..\NuGet.Build.Tasks.Pack\buildCrossTargeting\NuGet.Build.Tasks.Pack.targets</NuGetBuildTasksPackTargets>
    <NuGetBuildTasksPackTargets Condition="'$(IsCrossTargetingBuild)' != 'true'">$(MSBuildThisFileDirectory)..\..\NuGet.Build.Tasks.Pack\build\NuGet.Build.Tasks.Pack.targets</NuGetBuildTasksPackTargets>
    <ImportNuGetBuildTasksPackTargetsFromSdk>true</ImportNuGetBuildTasksPackTargetsFromSdk>
  </PropertyGroup>
  <!--
============================================================================================================================================
  <Import Project="$(NuGetBuildTasksPackTargets)" Condition="Exists('$(NuGetBuildTasksPackTargets)') AND '$(ImportNuGetBuildTasksPackTargetsFromSdk)' == 'true'">

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\NuGet.Build.Tasks.Pack\build\NuGet.Build.Tasks.Pack.targets
============================================================================================================================================
-->
  <!--
***********************************************************************************************
NuGet.targets

WARNING:  DO NOT MODIFY this file unless you are knowledgeable about MSBuild and have
          created a backup copy.  Incorrect changes to this file will make it
          impossible to load or build your projects from the command-line or the IDE.

Copyright (c) .NET Foundation. All rights reserved.
***********************************************************************************************
-->
  <!-- Load NuGet.Build.Tasks.Pack.dll, this can be overridden to use a different version with $(NuGetPackTaskAssemblyFile) -->
  <PropertyGroup Condition="$(NuGetPackTaskAssemblyFile) == ''" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <NuGetPackTaskAssemblyFile Condition="'$(MSBuildRuntimeType)' == 'Core'">..\CoreCLR\NuGet.Build.Tasks.Pack.dll</NuGetPackTaskAssemblyFile>
    <NuGetPackTaskAssemblyFile Condition="'$(MSBuildRuntimeType)' != 'Core'">..\Desktop\NuGet.Build.Tasks.Pack.dll</NuGetPackTaskAssemblyFile>
    <MSBuildAllProjects>$(MSBuildAllProjects);$(MSBuildThisFileFullPath)</MSBuildAllProjects>
  </PropertyGroup>
  <UsingTask TaskName="NuGet.Build.Tasks.Pack.PackTask" AssemblyFile="$(NuGetPackTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.Pack.GetPackOutputItemsTask" AssemblyFile="$(NuGetPackTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.GetProjectTargetFrameworksTask" AssemblyFile="$(NuGetPackTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.Pack.GetProjectReferencesFromAssetsFileTask" AssemblyFile="$(NuGetPackTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <UsingTask TaskName="NuGet.Build.Tasks.Pack.IsPackableFalseWarningTask" AssemblyFile="$(NuGetPackTaskAssemblyFile)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <PropertyGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PackageId Condition=" '$(PackageId)' == '' ">$(AssemblyName)</PackageId>
    <PackageVersion Condition=" '$(PackageVersion)' == '' ">$(Version)</PackageVersion>
    <IncludeContentInPack Condition="'$(IncludeContentInPack)'==''">true</IncludeContentInPack>
    <GenerateNuspecDependsOn>_LoadPackInputItems; _GetTargetFrameworksOutput; _WalkEachTargetPerFramework; _GetPackageFiles; $(GenerateNuspecDependsOn)</GenerateNuspecDependsOn>
    <PackageDescription Condition="'$(PackageDescription)'==''">$(Description)</PackageDescription>
    <PackageDescription Condition="'$(PackageDescription)'==''">Package Description</PackageDescription>
    <IsPackable Condition="'$(IsPackable)'=='' AND '$(IsTestProject)'=='true'">false</IsPackable>
    <IsPackable Condition="'$(IsPackable)'==''">true</IsPackable>
    <IncludeBuildOutput Condition="'$(IncludeBuildOutput)'==''">true</IncludeBuildOutput>
    <BuildOutputTargetFolder Condition="'$(BuildOutputTargetFolder)' == '' AND '$(IsTool)' == 'true'">tools</BuildOutputTargetFolder>
    <BuildOutputTargetFolder Condition="'$(BuildOutputTargetFolder)' == ''">lib</BuildOutputTargetFolder>
    <ContentTargetFolders Condition="'$(ContentTargetFolders)' == ''">content;contentFiles</ContentTargetFolders>
    <PackDependsOn>$(BeforePack); _IntermediatePack; GenerateNuspec; $(PackDependsOn)</PackDependsOn>
    <IsInnerBuild Condition="'$(TargetFramework)' != '' AND '$(TargetFrameworks)' != ''">true</IsInnerBuild>
    <NoBuild Condition="'$(GeneratePackageOnBuild)' == 'true'">true</NoBuild>
    <AddPriFileDependsOn Condition="'$(MicrosoftPortableCurrentVersionPropsHasBeenImported)' == 'true'">DeterminePortableBuildCapabilities</AddPriFileDependsOn>
    <NuspecOutputPath Condition="'$(NuspecOutputPath)' == ''">$(BaseIntermediateOutputPath)$(Configuration)\</NuspecOutputPath>
    <WarnOnPackingNonPackableProject Condition="'$(WarnOnPackingNonPackableProject)' == ''">false</WarnOnPackingNonPackableProject>
    <ImportNuGetBuildTasksPackTargetsFromSdk Condition="'$(ImportNuGetBuildTasksPackTargetsFromSdk)' == ''">false</ImportNuGetBuildTasksPackTargetsFromSdk>
    <AllowedOutputExtensionsInPackageBuildOutputFolder>.dll; .exe; .winmd; .json; .pri; .xml; $(AllowedOutputExtensionsInPackageBuildOutputFolder)</AllowedOutputExtensionsInPackageBuildOutputFolder>
    <AllowedOutputExtensionsInSymbolsPackageBuildOutputFolder>.pdb; .mdb; $(AllowedOutputExtensionsInPackageBuildOutputFolder); $(AllowedOutputExtensionsInSymbolsPackageBuildOutputFolder)</AllowedOutputExtensionsInSymbolsPackageBuildOutputFolder>
  </PropertyGroup>
  <PropertyGroup Condition="'$(NoBuild)' == 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateNuspecDependsOn>$(GenerateNuspecDependsOn)</GenerateNuspecDependsOn>
  </PropertyGroup>
  <PropertyGroup Condition="'$(NoBuild)' != 'true' " xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <GenerateNuspecDependsOn>Build;$(GenerateNuspecDependsOn)</GenerateNuspecDependsOn>
  </PropertyGroup>
  <ItemGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ProjectCapability Include="Pack" />
  </ItemGroup>
  <ItemDefinitionGroup xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <BuildOutputInPackage>
      <TargetFramework>$(TargetFramework)</TargetFramework>
    </BuildOutputInPackage>
    <TfmSpecificPackageFile>
      <BuildAction>None</BuildAction>
    </TfmSpecificPackageFile>
  </ItemDefinitionGroup>
  <Target Name="_GetOutputItemsFromPack" Returns="@(_OutputPackItems)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ConvertToAbsolutePath Paths="$(PackageOutputPath)">
      <Output TaskParameter="AbsolutePaths" PropertyName="PackageOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <ConvertToAbsolutePath Paths="$(NuspecOutputPath)">
      <Output TaskParameter="AbsolutePaths" PropertyName="NuspecOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <GetPackOutputItemsTask PackageOutputPath="$(PackageOutputAbsolutePath)" NuspecOutputPath="$(NuspecOutputAbsolutePath)" PackageId="$(PackageId)" PackageVersion="$(PackageVersion)" IncludeSymbols="$(IncludeSymbols)" IncludeSource="$(IncludeSource)">
      <Output TaskParameter="OutputPackItems" ItemName="_OutputPackItems" />
    </GetPackOutputItemsTask>
  </Target>
  <!--
    ============================================================
    _GetTargetFrameworksOutput
    Read target frameworks from the project.
    ============================================================
  -->
  <Target Name="_GetTargetFrameworksOutput" Returns="@(_TargetFrameworks)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <_ProjectFrameworks />
    </PropertyGroup>
    <GetProjectTargetFrameworksTask ProjectPath="$(MSBuildProjectFullPath)" TargetFrameworks="$(TargetFrameworks)" TargetFramework="$(TargetFramework)" TargetFrameworkMoniker="$(TargetFrameworkMoniker)" TargetPlatformIdentifier="$(TargetPlatformIdentifier)" TargetPlatformVersion="$(TargetPlatformVersion)" TargetPlatformMinVersion="$(TargetPlatformMinVersion)">
      <Output TaskParameter="ProjectTargetFrameworks" PropertyName="_ProjectFrameworks" />
    </GetProjectTargetFrameworksTask>
    <ItemGroup Condition=" '$(_ProjectFrameworks)' != '' ">
      <_TargetFrameworks Include="$(_ProjectFrameworks.Split(';'))" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    Pack
    Post Build Target
    ============================================================
  -->
  <Target Name="_PackAsBuildAfterTarget" AfterTargets="Build" Condition="'$(GeneratePackageOnBuild)' == 'true' AND '$(IsInnerBuild)' != 'true'" DependsOnTargets="Pack" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" />
  <Target Name="_CleanPackageFiles" DependsOnTargets="_GetOutputItemsFromPack" AfterTargets="Clean" Condition="'$(GeneratePackageOnBuild)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_PackageFilesToDelete Include="@(_OutputPackItems)" />
    </ItemGroup>
    <Delete Files="@(_PackageFilesToDelete)" />
  </Target>
  <Target Name="_CalculateInputsOutputsForPack" DependsOnTargets="_GetOutputItemsFromPack" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup Condition="$(ContinuePackingAfterGeneratingNuspec) == '' ">
      <ContinuePackingAfterGeneratingNuspec>false</ContinuePackingAfterGeneratingNuspec>
    </PropertyGroup>
    <PropertyGroup>
      <PackageOutputPath Condition=" '$(PackageOutputPath)' == '' ">$(OutputPath)</PackageOutputPath>
      <RestoreOutputPath Condition=" '$(RestoreOutputPath)' == '' ">$(MSBuildProjectExtensionsPath)</RestoreOutputPath>
    </PropertyGroup>
    <ConvertToAbsolutePath Paths="$(NuspecOutputPath)">
      <Output TaskParameter="AbsolutePaths" PropertyName="NuspecOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <ConvertToAbsolutePath Paths="$(RestoreOutputPath)">
      <Output TaskParameter="AbsolutePaths" PropertyName="RestoreOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <ConvertToAbsolutePath Paths="$(PackageOutputPath)">
      <Output TaskParameter="AbsolutePaths" PropertyName="PackageOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <ConvertToAbsolutePath Condition="$(NuspecFile) != ''" Paths="$(NuspecFile)">
      <Output TaskParameter="AbsolutePaths" PropertyName="NuspecFileAbsolutePath" />
    </ConvertToAbsolutePath>
    <ItemGroup>
      <!--This catches changes to properties-->
      <NuGetPackInput Include="$(MSBuildAllProjects)" />
      <NuGetPackInput Include="@(_PackageFiles)" />
      <NuGetPackInput Include="@(_PackageFilesToExclude)" />
      <NuGetPackInput Include="@(_BuildOutputInPackage->'%(FinalOutputPath)')" />
      <NuGetPackInput Include="@(_TargetPathsToSymbols->'%(FinalOutputPath)')" />
      <NuGetPackInput Include="@(_SourceFiles)" />
      <NuGetPackInput Include="@(_References)" />
      <NuGetPackOutput Include="@(_OutputPackItems)" />
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    Pack
    Main entry point for packing packages
    ============================================================
  -->
  <Target Name="Pack" DependsOnTargets="$(PackDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <IsPackableFalseWarningTask Condition="'$(IsPackable)' == 'false' AND '$(WarnOnPackingNonPackableProject)' == 'true'" />
  </Target>
  <Target Name="_IntermediatePack" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <ContinuePackingAfterGeneratingNuspec>true</ContinuePackingAfterGeneratingNuspec>
    </PropertyGroup>
  </Target>
  <Target Name="GenerateNuspec" DependsOnTargets="$(GenerateNuspecDependsOn);_CalculateInputsOutputsForPack;_GetProjectReferenceVersions;_InitializeNuspecRepositoryInformationProperties" Condition="$(IsPackable) == 'true'" Inputs="@(NuGetPackInput)" Outputs="@(NuGetPackOutput)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Call Pack -->
    <PackTask PackItem="$(PackProjectInputFile)" PackageFiles="@(_PackageFiles)" PackageFilesToExclude="@(_PackageFilesToExclude)" PackageVersion="$(PackageVersion)" PackageId="$(PackageId)" Title="$(Title)" Authors="$(Authors)" Description="$(PackageDescription)" Copyright="$(Copyright)" RequireLicenseAcceptance="$(PackageRequireLicenseAcceptance)" LicenseUrl="$(PackageLicenseUrl)" ProjectUrl="$(PackageProjectUrl)" IconUrl="$(PackageIconUrl)" ReleaseNotes="$(PackageReleaseNotes)" Tags="$(PackageTags)" DevelopmentDependency="$(DevelopmentDependency)" BuildOutputInPackage="@(_BuildOutputInPackage)" ProjectReferencesWithVersions="@(_ProjectReferencesWithVersions)" TargetPathsToSymbols="@(_TargetPathsToSymbols)" TargetFrameworks="@(_TargetFrameworks)" AssemblyName="$(AssemblyName)" PackageOutputPath="$(PackageOutputAbsolutePath)" IncludeSymbols="$(IncludeSymbols)" IncludeSource="$(IncludeSource)" PackageTypes="$(PackageType)" IsTool="$(IsTool)" RepositoryUrl="$(RepositoryUrl)" RepositoryType="$(RepositoryType)" RepositoryBranch="$(RepositoryBranch)" RepositoryCommit="$(RepositoryCommit)" SourceFiles="@(_SourceFiles-&gt;Distinct())" NoPackageAnalysis="$(NoPackageAnalysis)" MinClientVersion="$(MinClientVersion)" Serviceable="$(Serviceable)" FrameworkAssemblyReferences="@(_FrameworkAssemblyReferences)" ContinuePackingAfterGeneratingNuspec="$(ContinuePackingAfterGeneratingNuspec)" NuspecOutputPath="$(NuspecOutputAbsolutePath)" IncludeBuildOutput="$(IncludeBuildOutput)" BuildOutputFolder="$(BuildOutputTargetFolder)" ContentTargetFolders="$(ContentTargetFolders)" RestoreOutputPath="$(RestoreOutputAbsolutePath)" NuspecFile="$(NuspecFileAbsolutePath)" NuspecBasePath="$(NuspecBasePath)" NuspecProperties="$(NuspecProperties)" AllowedOutputExtensionsInPackageBuildOutputFolder="$(AllowedOutputExtensionsInPackageBuildOutputFolder)" AllowedOutputExtensionsInSymbolsPackageBuildOutputFolder="$(AllowedOutputExtensionsInSymbolsPackageBuildOutputFolder)" NoWarn="$(NoWarn)" WarningsAsErrors="$(WarningsAsErrors)" TreatWarningsAsErrors="$(TreatWarningsAsErrors)" />
  </Target>
  <!--
    Initialize Repository* properties from properties set by a source control package, if available in the project.
  -->
  <Target Name="_InitializeNuspecRepositoryInformationProperties" DependsOnTargets="InitializeSourceControlInformation" Condition="'$(SourceControlInformationFeatureSupported)' == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
      <!-- The project must specify PublishRepositoryUrl=true in order to publish the URL, in order to prevent inadvertent leak of internal URL. -->
      <RepositoryUrl Condition="'$(RepositoryUrl)' == '' and '$(PublishRepositoryUrl)' == 'true'">$(PrivateRepositoryUrl)</RepositoryUrl>
      <RepositoryCommit Condition="'$(RepositoryCommit)' == ''">$(SourceRevisionId)</RepositoryCommit>
    </PropertyGroup>
  </Target>
  <!--
    ============================================================
    _LoadPackGraphEntryPoints
    Find project entry point and load them into items.
    ============================================================
  -->
  <Target Name="_LoadPackInputItems" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- Allow overriding items with PackProjectInputFile -->
    <PropertyGroup Condition="'$(PackProjectInputFile)' == ''">
      <PackProjectInputFile>$(MSBuildProjectFullPath)</PackProjectInputFile>
    </PropertyGroup>
  </Target>
  <Target Name="_GetProjectReferenceVersions" DependsOnTargets="_CalculateInputsOutputsForPack;$(GetPackageVersionDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ConvertToAbsolutePath Paths="$(RestoreOutputPath)">
      <Output TaskParameter="AbsolutePaths" PropertyName="RestoreOutputAbsolutePath" />
    </ConvertToAbsolutePath>
    <ConvertToAbsolutePath Condition="'$(ProjectAssetsFile)' != ''" Paths="$(ProjectAssetsFile)">
      <Output TaskParameter="AbsolutePaths" PropertyName="ProjectAssetsFileAbsolutePath" />
    </ConvertToAbsolutePath>
    <GetProjectReferencesFromAssetsFileTask RestoreOutputAbsolutePath="$(RestoreOutputAbsolutePath)" ProjectAssetsFileAbsolutePath="$(ProjectAssetsFileAbsolutePath)">
      <Output TaskParameter="ProjectReferences" ItemName="_ProjectReferencesFromAssetsFile" />
    </GetProjectReferencesFromAssetsFileTask>
    <Msbuild Projects="@(_ProjectReferencesFromAssetsFile)" Targets="_GetProjectVersion" SkipNonexistentTargets="true" SkipNonexistentProjects="true" Properties="BuildProjectReferences=false;">
      <Output TaskParameter="TargetOutputs" ItemName="_ProjectReferencesWithVersions" />
    </Msbuild>
  </Target>
  <Target Name="_GetProjectVersion" DependsOnTargets="$(GetPackageVersionDependsOn)" Returns="@(_ProjectPathWithVersion)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_ProjectPathWithVersion Include="$(MSBuildProjectFullPath)">
        <ProjectVersion Condition="'$(PackageVersion)' != ''">$(PackageVersion)</ProjectVersion>
        <ProjectVersion Condition="'$(PackageVersion)' == ''">1.0.0</ProjectVersion>
      </_ProjectPathWithVersion>
    </ItemGroup>
  </Target>
  <Target Name="_WalkEachTargetPerFramework" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <MSBuild Condition="'$(IncludeBuildOutput)' == 'true'" Projects="$(MSBuildProjectFullPath)" Targets="_GetBuildOutputFilesWithTfm" Properties="TargetFramework=%(_TargetFrameworks.Identity);">
      <Output TaskParameter="TargetOutputs" ItemName="_BuildOutputInPackage" />
    </MSBuild>
    <MSBuild Condition="'$(TargetsForTfmSpecificContentInPackage)' != ''" Projects="$(MSBuildProjectFullPath)" Targets="_GetTfmSpecificContentForPackage" Properties="TargetFramework=%(_TargetFrameworks.Identity);">
      <Output TaskParameter="TargetOutputs" ItemName="_PackageFiles" />
    </MSBuild>
    <MSBuild Condition="'$(IncludeBuildOutput)' == 'true'" Projects="$(MSBuildProjectFullPath)" Targets="_GetDebugSymbolsWithTfm" Properties="TargetFramework=%(_TargetFrameworks.Identity);">
      <Output TaskParameter="TargetOutputs" ItemName="_TargetPathsToSymbols" />
    </MSBuild>
    <MSBuild Condition="'$(IncludeSource)' == 'true'" Projects="$(MSBuildProjectFullPath)" Targets="SourceFilesProjectOutputGroup" Properties="TargetFramework=%(_TargetFrameworks.Identity);                   BuildProjectReferences=false;">
      <Output TaskParameter="TargetOutputs" ItemName="_SourceFiles" />
    </MSBuild>
    <MSBuild Projects="$(MSBuildProjectFullPath)" Targets="_GetFrameworkAssemblyReferences" Properties="TargetFramework=%(_TargetFrameworks.Identity);                   BuildProjectReferences=false;">
      <Output TaskParameter="TargetOutputs" ItemName="_FrameworkAssemblyReferences" />
    </MSBuild>
  </Target>
  <Target Name="_GetFrameworkAssemblyReferences" DependsOnTargets="ResolveReferences" Returns="@(TfmSpecificFrameworkAssemblyReferences)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <TfmSpecificFrameworkAssemblyReferences Include="@(ReferencePath->'%(OriginalItemSpec)')" Condition="'%(ReferencePath.Pack)' != 'false' AND '%(ReferencePath.ResolvedFrom)' == '{TargetFrameworkDirectory}'">
        <TargetFramework>$(TargetFramework)</TargetFramework>
      </TfmSpecificFrameworkAssemblyReferences>
    </ItemGroup>
  </Target>
  <Target Name="_GetBuildOutputFilesWithTfm" DependsOnTargets="BuiltProjectOutputGroup;DocumentationProjectOutputGroup;SatelliteDllsProjectOutputGroup;_AddPriFileToPackBuildOutput;$(TargetsForTfmSpecificBuildOutput)" Returns="@(BuildOutputInPackage)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <BuildOutputInPackage Include="@(SatelliteDllsProjectOutputGroupOutput);                             @(BuiltProjectOutputGroupOutput);                             @(DocumentationProjectOutputGroupOutput);                             @(_PathToPriFile)" />
    </ItemGroup>
  </Target>
  <Target Name="_GetTfmSpecificContentForPackage" DependsOnTargets="$(TargetsForTfmSpecificContentInPackage)" Returns="@(TfmSpecificPackageFileWithRecursiveDir)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <!-- The below workaround needs to be done due to msbuild bug https://github.com/Microsoft/msbuild/issues/3121 -->
    <ItemGroup>
      <TfmSpecificPackageFileWithRecursiveDir Include="@(TfmSpecificPackageFile)">
        <NuGetRecursiveDir>%(TfmSpecificPackageFile.RecursiveDir)</NuGetRecursiveDir>
      </TfmSpecificPackageFileWithRecursiveDir>
    </ItemGroup>
  </Target>
  <Target Name="_GetDebugSymbolsWithTfm" DependsOnTargets="DebugSymbolsProjectOutputGroup" Returns="@(_TargetPathsToSymbolsWithTfm)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_TargetPathsToSymbolsWithTfm Include="@(DebugSymbolsProjectOutputGroupOutput)">
        <TargetFramework>$(TargetFramework)</TargetFramework>
      </_TargetPathsToSymbolsWithTfm>
    </ItemGroup>
  </Target>
  <!--Projects with target framework like UWP, Win8, wpa81 produce a Pri file
    in their bin dir. This Pri file is not included in the BuiltProjectGroupOutput, and
    has to be added manually here.-->
  <Target Name="_AddPriFileToPackBuildOutput" Returns="@(_PathToPriFile)" DependsOnTargets="$(AddPriFileDependsOn)" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup Condition="'$(IncludeProjectPriFile)' == 'true'">
      <_PathToPriFile Include="$(ProjectPriFullPath)">
        <FinalOutputPath>$(ProjectPriFullPath)</FinalOutputPath>
        <TargetPath>$(ProjectPriFileName)</TargetPath>
      </_PathToPriFile>
    </ItemGroup>
  </Target>
  <!--
    ============================================================
    _GetPackageFiles
    Entry point for generating the project to project references.
    ============================================================
  -->
  <Target Name="_GetPackageFiles" Condition="$(IncludeContentInPack) == 'true'" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <ItemGroup>
      <_PackageFilesToExclude Include="@(Content)" Condition="'%(Content.Pack)' == 'false'" />
    </ItemGroup>
    <!-- Include PackageFiles and Content of the project being packed -->
    <ItemGroup>
      <_PackageFiles Include="@(Content)" Condition=" %(Content.Pack) != 'false' ">
        <BuildAction Condition="'%(Content.BuildAction)' == ''">Content</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(Compile)" Condition=" %(Compile.Pack) == 'true' ">
        <BuildAction Condition="'%(Compile.BuildAction)' == ''">Compile</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(None)" Condition=" %(None.Pack) == 'true' ">
        <BuildAction Condition="'%(None.BuildAction)' == ''">None</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(EmbeddedResource)" Condition=" %(EmbeddedResource.Pack) == 'true' ">
        <BuildAction Condition="'%(EmbeddedResource.BuildAction)' == ''">EmbeddedResource</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(ApplicationDefinition)" Condition=" %(ApplicationDefinition.Pack) == 'true' ">
        <BuildAction Condition="'%(ApplicationDefinition.BuildAction)' == ''">ApplicationDefinition</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(Page)" Condition=" %(Page.Pack) == 'true' ">
        <BuildAction Condition="'%(Page.BuildAction)' == ''">Page</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(Resource)" Condition=" %(Resource.Pack) == 'true' ">
        <BuildAction Condition="'%(Resource.BuildAction)' == ''">Resource</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(SplashScreen)" Condition=" %(SplashScreen.Pack) == 'true' ">
        <BuildAction Condition="'%(SplashScreen.BuildAction)' == ''">SplashScreen</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(DesignData)" Condition=" %(DesignData.Pack) == 'true' ">
        <BuildAction Condition="'%(DesignData.BuildAction)' == ''">DesignData</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(DesignDataWithDesignTimeCreatableTypes)" Condition=" %(DesignDataWithDesignTimeCreatableTypes.Pack) == 'true' ">
        <BuildAction Condition="'%(DesignDataWithDesignTimeCreatableTypes.BuildAction)' == ''">DesignDataWithDesignTimeCreatableTypes</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(CodeAnalysisDictionary)" Condition=" %(CodeAnalysisDictionary.Pack) == 'true' ">
        <BuildAction Condition="'%(CodeAnalysisDictionary.BuildAction)' == ''">CodeAnalysisDictionary</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(AndroidAsset)" Condition=" %(AndroidAsset.Pack) == 'true' ">
        <BuildAction Condition="'%(AndroidAsset.BuildAction)' == ''">AndroidAsset</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(AndroidResource)" Condition=" %(AndroidResource.Pack) == 'true' ">
        <BuildAction Condition="'%(AndroidResource.BuildAction)' == ''">AndroidResource</BuildAction>
      </_PackageFiles>
      <_PackageFiles Include="@(BundleResource)" Condition=" %(BundleResource.Pack) == 'true' ">
        <BuildAction Condition="'%(BundleResource.BuildAction)' == ''">BundleResource</BuildAction>
      </_PackageFiles>
    </ItemGroup>
  </Target>
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\.dotnet\sdk\2.1.300\Sdks\Microsoft.NET.Sdk\Sdk\Sdk.targets
============================================================================================================================================
-->
  <!--
============================================================================================================================================
  </Import>

E:\gh\shawnro\core-setup\src\corehost\build.proj
============================================================================================================================================
-->
</Project>