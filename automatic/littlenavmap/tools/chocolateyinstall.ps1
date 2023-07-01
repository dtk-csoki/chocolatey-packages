$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.11/LittleNavmap-win32-2.8.11.zip'
  checksum32    = 'b321c68bb4ed130097cbc2686bb27c8f109603cddb22c92d245b996e3d89f02d'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.11/LittleNavmap-win64-2.8.11.zip'
  checksum64    = 'c3a220192d7fb25c43c83e2ab72d3959727aaf65a26f3664da860980d75d7d51'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
