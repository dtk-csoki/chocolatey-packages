$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.2000.0.msi'
  checksum      = '7fccbf864c1b6c93c3b00c1dde469db895b73c3505b78c749ae3fe6d583cec0f'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.2000.0x64.msi'
  checksum64    = '3268aae265bf2b9189c8b6e8044474911596ee2af822168202628086a1d5e412'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
