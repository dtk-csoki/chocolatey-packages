$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1019/GridTracker-Installer.1.23.1019.exe'
  checksum     = '59d8a3a5ae4480e0e78b1d8af706834d2bb847613a873d9781fcba422908dfdf'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
