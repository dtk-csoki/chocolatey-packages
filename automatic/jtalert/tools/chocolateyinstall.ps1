$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/7b36054723376e5f77da5e660a6eebda'
  checksum     = 'c10af06f4572f4f4f42539b9555656315c206221c78ca36c79c23d030acca01d'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
