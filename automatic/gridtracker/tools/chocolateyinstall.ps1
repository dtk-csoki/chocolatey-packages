$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://storage.googleapis.com/gt_download/v1.22.1006/GridTracker-Installer.1.22.1006.exe'
  checksum     = '1e3c983213eaa97e089afd3a57633aa9e38ddbd160edcda01d168f0ab9204f46'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
