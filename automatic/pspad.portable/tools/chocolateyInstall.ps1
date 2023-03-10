$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# Remove zip files from previous versions
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName	= $ENV:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  file          = Get-Item -path $toolsDir\*.zip

  url			= 'https://www.pspad.com/files/pspad/pspad507en.zip'
  checksumType	= 'sha256'
  checksum		= '4bc3624f279ad649d14ac53c1f5525f89790ee7b8acbca8b8a718fbe61642469'
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
