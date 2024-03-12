$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.22/3/32bit/OpenModelica-v1.22.3-32bit.exe'
  checksum      = '5c4288167c494a1a0f7522e1ff656815f2b49ef32ee3a956ff7d3564d45068c6'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.22/3/64bit/OpenModelica-v1.22.3-64bit.exe'
  checksum64    = 'dad49569f472f4c3ae1f539958573531ab408ec876c4b38fab5b3add3c2e7c47'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
