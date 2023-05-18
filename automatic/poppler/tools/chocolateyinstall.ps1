$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\poppler-22.11.0-ha6c1112_0.tar.bz2"  
}

#Get-ChocolateyUnzip @packageArgs
