$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = Get-Redirectedurl 'http://sourceforge.net/projects/jasperstudio/files/JaspersoftStudio-6.21.0/js-studiocomm_6.21.0_windows_x86_64.exe/download'
  checksum64     = 'f596f3334b091206b1c8262ad98a827fba46a56e8a8306c753e5fdcb872f17dc'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
