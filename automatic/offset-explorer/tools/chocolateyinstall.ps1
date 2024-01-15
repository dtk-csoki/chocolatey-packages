$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = '736d7e7b53c8051a5fb0594e1cddccc492f3a27a28304229b281b28b35ca335f'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = '64a22d860a9b397e71c0c1af3f6505d1514dfcd47ca38094af551a76d2c2df79'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
