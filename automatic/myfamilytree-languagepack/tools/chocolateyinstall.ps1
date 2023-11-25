$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.1000.0.msi'
  checksum      = '7bceb2e9dfa3ef5bc1ddf2ccd91db5e61bd20c5a1a4af4c40f95e9c9e2a1dd74'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.1000.0x64.msi'
  checksum64    = '137ef0b3a4ef5f21d18ca13c3907dc9768b229e74b60ed5190bb24c260885d9d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
