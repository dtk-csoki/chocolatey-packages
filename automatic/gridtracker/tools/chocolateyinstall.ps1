$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.1009/GridTracker-Installer.1.22.1009.exe'
  checksum     = '6b58d0bc68b5c25c469131a41d1c4a333a547c463f7e95276dd625022b525520'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
