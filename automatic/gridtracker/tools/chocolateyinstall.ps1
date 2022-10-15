$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.1010/GridTracker-Installer.1.22.1010.exe'
  checksum     = '40518bb738731b48676665540fde19afab9330107926d98e4dbb3dbe4ba23a88'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
