$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\KeeperSetup32.exe"
  file64        = "$toolsDir\KeeperSetup64.exe"

  url           = 'https://keepersecurity.com/desktop_electron/Win32/KeeperSetup32.zip'
  checksum      = '2a56ba35fd483be1057b1e7fc54cc33df5e3c9cf97a6c8db3801889d38c4f3ba'
  checksumType  = 'sha256'

  url64         = 'https://keepersecurity.com/desktop_electron/Win64/KeeperSetup64.zip'
  checksum64    = 'c485a4b6d43f5712230e3b90740574ffab461cb9de8e5ed7a1d34c012215e2b1'
  checksumType64= 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$target = "$env:LOCALAPPDATA\keeperpasswordmanager"
$shortcutFilePath = Join-Path $programs "Keeper.lnk"
$targetPath = Join-Path $target "keeperpasswordmanager.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
