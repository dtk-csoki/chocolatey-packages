$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.22.1123/GridTracker-Installer.1.22.1123.exe'
  checksum     = '992d647857c89ce6ed01a5d01d39497007ed1ac08c60b3df880a01b2b8e11f5e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
