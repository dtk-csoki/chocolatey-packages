$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.6/LittleNavmap-win32-3.0.6.zip'
  checksum32    = '719f63f2ec069000c05e120fd8884b201e818faea554b54e4fab6e620f2d1eaf'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.6/LittleNavmap-win64-3.0.6.zip'
  checksum64    = 'c81de159ce2b04583f220e222425ac26e280aa641e76d78671f46be603168786'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
