$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/d652fb80be16b5ff7bd217a90a84a554'
  checksum     = '0bc4ddf180fa8ca25c27b324976961a77e16f1a5bea3f43d90f77b167cf3d56b'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
