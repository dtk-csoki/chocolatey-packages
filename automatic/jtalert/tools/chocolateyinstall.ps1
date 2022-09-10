$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dnl.hamapps.com/JTAlert/e5f32cc1c5edc2dbf6e3378876e4af55'
  checksum     = '4d1324ff187b0726ab621d22db4e65073a581f64abd1cb5a20a7445f22445c39'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyPackage @packageArgs
