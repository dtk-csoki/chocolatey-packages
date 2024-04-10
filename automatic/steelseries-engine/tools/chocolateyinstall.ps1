$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG60.1.0Setup.exe'
  checksum      = '1c8d9396aa0cea44606d22d47edc26b4cd4b492cbabcd264e1651e6557d7b274'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
