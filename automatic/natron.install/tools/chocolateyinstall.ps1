$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


# Remove previous setup
Remove-Item -Path "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  destination    = "$toolsDir"

  url64          = 'https://github.com//NatronGitHub/Natron/releases/download/v2.5.0/Natron-2.5.0-Windows-x86_64.zip'
  checksum64     = '386dd68cb920e487c575917d3f657a55942d8c9a2468ed2ec6ce322ffcc5ab61'
  checksumType64 = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = (Get-ChildItem -Recurse "$toolsDir\Natron-*-Windows-*64\Setup.exe").fullName
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
