$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1226/GridTracker-Installer.1.23.1226.exe'
  checksum     = 'fb3b251d9b6f0b3fe46954bc543d150559324519f63cc20f500e57de32c3632d'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
