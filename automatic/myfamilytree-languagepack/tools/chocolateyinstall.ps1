$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.1000.0.msi'
  checksum      = 'c8e8672234d5698d2c29e6df7b1b36dd5560683c71bfa3801832ef51908d4dda'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.4.1000.0x64.msi'
  checksum64    = 'eace4ac10a702e034fee86deb525ee82c425ebae4346a741a0394921feea4022'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
