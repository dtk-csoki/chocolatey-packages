$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1587-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = 'eead5871ae404695dddb09dc65660b8341c1c5baa759a17c348e3d0a93c97296'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
