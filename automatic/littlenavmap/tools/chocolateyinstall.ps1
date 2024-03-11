$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.4/LittleNavmap-win32-3.0.4.zip'
  checksum32    = 'bdcd6b8ad0fe74a17f55f4b180cff34590dd57f0a8d67cfd2967594c08dd6c91'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.4/LittleNavmap-win64-3.0.4.zip'
  checksum64    = '53abf887dd16a6b451071c38323ff804d3f4e6c6211fdec86fe9d3a947d387a7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
