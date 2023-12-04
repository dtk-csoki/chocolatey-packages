$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://static.bandlab.com/assistant/BandLab%20Assistant%20Setup%2010.2.2.exe'
  checksum      = '13ea1fd6682db4f9654525fe31c808f1bea6835f3d245dcd5dc7e4fc8cc7ebe4'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
