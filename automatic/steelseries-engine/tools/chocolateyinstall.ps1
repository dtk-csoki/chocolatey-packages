$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG57.0.0Setup.exe'
  checksum      = '9e6c2e2a827c57aa77a8a4ce1516744a6e1deb92a488444306d5b50bfbce0541'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
