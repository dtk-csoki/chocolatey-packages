$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# Remove zip files from previous versions
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName	   = $ENV:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  file           = Get-Item -path $toolsDir\*.zip

  url			       = 'https://www.pspad.com/files/pspad/pspad507en.zip'
  checksumType	 = 'sha256'
  checksum	   	 = '8ef79921d6337c6f2b8b8c86749e1bf1ff45a21e8347408045094e7e319f0d61'

  url64          = 'https://www.pspad.com/files/pspad/pspad507en_x64.zip'
  checksumType64 = 'sha256'
  checksum64     = 'd716746a074ff98b94bd5ba5a439446111bc8b280153202f3909e7cc33b10ad7'
}

# prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'phpCB.exe', 'TiDy.exe' ) {
  New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PSPad.lnk"
$targetPath = Join-Path $toolsDir "PSPad.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
