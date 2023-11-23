$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.13-win32-install.exe'
  checksum      = '56dd13342daa4b5f0b8e59e0beecfcc8892bc64dadef88780a88d38a72c9f86c'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.13-win64-install.exe'
  checksum64    = 'e06ca84bc814fe0d4c31a42c46e6d2635338488038dd66feef15c6bec924de47'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
