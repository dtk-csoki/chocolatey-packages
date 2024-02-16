$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-2046-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'ab71c45a16160f1c9c71bd5073bafdcf21561e50f47a280d1ec9d3ff190ca8b2'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
