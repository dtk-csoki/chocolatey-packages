$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\poppler-22.11.0-ha6c1112_0.tar.bz2"  
}
Get-ChocolateyUnzip @packageArgs

$packageArgs_tar = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\$(Get-Item ($packageArgs.file64)).BaseName"   # tar file
}
Get-ChocolateyUnzip @packageArgs_tar

Remove-Item $packageArgs.file64
Remove-Item $packageArgs_tar.file64