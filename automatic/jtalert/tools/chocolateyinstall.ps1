$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/09e87216c5d0c90bdbb3f8eb4bc98636'
  checksum     = '5df831447ec61347471b1b590c886a8f81e8842b7a574070aedd10a87e5ebcec'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
