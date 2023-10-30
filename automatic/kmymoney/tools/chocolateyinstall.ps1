$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1937-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '4b1f2d8f3d2a0900d77df4ca2db5b09fe255f64d8f97c28099b180945d201773'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
