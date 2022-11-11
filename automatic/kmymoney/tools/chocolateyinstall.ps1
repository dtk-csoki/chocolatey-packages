$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1584-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = '52144cf85de154672ef059fb62176ddd5da425fe234a40a9af7ccc80af1871a8'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
