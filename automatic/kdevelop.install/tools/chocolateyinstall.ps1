$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://binary-factory.kde.org/job/KDevelop_Release_win64/lastSuccessfulBuild/artifact/kdevelop-5.6.2-1900-windows-cl-msvc2019-x86_64.exe'
  checksum64     = '0208baa00ed69a44f9e1d850e4cfddc3fcb717d4fb251d1ebd99b56f56cc542a'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
