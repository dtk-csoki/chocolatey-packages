$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.5.1.0.msi'
  checksum      = 'f583e5d69ac96f211540cc18757e7dd86e266f6337d8367ae4aacb4332cdccf1'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.5.1.0x64.msi'
  checksum64    = '425b8147559cc13426b012d209a2e43882fed19906c56211e0079ce8cc7f24bf'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
