$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.8000.0.msi'
  checksum      = 'ea39b8ecfe1109c5f4e23441af5986b1708a2d70b7f93f9c4c6ddae64cbb7482'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.8000.0x64.msi'
  checksum64    = '120dfe6f2fdf73188ee143b1fa1b7c7566336d5beec28cb891f7e8d82da13ab9'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
