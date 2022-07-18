c$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\KeeperSetup32.exe"
  file64        = "$toolsDir\KeeperSetup64.exe"

  url           = 'https://keepersecurity.com/desktop_electron/Win32/KeeperSetup32.zip'
  checksum      = '3D75D19A268F2E0FF4247D64191BBCFB857AB2B5B8DAAB92DFF73A508B6F01E1'
  checksumType  = 'sha256'

  url64         = 'https://keepersecurity.com/desktop_electron/Win64/KeeperSetup64.zip'
  checksum64    = '0376A8024CFF1A4D90A80A2305846414CCC5A383F605C39E8C3F4AE1F9CE6B6E'
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
