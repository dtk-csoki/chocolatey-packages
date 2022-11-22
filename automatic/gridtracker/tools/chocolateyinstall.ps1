$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.22.1122/GridTracker-Installer.1.22.1122.exe'
  checksum     = '45eb314987649ec2c5c65a1632d451f7371a71f7175bd3334702e31d73dd123e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
