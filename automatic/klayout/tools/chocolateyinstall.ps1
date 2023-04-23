$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.7-win32-install.exe'
  checksum      = 'f53057d6116c7435ce86edbf5ec074a232d636a87f45b2eb03014f33445e2886'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.7-win64-install.exe'
  checksum64    = 'e8edae37f870349a9736f849ee8c7a61f2c38fb3555c73aaee075232a11882f9'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
