$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG55.0.0Setup.exe'
  checksum      = 'cacd9a8b4365e21ced1321a020e9603bf94a85e52973f0011271ad8ab2897265'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
