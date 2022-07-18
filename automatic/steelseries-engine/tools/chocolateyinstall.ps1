$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG21.0.0Setup.exe'
  checksum      = '2186820FF4FE16274D69F12ACFF85A629249A42B2F42715538553301E491367F'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
