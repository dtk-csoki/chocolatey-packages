$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://downloads.gridtracker.org/v1.23.1015/GridTracker-Installer.1.23.1015.exe'
  checksum     = '4769ddd0cdaa279ce53188df3973dad0af3dcf80ea3c1b2cb974ec49ed2bab65'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
