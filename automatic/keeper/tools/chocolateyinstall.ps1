$ErrorActionPreference = 'Stop';

$packageArgs = @{
  AppxPackageName = 'KeeperSecurityInc.KeeperPasswordManager'
  packageName     = $env:ChocolateyPackageName

  url             = 'https://www.keepersecurity.com/desktop_electron/Win32/KeeperSetup32.msi'
  checksum        = '21b829a2eeb9ad135b073e0b4242e48cd4f07b8ce24ba1b955ad27bc16408876'
  checksumType    = 'sha256'

  url64           = 'https://www.keepersecurity.com/desktop_electron/packages/KeeperPasswordManager.msixbundle'
  checksum64      = '7b31bb10f0ec1d39946411e812929afbff30eebb6aba62bf5661365551040111'
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

