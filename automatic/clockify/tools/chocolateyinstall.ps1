$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify.me/downloads/clockify-setup.msi'
  checksum      = '86fa6f52876e95355158b7a630584b83c3453b9b4d40bc87f57255ed5913b9f8f1d94d9fdade0c4a0b976bc0d03c60c060edb74035e0f2dce52813d432cd6485'
  checksumType  = 'sha512'

  fileType      = 'MSI'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs