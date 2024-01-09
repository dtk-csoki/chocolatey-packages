$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG54.0.0Setup.exe'
  checksum      = 'c3c3e99cc9c291b87ad24f93423072e3db4980216c8b63e6fac3952af83d9f05'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
