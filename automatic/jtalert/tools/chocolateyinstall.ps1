$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/591a14e40a809449097a8689e0c74f42'
  checksum     = '166c090e938e20c85735d4eb07bce426026e5c5bd379bf7252bda908857a2dc2'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
