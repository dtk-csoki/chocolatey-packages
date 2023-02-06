$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName

  url            = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.12/huggle_3.4.12.exe'
  checksum       = '24445aaa50aa5b4484491d6ecee6e5ff95ffd47fc1058e1785353a25afcf7958'
  checksumType   = 'sha256'

  url64          = 'https://github.com//huggle/huggle3-qt-lx/releases/download/3.4.12/huggle_3.4.12_x64.exe'
  checksum64     = '6bfd9a9a774b70c5ff97831a8e5fe649d794719c9cc50087fbcb58f6d810da2e'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
