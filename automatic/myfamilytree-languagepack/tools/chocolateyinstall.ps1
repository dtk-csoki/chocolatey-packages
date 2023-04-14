$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType		= "msi"
  
  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.9000.0.msi'
  checksum      = 'ca0dd94bac2e817c57f3d93dd5dac6b235ea0f8c9a0cbc58537d327acb891a54'
  checksumType  = 'sha256'
  
  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree_languagepack12.5.9000.0x64.msi'
  checksum64    = '2ed8845501022cb13a9c007ace3136cb048e67bacb18e5fbe9a833182255d705'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
