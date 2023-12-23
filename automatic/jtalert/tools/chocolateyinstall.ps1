$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/89628b02e089d31a679abbdb88046967'
  checksum     = '158feba2ba9a6ad1550388f7e57c96c10d08c7eba4d8f3263b0d218c5946929b'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
