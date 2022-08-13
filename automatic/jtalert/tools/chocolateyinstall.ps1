$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/c9b97ea0dad65d690176dd085b7d7355'
  checksum     = '39c218e164e7c0451cc7d0c7e708adb3540191ae5a110659a312f74a518e8b28'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
