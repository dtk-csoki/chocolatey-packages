$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl2.ultraviewer.net/UltraViewer_setup_6.6.80_en.exe'
  checksum     = 'a7a7419a44b9e4a858b2d59f9a6876dda83e5e7841376a496e5501ffaa521883'
  checksumType = 'sha256'  

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
