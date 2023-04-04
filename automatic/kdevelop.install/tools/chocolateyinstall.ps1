$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://binary-factory.kde.org/job/KDevelop_Release_win64/lastSuccessfulBuild/artifact/kdevelop-5.6.2-1885-windows-cl-msvc2019-x86_64.exe'
  checksum64     = 'ee69e5154ebe540711e361de9fcba167ea173ff492365b5a7642f745840dda2d'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
