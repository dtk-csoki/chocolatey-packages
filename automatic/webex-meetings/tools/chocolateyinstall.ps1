$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = 'ef6e7e95dcd430c6d6ccd6ceeaa09e2727f0801d790913fa7563db4c47ae4e4f963d0ec4088d3b2d74bd4879b184305bd1610db8fac10d3c405b4fbe5b07adfb'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
