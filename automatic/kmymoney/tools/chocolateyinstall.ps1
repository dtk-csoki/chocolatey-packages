$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/1567/artifact/kmymoney-5.1-1567-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = '2767ae0d2ead29cd2a9dd04fea9320608e8e2da04f0fc2a51756dd31fa43684c'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
