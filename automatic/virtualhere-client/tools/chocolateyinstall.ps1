$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhui$(Get-OSArchitectureWidth).exe"

  url64          = 'https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe'
  checksum64     = '6dee94cfe6e99a13079f3a7248f25af7a86e65a1294ce999b77a5aaa3806b5fc'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Client.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
