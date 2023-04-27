$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhusbdwin$(Get-OSArchitectureWidth).exe"

  url64          = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin64.exe'
  checksum64     = 'b4b98da4a6d43922b59b982f2c26eaba9fe911be905dd87d1c74564928c5a9ae'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Server.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
