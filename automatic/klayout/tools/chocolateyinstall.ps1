$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.29.0-win32-install.exe'
  checksum      = '205896afac1554ef3d98ec62b71856b274582ed5a7ce31bc6691d25954ccefcb'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.29.0-win64-install.exe'
  checksum64    = '69113afdd8bdf2d70ef6637c13a26133d57c74fa113fa5c84e972b8f868afb6d'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
