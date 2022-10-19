$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.22.1016-Harvest/GridTracker-Installer.1.22.1016.exe'
  checksum     = 'a099f728b1c4fad64626996596f474e627b935029009670f91ed9c001dd01a0c'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
