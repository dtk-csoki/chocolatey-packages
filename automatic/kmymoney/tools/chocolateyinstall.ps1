$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1580-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = 'b64148860daaef77ea3a825577314ff9d6a8eef82ae136d564a794858c53aa54'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
