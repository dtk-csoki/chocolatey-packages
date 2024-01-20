$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://build.openvpn.net/downloads/releases/tap-windows-9.24.6.zip'
  checksum      = '4d570348205c36e55528da2ca8dfc754c1762716f9c2428532a98f47455f0378'
  checksumType  = 'sha256'
  destination   = "$toolsDir"  
}
Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path "$toolsDir" -Include *.zip

If (Get-OSArchitectureWidth -Compare 64) {
  $file = (Get-ChildItem -Recurse -Path "$toolsDir\*\amd64" -Include 'tapinstall.exe').FullName
} Else {
  $file = (Get-ChildItem -Recurse -Path "$toolsDir\*\i386" -Include 'tapinstall.exe').FullName
}

Start-Process "$file" -Verb Runas -Wait -ArgumentList 'install OemVista.inf tap0901'