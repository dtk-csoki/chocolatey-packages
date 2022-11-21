$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.22.1119/GridTracker-Installer.1.22.1119.exe'
  checksum     = 'ae2bda69f8446173d307c73f4ecc317698c91fc7be2b3d09f5faf8fef0f7d9ae'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
