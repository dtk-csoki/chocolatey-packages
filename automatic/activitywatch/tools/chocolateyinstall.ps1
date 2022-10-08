$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/ActivityWatch/activitywatch/releases/download/v0.12.1/activitywatch-v0.12.1-windows-x86_64.zip'
  checksum      = '1d7eb9dc706f3ef3fe866e025277f8296c0744a87f31e78befaf393e70ae41ad'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install in startup menu
$commonStartupDir = [environment]::GetFolderPath([environment+specialfolder]::CommonStartup)
Install-ChocolateyShortcut -ShortcutFilePath "$commonStartupDir\aw-qt.lnk" -TargetPath "$toolsDir\activitywatch\aw-qt.exe"
