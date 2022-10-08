$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.1007/GridTracker-Installer.1.22.1007.exe'
  checksum     = '68c85c33c55e06d24ca50fc871856fd1ac9fc77396074664e9c033e686a558c6'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
