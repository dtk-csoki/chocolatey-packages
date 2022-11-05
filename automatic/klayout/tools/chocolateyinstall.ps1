$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.27.12-win32-install.exe'
  checksum      = 'afceba641c931aa4a2c0a6bf6a9edf0e5e1bd021df1b5addc5019466a9e114ae'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.27.12-win64-install.exe'
  checksum64    = 'b7bd6c6bd4221865a3cb21aecc62ae0f0c2d319ca82d0505d7373ddc2fb4b945'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
