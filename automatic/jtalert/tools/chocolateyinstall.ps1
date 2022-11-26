$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/31769cda3a40bcbca541e42f01bf7217'
  checksum     = 'fcb11fd1f89701d6b560b8a64a69113cd5dbf5c7e04eb6bb494d71b2b52d9e52'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
