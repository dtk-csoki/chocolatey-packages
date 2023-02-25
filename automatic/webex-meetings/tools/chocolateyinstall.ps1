$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '85c7c5ca2c1aaa75466d68cfdcd04ab0a81af591ef44912be34ac37ed1d31ca854efa82dd6e34f39af3f45a7fd4f4d2c3ff808342c7e367d6d1414e3b560b829'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
