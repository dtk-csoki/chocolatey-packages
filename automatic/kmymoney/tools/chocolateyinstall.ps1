$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1585-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = 'a547251835b9e43082f68737e7fcdf7de64988c8e2b70c4ccd4fa797e981cade'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
