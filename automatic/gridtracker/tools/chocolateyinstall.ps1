$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.0402/GridTracker-Installer.1.23.0402.exe'
  checksum     = '21087c1c5c1acc52def845a1da833698528be8a0bf69b5c7179743c56b6935cf'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
