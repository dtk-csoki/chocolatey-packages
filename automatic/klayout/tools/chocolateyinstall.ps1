$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.14-win32-install.exe'
  checksum      = 'b22ea364ecc36ad1a487a36db64da4ee8248c4ce36b8820cad592182a5ccb3c3'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.14-win64-install.exe'
  checksum64    = 'f15786aca5cd4f8a45c974143de4b3fe8436720f0c5b0bc54d77e433dde659e6'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
