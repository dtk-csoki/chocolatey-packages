$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v3.2.1/gb-studio-windows-32bit-standalone.zip'
  checksum      = '43a64a5d0094f67623e4e58cafafce55f4a0fbf1c22d8b6665765efb45861304'
  checksumType  = 'sha256'

  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v3.2.1/gb-studio-windows-64bit-standalone.zip'
  checksum64    = '59d81e410937f2022c650183579fddd05500b2803d17466e1beb792c88d95cab'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Prevent chocolatey from creating shims for supplementary executables
New-Item -path $toolsDir -name "Update.exe.ignore" -type File -force | Out-Null

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "GB Studio.lnk"
$targetPath = Join-Path $toolsDir "gb-studio.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
