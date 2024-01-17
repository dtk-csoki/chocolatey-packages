$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG54.1.0Setup.exe'
  checksum      = '9c6b74d3d330b30c464e2668e86ec3ad3114295a536473e7ba1197a26db7ba25'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
