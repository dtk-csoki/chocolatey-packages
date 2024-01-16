﻿$ErrorActionPreference = 'Stop';

$packageArgs = @{
  AppxPackageName = 'KeeperSecurityInc.KeeperPasswordManager'
  packageName     = $env:ChocolateyPackageName  

  url             = 'https://www.keepersecurity.com/desktop_electron/Win32/KeeperSetup32.msi'
  checksum        = 'dcbec2f35a77d3fc24f7f8ea6eee23f9a1e91154ae5f6ab6c5d470a7eadf6fbe'
  checksumType    = 'sha256'  

  url64           = 'https://www.keepersecurity.com/desktop_electron/packages/KeeperPasswordManager.msixbundle'
  checksum64      = '12c7c1ea162d171cb85d8e4363b955a471c5ffdbfd51bbe55d09d6a59b9a0112'
  checksumType64  = 'sha256'  

  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

If (Get-OSArchitectureWidth -eq 64){
  # 64 bits
  #The .msixbundle format is not supported on Windows 10 version 1709 and 1803. https://docs.microsoft.com/en-us/windows/msix/msix-1709-and-1803-support
  $IsCorrectBuild=[Environment]::OSVersion.Version.Build
  If ($IsCorrectBuild -lt "18362") {
    Throw "This package requires at least Windows 10 version 1903/OS build 18362.x."
  }

  [version]$AppxVer = (Get-AppxPackage -name "$packageArgs.AppxPackageName").Version

  If ($AppxVer -gt [version]$version) {
    # you can't install an older version of an installed appx package, you'd need to remove it first
    Write-Warning "The installed $version version is newer than this package version, it may have autoupdated on your current OS..."
    } ElseIf ($AppxVer -Match [version]$version) {
      If($env:ChocolateyForce) {
        # you can't install the same version of an appx package, you need to remove it first
        Write-Host Removing already installed version first.
        Get-AppxPackage -Name $packageArgs.AppxPackageName | Remove-AppxPackage
      } else {
        Write-Host The $version version of KeeperPasswordManager is already installed. If you want to reinstall use --force
        return
      }
  }

  Add-AppPackage -Path $packageArgs.url64
} Else {
  # 32 bits
  Install-ChocolateyPackage @packageArgs
  # Install start menu shortcut
  $programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
  $target = "$env:LOCALAPPDATA\keeperpasswordmanager"
  $shortcutFilePath = Join-Path $programs "Keeper.lnk"
  $targetPath = Join-Path $target "keeperpasswordmanager.exe"
  Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
}

