$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.6.0.0.msi'
  checksum      = '6ee84fbbb46ac853d5e0c65c88a628e1eb8f3e931834a39ecad44b44ca9772d0'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.6.0.0x64.msi'
  checksum64    = '8952b0e9e9b78b56afa14b520f1a08992b937aaa835d0f57f7da7de378cff022'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
