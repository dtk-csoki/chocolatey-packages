$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.20.6/js-studiocomm_6.20.6_windows_x86_64.exe'
  checksum64     = '3145a78dfd3a19aaeb5cdb85e32643cd925981b4467d9840eef5cd05e0b7375b'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
