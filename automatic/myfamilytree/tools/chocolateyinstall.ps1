$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.2.0.msi'
  checksum      = '4bfc97223d08271360d41f2cb7d6fce6f0d3d5fa6c857a4f53e5ac9ea315f753'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree14.0.2.0x64.msi'
  checksum64    = 'e4b656157539eb282786bddfc884a0419bf3dcfc7d57e5e821f17683b11a8d1d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
