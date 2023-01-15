$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


# Remove previous setup
Remove-Item -Path "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  destination    = "$toolsDir"

  url64          = 'https://github.com//NatronGitHub/Natron/releases/download/v2.5.0/Natron-2.5.0-Windows-x86_64.zip'
  checksum64     = 'caed0b649ff2515b963f0b4fc009eb451a41d8ba3d6e5d4260253dd9e104c517'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage -DisableLogging @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = (Get-ChildItem -Recurse "$toolsDir\Natron-*-Windows-*64\Setup.exe").fullName
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
