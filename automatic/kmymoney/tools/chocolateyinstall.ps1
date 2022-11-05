$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1578-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = '8dbc82dd16fdaaa910a649f43e27b36f2b3dd2a5332b46cd8a9352464871d576'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
