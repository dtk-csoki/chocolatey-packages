$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1614-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '31c7a51710d960d6aa1fd83a5e9f92e6a58d51c2322325ab94ab9c79f2277c95'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
