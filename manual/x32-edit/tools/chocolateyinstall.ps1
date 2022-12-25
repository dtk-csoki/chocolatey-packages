$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://mediadl.musictribe.com/download/software/behringer/X32/X32-Edit_PC_4.3.zip'
  checksum      = '82108c184c90b32ef9ec22e809e39afe2e479710f2594290fb9404aea549c614'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'X32 Edit.lnk'
$targetPath = Join-Path $toolsDir 'X32-Edit.exe'
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"