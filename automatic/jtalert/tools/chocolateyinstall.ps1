$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/1b5d782d2549277b27ee30e077d16e06'
  checksum     = 'd3ee1f0b53d46152bd6bb741448a99be8a3727f75486a3e24dfa0a5a01994d88'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
