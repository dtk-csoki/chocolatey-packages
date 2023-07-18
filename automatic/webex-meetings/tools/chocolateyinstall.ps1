$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '7751093ff92cd3e1c1a4e49ddcf6c05bc87c4f4ca2c6dd3fc2c1788e4844cabe63dc024cccdb7878bb07f2e72738d45e7a0f309c918a6e0d4699e8469ee2ec2e'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
