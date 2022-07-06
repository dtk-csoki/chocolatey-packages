$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = "MSI"

  url            = 'https://www.goodsync.com/download/GoodSync-v11-Setup.msi'
  checksum       = 'aa4048b49c8de635c94a7b88853c4b644f44e9f3f3d5b5b9e5e9234bfe9be1aa'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
