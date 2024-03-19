$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG59.0.0Setup.exe'
  checksum      = 'd0c1ee8516627458c3313dae092973a35dcc32f15d0e3a306ca332b289c5e74c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
