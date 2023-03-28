$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = 'a0fa0526f8a8a69d2b59da556004b59e285f7ff3a464bab0afe35383ea612693164307952dab86053c740621e5d099abf368918a353147856a68f4da4bb8d71b'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
