$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1582-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = '960219c8caab678a8fabcc976d2b7007d72ae4da729572b51d5de8b7ecfef915'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
