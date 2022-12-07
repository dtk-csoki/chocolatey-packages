$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'MSI'

  url          = 'https://akamaicdn.webex.com/client/webexapp.msi'
  checksum     = '6459e771a16a90328c816b44880c90ba6fdbc09debd5f00fece33c83c37f5fe308e6e6a4977a19d5a5b21a8afca64d60a8ffac638de9b5d2bf5df6d1836553a7'
  checksumType = 'sha512'

  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
