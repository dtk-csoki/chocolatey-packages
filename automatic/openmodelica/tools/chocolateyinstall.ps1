$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://build.openmodelica.org/omc/builds/windows/releases/1.22/2/32bit/OpenModelica-v1.22.2-32bit.exe'
  checksum      = 'd0c0fd753691378b8134193248ad6349a671def2e0f092ddf2f8d1b3ace7277d'
  checksumType  = 'sha256'
  
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.22/2/64bit/OpenModelica-v1.22.2-64bit.exe'
  checksum64    = 'cbf1159c0418ac1d7776da81de5287ea6decbf558fab91246a81ef2c139969b6'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
