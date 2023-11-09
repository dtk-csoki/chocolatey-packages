$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/77ed6ad37022f0a09a97ac07f601dd5f'
  checksum     = '236412717a65fd41fbb83ea3a4d81ecc196b85fd546b159e3d4caf4692944aec'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
