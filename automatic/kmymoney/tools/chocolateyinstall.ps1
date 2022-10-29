$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://download.kde.org/stable/kmymoney/5.0.6//win64/kmymoney5-mingw64-5.0.6-8.1-setup.exe'  

  checksumType   = 'sha256'
  checksum64     = 'fb5a34343c82427b939c6d2fa17e13d719ce3c4f55017e651f26baf74acd8c54'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
