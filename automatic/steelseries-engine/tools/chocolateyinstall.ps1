$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG60.0.0Setup.exe'
  checksum      = 'a7346e66ec6d5b8380370d0e05c3a09707d88ed56d92989fd0df3fb8dc3bd137'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
