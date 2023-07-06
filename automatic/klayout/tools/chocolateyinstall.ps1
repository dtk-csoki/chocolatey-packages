$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.10-win32-install.exe'
  checksum      = '5c42b61ead2c3fcacfa772636c2fa049efd4863787ce73df5a8e03163f20b1f3'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.10-win64-install.exe'
  checksum64    = '5d6e7fa2446ad6b0c7d466e69ed038f0ed088b1ea642b27c6ff905a5f3d8b540'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
