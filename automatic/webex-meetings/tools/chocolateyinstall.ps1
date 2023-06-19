$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = 'b30fe5a3303a0505fb1dde1c83ceb7313b13269c054d2ade2ea655fc38af8bbbb6af1cc6bb70ac7b49095152a6dd1078cf42b5873c05d0352002b8d83e1fc231'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
