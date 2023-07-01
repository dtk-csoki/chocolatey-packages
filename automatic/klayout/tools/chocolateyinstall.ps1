$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.9-win32-install.exe'
  checksum      = '3f029819e53dfe0a3cf803702665b0892163b97038a10406ebf59c138c00b740'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.9-win64-install.exe'
  checksum64    = 'f4bdf3bca4ca4b0958900900543a989d6ca2aadc699bdf74f3a46ae9517e330c'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
