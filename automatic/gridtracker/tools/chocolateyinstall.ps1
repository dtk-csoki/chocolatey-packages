$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.22.1204/GridTracker-Installer.1.22.1204.exe'
  checksum     = 'f7700061ac66fa23f1798f2417e3fc37c19ede03f3698a417bedff69f629babf'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
