$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.9/LittleNavmap-win32-2.8.9.zip'
  checksum32    = '7a390e5347e8519cffbc381396a18b95277592587c5ee311117044b9dfd30e1b'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.9/LittleNavmap-win64-2.8.9.zip'
  checksum64    = '6772b0615ab132b7f757a9ea7c4682020b3b720c60a0e04007ef290630e6624f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
