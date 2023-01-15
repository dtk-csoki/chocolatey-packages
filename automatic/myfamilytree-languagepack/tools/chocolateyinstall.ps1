$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.2000.0.msi'
  checksum      = 'cd9ee8dd57803e42935b5b8882668fd75bff62cd82946f64b97d69eeace2ceee'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.2000.0x64.msi'
  checksum64    = '73b3ddb5b977a8eabc130abfbb3289daccb03460a74e7205b662ea5e45706c4c'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
