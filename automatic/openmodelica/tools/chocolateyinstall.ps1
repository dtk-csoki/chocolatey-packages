$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.22/1/32bit/OpenModelica-v1.22.1-32bit.exe'
  checksum      = '7f9d365a585cb94252fe829cf54983447ea13a3428b513b9748f824d7ff7fc40'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.22/1/64bit/OpenModelica-v1.22.1-64bit.exe'
  checksum64    = '6d434f55b2c0363759db98646ab268b605c9a252f6455c5c5669793d68b3931e'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
