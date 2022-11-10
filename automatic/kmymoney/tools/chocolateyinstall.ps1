$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1583-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = 'a99f32fc1cc85ca74761955677d044e485a73b0ce9aa9254be881a10fbc53755'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
