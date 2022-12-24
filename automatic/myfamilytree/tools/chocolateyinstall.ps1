$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.4.2.0.msi'
  checksum      = '4f9cf510d1b8eebf940cfdff86c4d408e0304ff6e6104597ebafad0be1368db4'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.4.2.0x64.msi'
  checksum64    = '4c4624b7b026738486fff859b9ef64b7e67c4e63636ae5cd41aa4c86527d3477'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
