$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.11-win32-install.exe'
  checksum      = '92048b429f7d078d11480732bb2ea2917075c818515f9396e638c510e8631c7e'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.11-win64-install.exe'
  checksum64    = '0467bd8c412ce0ce3c6100f1791db16c442c18abeebfe7fd426de16081edf37d'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
