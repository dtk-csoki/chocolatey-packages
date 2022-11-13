$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/lastSuccessfulBuild/artifact/kmymoney-5.1-1586-windows-msvc2019_64-cl.exe'  

  checksumType   = 'sha256'
  checksum64     = 'f32848ad3a07bb58be5495d20c12f35b6f37e4d0c96f970888042dff31c31a3c'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
