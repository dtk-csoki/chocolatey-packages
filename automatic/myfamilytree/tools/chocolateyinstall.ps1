$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.1.0.msi'
  checksum      = 'b9c43128c70cd2da85f50c36d5eaf89c1055f5ab7146ac16bb3ce68efa1b6ce9'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.1.0x64.msi'
  checksum64    = '67ab37f0f795af4854e430773cdc112b444a53b3c526baff15be707d1d9f7362'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
