$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.20.6/js-studiocomm_6.20.6_windows_x86_64.exe'
  checksum64     = '3145A78DFD3A19AAEB5CDB85E32643CD925981B4467D9840EEF5CD05E0B7375B'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
