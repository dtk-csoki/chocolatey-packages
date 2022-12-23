$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.1-win32-install.exe'
  checksum      = '71828bca67ad23a2b7e2c96a046be0bd0a999b6fab97b44d9c8f13324eff9132'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.1-win64-install.exe'
  checksum64    = '4e5ed6f80c3600b47b549673a532c4779ffee9d75acc62fa22fe88f58d92a682'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
