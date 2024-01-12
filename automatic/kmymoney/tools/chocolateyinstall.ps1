$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-2011-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '01839f36f2d0568910c6d5341511f02edc6c538c0c03442aa10d9e77812ce754'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
