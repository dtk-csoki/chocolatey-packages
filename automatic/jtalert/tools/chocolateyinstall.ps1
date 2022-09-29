$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/12b27e19737059cc011d1213a67f405d'
  checksum     = '43fdb7f6fd33ec31dfa0655e26749d8b66ebc4561e5b34b2ccf6ad5ab7e70952'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
