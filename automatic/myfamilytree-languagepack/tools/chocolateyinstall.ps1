$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.0000.0.msi'
  checksum      = '324a7f176658a5358aba899bb33003f4b7f18a722dc5308601e5dc467a63e352'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.0000.0x64.msi'
  checksum64    = 'ca5cba482980bc4e85e888624af2852a45924469c990e04fa04749ee3fb0ab81'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
