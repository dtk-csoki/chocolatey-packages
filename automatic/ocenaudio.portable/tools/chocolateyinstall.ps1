$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_portable.zip'
  checksum       = '6fc2477619ab8a265881261c73be94409e77c77544ba81b7120b107fce23f31e'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64_portable.zip'
  checksum64     = '9460958ba46c958a6557c9bc07a539f864752dd264b877caf6ad6571d29ae29e'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Ocenaudio.lnk"
$targetPath = Join-Path $toolsDir "ocenaudio.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
