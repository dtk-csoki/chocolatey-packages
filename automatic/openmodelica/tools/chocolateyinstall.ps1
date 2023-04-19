$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.21/0/32bit/OpenModelica-v1.21.0-32bit.exe'
  checksum      = '1e5517ea062e97f51a3acc70e0c20992f54cddef402778aaa222fccc23888ecd'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.21/0/64bit/OpenModelica-v1.21.0-64bit.exe'
  checksum64    = 'c36a85a4def98910635079ff27a34b776750fb72809d2dd5fea54c30789f1f82'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
