$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.2.0000.0.msi'
  checksum      = '49ef5cc4de42bc5cbf23bdf55593779ec6bb8cb765ae3d6cd926294033111769'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.2.0000.0x64.msi'
  checksum64    = '4c5f4ef4ecc382dfdfdf1e351f2c03338f4712359534e212c7bcf9ee6811f612'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
