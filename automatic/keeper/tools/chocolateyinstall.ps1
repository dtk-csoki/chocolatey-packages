$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\KeeperSetup32.exe"
  file64        = "$toolsDir\KeeperSetup64.exe"

  url           = 'https://keepersecurity.com/desktop_electron/Win32/KeeperSetup32.zip'
  checksum      = '971a30c270277f5d8bb57b8bf2618d0ebd3f80b264e7b8d26fdada02ea7fca90'
  checksumType  = 'sha256'

  url64         = 'https://keepersecurity.com/desktop_electron/Win64/KeeperSetup64.zip'
  checksum64    = '648aaea476555c8adc5edc401bfb08b02923f629d47a4ca002cdae6d30fb717a'
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
