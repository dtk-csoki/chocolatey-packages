$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//olivierkes/manuskript/releases/download/0.15.0/manuskript-0.15.0-windows.zip'
  checksum      = 'ED107929D25B2A6AEBB257F671A4FB0C8836D1E0F282BBF5CBA2797D90749A15'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Manuskript.lnk"
$targetPath = Join-Path $toolsDir "manuskript\manuskript.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
