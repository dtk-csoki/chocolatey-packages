$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1722-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'ec3ee571c5f5b632b651b07ea264ddc142e4104a119dc8ffec8c54e55b94deeb'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
