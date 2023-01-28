$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = 'e9e6ee3821196782833991faf5d1d4bbf5d2787687ff352067cb2b63736295fb'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = 'be3c26796fcc1cfa941c422d277a2c9924606b77fb7adab9aa2894903f4ae2fd'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
