$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.1000.0.msi'
  checksum      = 'e71494bb85bd986ebfd14694c9cc3778fa6d9e8b32d03ef566381270df7b4fcd'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.1000.0x64.msi'
  checksum64    = '2f18aeae484ca3705d120466a0ce6432c4c633f0f5d3c654d84dcda9068c3ebd'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
