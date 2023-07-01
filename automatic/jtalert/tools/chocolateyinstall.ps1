$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/627ea62225b6bcfa6618149ef3bd6bf3'
  checksum     = 'a77577937edc24b482bd08238dd113309ae88b6e6474b06608e68b38f1148af7'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
