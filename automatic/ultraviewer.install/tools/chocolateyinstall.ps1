$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ultraviewer.net/en/UltraViewer_setup_6.6_en.exe'
  checksum     = '2255d621097b52cb8613b1fdbd9a97a2b2d8c65d64b068d1643015ebb8f83cc3'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
