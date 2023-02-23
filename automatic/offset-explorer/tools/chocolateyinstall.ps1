$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = 'aeebb5fd1622da4fa17590705ab9abb7be5233653c2b1f39b6b1d4362e755a44'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = '5eccc7eeee45d279502075330c8265713d8deeccffe6e324f117642e20d12dd4'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
