$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://binary-factory.kde.org/job/KDevelop_Release_win64/lastSuccessfulBuild/artifact/kdevelop-5.6.2-1873-windows-cl-msvc2019-x86_64.exe'
  checksum64     = 'f9b85a5c99a076120a71642d449460f15c8c37cf0f9ec80ace2e5318df71e470'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
