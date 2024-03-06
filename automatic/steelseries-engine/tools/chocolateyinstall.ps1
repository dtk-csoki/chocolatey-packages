$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG58.0.0Setup.exe'
  checksum      = '8b952efd841d22bfafa040ce7ebd83a19bee0409ea96f0e87402a6f32a523191'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
