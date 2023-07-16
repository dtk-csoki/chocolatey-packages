$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesGG42.0.0Setup.exe'
  checksum      = '7C9426D13058AF2D76AC8AA342AADDF7A5BBAA5F3F8EA419410482E0E26322BF'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
