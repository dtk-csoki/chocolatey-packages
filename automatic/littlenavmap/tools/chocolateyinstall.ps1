$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com/albar965/littlenavmap/releases/download/v2.8.7/LittleNavmap-win64-2.8.7.zip'
  checksum32    = '808ff584426d52cc775ad6406da00622f454be95bd4c8fbca42eef4b7235ad5c'
  checksumType  = 'sha256'

  file64      = "$toolsDir\LittleNavmap-win-2.8.0.beta.zip"
}

If (Get-OSArchitectureWidth -Compare 64) {
  Get-ChocolateyUnzip @packageArgs
} Else {
  Install-ChocolateyZipPackage @packageArgs
}
Remove-Item -Path $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
