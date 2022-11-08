$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1581-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = '7669c02d28ec946746089e65cdf9e7ea6ce28b56dc5dbb1e4d16f25203760aa4'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
