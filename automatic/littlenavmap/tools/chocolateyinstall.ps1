$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.10/LittleNavmap-win32-2.8.10.zip'
  checksum32    = 'cdfbad4d311e58d2e38e0f09a14eca7404301a0a4e27735a39b6c60ca20c3291'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v2.8.10/LittleNavmap-win64-2.8.10.zip'
  checksum64    = '3f30d0eccd7b5892b3b31a37376600cb78e3c891c99f80f807aedc9acf7dd71a'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
