$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1599-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '64b17fd7d01a3fc614cb6437de41e46c59eab6c36110a56e49ec609d536e9867'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
