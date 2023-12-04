$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1202/GridTracker-Installer.1.23.1202.exe'
  checksum     = '6b407c96e9485cf26db058f40b19645cb845052ce8203f93fbfa34a0ab14f888'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
