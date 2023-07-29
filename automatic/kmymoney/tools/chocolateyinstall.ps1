$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1844-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '8c5272c6f47150411655f9fca2caf5cf79e2b2d12e1d052e9c36514c42f8a265'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
