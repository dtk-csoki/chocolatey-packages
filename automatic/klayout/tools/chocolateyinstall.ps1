$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.2-win32-install.exe'
  checksum      = 'd2397545cdde4d730b4d03adc0b24ca6ec3fa961fcc7cceda49fe6a99e3acc9c'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.2-win64-install.exe'
  checksum64    = '73146a1ac4716c2c638c982bdcace694bde5ef7274e09a70707dee2bb7c43d5f'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
