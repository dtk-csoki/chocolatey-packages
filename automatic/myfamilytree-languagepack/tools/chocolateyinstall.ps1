$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.2000.0.msi'
  checksum      = 'd2a258c021ff5d473781086d585c61ead12ae7b6460845fcbab92b7a9adaac48'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack14.0.2000.0x64.msi'
  checksum64    = '5361e6e1cc3e20199646c5be8d3ccb83d69a189c5bc686f9dd7fc086a68b642d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
