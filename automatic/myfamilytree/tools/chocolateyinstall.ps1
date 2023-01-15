$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.5.2.0.msi'
  checksum      = '3fabe676e447745f78c8aa5bc6dc40130a45b632dd6d772abcb93c9a9ccdc672'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.5.2.0x64.msi'
  checksum64    = '41f53af2a764a0d3a41e2e59bab771171d19c77fc8e649bddf8b4416ce77438d'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
