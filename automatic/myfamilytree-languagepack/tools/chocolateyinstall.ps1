$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.6.0000.0.msi'
  checksum      = '1cbd55c207b40e72e8a83192475e58b7b0a302418d7667ed4244f8b9f42ce3f4'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.6.0000.0x64.msi'
  checksum64    = 'a1423d42c6b70a56e8a3239568be29842a303b524a5ae94ee3a11d013ee44e22'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
