$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.12-win32-install.exe'
  checksum      = '48ef4b3eb0bdfb3a1a3ca2a827308d78fe11e120fbd6d8e7ddd874033f0f6202'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.12-win64-install.exe'
  checksum64    = '3f949e6d40b21470a937f824ce36967648e5922cfbb29bf9d43399f00272a88d'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
