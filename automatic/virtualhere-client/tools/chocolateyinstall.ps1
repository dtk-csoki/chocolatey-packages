$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhui$(Get-OSArchitectureWidth).exe"

  url            = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui32.exe'
  checksum       = '47b08bb73f01aec8f928a2d7d43e1a09445807d2e8d89a2b82c25ab101b5e4a9'
  checksumType   = 'sha256'

  url64          = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
  checksum64     = '6629edaaa1b65d3511338931d5202bbe02af373d1982fddec761bba8f143d0b0'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Client.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
