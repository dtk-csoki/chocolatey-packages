$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1217/GridTracker-Installer.1.23.1217.exe'
  checksum     = '6bf97b329ddd688ac0fb191ff2812bd47da29bc907af80191aff320e225adc7d'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
