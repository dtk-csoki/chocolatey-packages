$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  
  url64         = 'https://pages.rapidminer.com/latest-studio-win64bit-download.html'
  checksum64    = '9a1b1610c76ddc3b6a7f54cb87620ea4075e22c9e59848c075346f2f0d5026c3'
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
