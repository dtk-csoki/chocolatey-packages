$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/20f3be8e23d1bf30e3631701a666903a'
  checksum     = '968afa4228e4d228ea486b570b86fa8327040439fa637f011de0b6a841b31717'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
