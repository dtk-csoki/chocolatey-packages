$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.3-win32-install.exe'
  checksum      = 'cb13ac5b2df188368041c9b38814604e20a3f22170be5974c011856a8ddab841'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.3-win64-install.exe'
  checksum64    = '6a02af4518cdfb4d62f79d33807a20370984b7ed109766fda0eed257e1c54b25'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
