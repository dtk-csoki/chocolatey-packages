$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.0.0.msi'
  checksum      = 'add489093d7ce6d7a72ce5acf403a8c183bd207d84d91d93c0ca32b5949be4fc'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.0.0x64.msi'
  checksum64    = '9a2ed4464ca20d6176b5fe998bcf2bd1e0292f650daf8cdf09cd8c764c5abf99'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
