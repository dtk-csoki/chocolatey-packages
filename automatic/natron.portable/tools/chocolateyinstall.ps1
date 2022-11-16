$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://github.com//NatronGitHub/Natron/releases/download/v2.4.4/Natron-2.4.4-Windows-x86_64.zip'
  checksum64     = '1a80fe25e0acf727527a140711ea97e5ad7e837f3c2055cc463e315664cffd72'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude "natron.exe"
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$OSArchitectureWidth = Get-OSArchitectureWidth
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Natron.lnk"
$targetPath = (Get-ChildItem -Recurse "$toolsDir\Natron-*-Windows-x86_${OSArchitectureWidth}*\bin\natron.exe").fullName
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
