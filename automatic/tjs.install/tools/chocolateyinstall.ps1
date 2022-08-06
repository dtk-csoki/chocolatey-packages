$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.20.0/TIB_js-studiocomm_6.20.0_windows_x86_64.exe'
  checksum64     = '9333cfc633de28e95630e085713319fad837e88a775d815cf152dfbe4222b006'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
