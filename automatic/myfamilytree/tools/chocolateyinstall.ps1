$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.5.3.0.msi'
  checksum      = '261d7418d30cbcc5730fca18b693b8275fad9dd63e0bb9d4fea7aa17ceaedcb2'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.5.3.0x64.msi'
  checksum64    = '6568777824be9c964bc8cb0c25fdb391676b818976524d956ccb0e92b69305c2'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
