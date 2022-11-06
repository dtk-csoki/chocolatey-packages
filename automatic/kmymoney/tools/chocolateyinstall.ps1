$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1579-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = 'eab7864df9042f9a6c5db2fd6d8adc1144a8f10ebe49f459db59d652974ba1a3'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
