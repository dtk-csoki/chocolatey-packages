$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.20/0/32bit/OpenModelica-v1.20.0-32bit.exe'
  checksum      = '5874c035e95e73eb1ff935c63d9c0a7b57126fded8220c4fc22aed2892cb10c8'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.20/0/64bit/OpenModelica-v1.20.0-64bit.exe'
  checksum64    = '3e8fd7f4bd7f0f6edebfa504b89acfc5caffdcceecba20b92d1d43de845d5d12'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
