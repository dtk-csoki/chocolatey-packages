$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.24.0104/GridTracker-Installer.1.24.0104.exe'
  checksum     = '9388bdd358538c985144c79271889196a01a20d7b03310f70514a33481843fed'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
