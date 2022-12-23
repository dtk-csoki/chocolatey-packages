$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.0000.0.msi'
  checksum      = 'fbe15db7ac501c986f7a0a7c363101eae39d32b51c76c7d0e466c7a44a3fc106'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.0000.0x64.msi'
  checksum64    = '21cfbed1829a543a4b34c13cb738c019f8ea035c096a1eea3e54f1524ebd977b'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
