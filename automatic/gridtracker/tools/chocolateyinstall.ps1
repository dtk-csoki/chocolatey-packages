$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1112/GridTracker-Installer.1.23.1112.exe'
  checksum     = '03916b241e0a1e903ac5178c32cb960113da8d01105e535deb85b8e875289498'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
