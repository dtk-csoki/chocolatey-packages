$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.3000.0.msi'
  checksum      = 'ca6a3700a79e8bb903bab3a8fadb9f78b078a4fcb2b6ca4a356098ccfe97f5e5'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.3000.0x64.msi'
  checksum64    = '9533538f92af56b8fde3fc4ebe9944336bbbb211443482100a9827f9b422ffc0'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
