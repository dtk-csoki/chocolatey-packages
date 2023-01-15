$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName

  url            = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.11/huggle_3.4.11.exe'
  checksum       = '248358183560919902D05CD57C6B1A5EB7CD919ECD5F19D7CE723B4DC5348A30'
  checksumType   = 'sha256'

  url64          = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.11/huggle_3.4.11_x64.exe'
  checksum64     = 'D9F919185F3C9D7091371A0A074707C480A9ABAAD886263640972A9A4F59B9FD'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
