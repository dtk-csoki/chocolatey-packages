$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  
  url64         = 'https://pages.rapidminer.com/latest-studio-win64bit-download.html'
  checksum64    = ''
  checksumType64= 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
