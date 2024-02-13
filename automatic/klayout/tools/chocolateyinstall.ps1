$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.28.16-win32-install.exe'
  checksum      = '342abfca59361eebcd4ee82df6891b9b37063141fdf6055c77619d77c7c02b38'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.28.16-win64-install.exe'
  checksum64    = 'e517ed616829be3463dabfc47bdccd576eb84b1426253983a9865622bf5e6fc5'

  checksumType64= 'sha256'

  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
