$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.8.exe'
  checksum     = '0649c815fc3add5c4a2929654182469f55a28836e4430fdf2e45b24df4c87be9'
  checksumType = 'sha256'
  
  silentArgs   = '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
