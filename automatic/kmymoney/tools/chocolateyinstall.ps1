$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1797-windows-cl-msvc2019-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'c01399ef162414034932c2ac21aa3c340d19d2a520a7a2b4189c9061e0c3c1d5'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
