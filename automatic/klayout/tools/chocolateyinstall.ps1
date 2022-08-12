$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.11-win32-install.exe'
  checksum      = '44ea134b613f13e80194c62676ab5a4693e2524b09a1d4961d899bc5b2733a13'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.10-win64-install.exe'
  checksum64    = 'cb98d70bca1cb797a6dd4629d67cf6cdecf6b09c9c62fd490635452751a8ca2e'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
