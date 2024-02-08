$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG56.0.0Setup.exe'
  checksum      = 'fe374d1e6022d9fac6d1c0ddcab1086743ea4e654441e2dbc5b33da2dbd51b44'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
