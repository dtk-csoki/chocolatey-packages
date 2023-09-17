$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = 'fe94ebb1a7746f0b2fb25c8eb51dbb5e8e732e530d156da4c0a4285ca84aced1'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = '783635460d87e1fcd8d90508a9cec9642467a5145341461f2a749cbf9fe6b6b7'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
