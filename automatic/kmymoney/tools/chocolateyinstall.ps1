$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1827-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'ce559fadbe6100c3489b76cc59764d50d20a5d574abe4d28fc968bf56882488b'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
