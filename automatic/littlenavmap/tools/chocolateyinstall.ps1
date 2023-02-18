$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.8/LittleNavmap-win32-2.8.8.zip'
  checksum32    = '240d8ab07d4417a1c94506144c0875c59fbe6b8f01c43f540e410f3e6f9706fa'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.8/LittleNavmap-win64-2.8.8.zip'
  checksum64    = 'aa8ad24250a79ee06d7914ddedbfaf105000d80516c3b2858b008bc6e68cd71d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
