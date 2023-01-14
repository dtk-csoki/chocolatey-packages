$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = "MSI"

  url            = 'https://www.goodsync.com/download/GoodSync-v11-Setup.msi'
  checksum       = 'f7c795cf06b75a1708913ab84908a48a5338f8bc75dd5a74eb5c9bd17fb60e88'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
