$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://static.files.bbci.co.uk/iplayer-pc-download-app/releases/win32-x64/BBCiPlayerDownloadsSetup-2.13.14.exe'
  checksum      = '5de57258e197f065cfe0f00ff24a7098c9193d2e9ca0c6c77f65eb4ae2fdeebf'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\bbciplayerdownloads-2.13.14-full.nupkg" 
}

Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path $packageArgs.file

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "BBCiPlayerDownloads.lnk"
$targetPath = Join-Path $toolsDir "lib\net45\BBCiPlayerDownloads.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
