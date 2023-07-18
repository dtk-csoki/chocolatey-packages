$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.12/LittleNavmap-win32-2.8.12.zip'
  checksum32    = 'c33b15a0a9d5454f3b22c9e1b664e2eddf64f553ef33ec4220765093888321e0'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.12/LittleNavmap-win64-2.8.12.zip'
  checksum64    = '9e5af4150c7bb94d7f8b6ef50d4029faf46f8887ec77c4a930c8e9fce84ac934'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
