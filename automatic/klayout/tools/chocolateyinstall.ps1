$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.17-win32-install.exe'
  checksum      = '98b7d6b80d8ad3597c108b639095f291c39efdbfbaf131bde94cda61ef1f7a6f'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.17-win64-install.exe'
  checksum64    = 'f244a2460096d2be04727b0b6e42eeb291d0cf3f4cdf1410c1122c0a41fec54b'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
