$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.0000.0.msi'
  checksum      = '68c51e9f4c3c356c9c7284b57f5a33440fc702c69c2c233aad9bc4aab54626ea'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.0000.0x64.msi'
  checksum64    = '1240413cbddac46544b6bffa36a5f35622d0cc363f53fabc05298cdb2682a705'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
