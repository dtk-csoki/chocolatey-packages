$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://binary-factory.kde.org/job/KDevelop_Release_win64/lastSuccessfulBuild/artifact/kdevelop-5.6.2-1862-windows-cl-msvc2019-x86_64.exe'
  checksum64     = '1eaf547608eb6f7c0f00038f56ade1d7188f61cb2673e0a9bfccbde1bd1a1d86'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
