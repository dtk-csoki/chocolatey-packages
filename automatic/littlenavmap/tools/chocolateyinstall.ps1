$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.5/LittleNavmap-win32-3.0.5.zip'
  checksum32    = '04b90afe994ae4c806f40e522134a9253413c2b44a85cbe26c600c263c063b6e'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.5/LittleNavmap-win64-3.0.5.zip'
  checksum64    = '750d0fbee6ad8710b3bb93278a8ecb40e12443488b32448396188805218bba89'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
