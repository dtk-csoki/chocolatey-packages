$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.6.exe'
  checksum     = 'c8d7c80959f6f8c13e18a285f76088df84c9617b5dfe5f94f8270596eaa04fee'
  checksumType = 'sha256'
  
  silentArgs   = '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
