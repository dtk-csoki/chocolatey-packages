$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://downloads.sourceforge.net/project/speed-dreams/2.3.0/speed-dreams-2.3.0-r8786-win32-setup.exe'
  checksum      = 'ED51D3649669D4EAD322FA0857C6A4226CED2C7885D93E731ADBA67800857F68'
  checksumType  = 'sha256'
  
  silentArgs    = "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyPackage @packageArgs