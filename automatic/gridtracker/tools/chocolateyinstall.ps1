$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1014/GridTracker-Installer.1.23.1014.exe'
  checksum     = '10f5afc4af96f737d0cdd34e4db238c9597a919eafe43401823f181408c633ba'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
