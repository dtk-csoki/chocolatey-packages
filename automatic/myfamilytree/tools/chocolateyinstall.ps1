$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  filetype      = 'msi'

  url           = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.4.0.0.msi'
  checksum      = 'bc070dc97cdb62bce4c02a366c0eb90454def31151149853a5571c5d4a60928d'
  checksumType  = 'sha256'

  url64bit      = 'https://chronoplexsoftware.com/myfamilytree/downloads/myfamilytree12.4.0.0x64.msi'
  checksum64    = 'd6db58a684a4c738068b06a7902bc2c9703ac26ec9da390493fb9482351ac876'
  checksumType64= 'sha256'
  
  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
