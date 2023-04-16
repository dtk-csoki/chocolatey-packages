$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1741-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'cabcf13a0a964ff396e5c3cc7f65c9a1ce7b995ab8f03c2332da466bac776bb9'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
