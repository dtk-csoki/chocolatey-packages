$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.6.1000.0.msi'
  checksum      = 'e05f92a8d794782c9ef261cc0c5b1cd2fdb4392501fc2b0d2dae596e9f3ad198'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.6.1000.0x64.msi'
  checksum64    = '70d8f0c32882f91f3d8f65551c024bacebe0e0d00323edfdd0b1053f744f3796'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
