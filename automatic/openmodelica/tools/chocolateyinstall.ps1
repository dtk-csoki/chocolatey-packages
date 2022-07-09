$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.19/2/32bit/OpenModelica-v1.19.2-32bit.exe'
  checksum      = 'bca175a6c31ff1bef067af42255b4c50107455ed06cb405aae7e212a10f6d5ad'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.19/2/64bit/OpenModelica-v1.19.2-64bit.exe'
  checksum64    = '2785f39376914f8514588ee3cf1f449b57546a4b321b769fb2d46336a00adbec'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
