$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.15-win32-install.exe'
  checksum      = '3271c9bd2681db293f39188096f90803a24a331479376e3357e9ed02a61366e2'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.15-win64-install.exe'
  checksum64    = '314de750c0a73c6b2f6e7026b226f735f2600441058954b299b6462eb53bcaf1'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
