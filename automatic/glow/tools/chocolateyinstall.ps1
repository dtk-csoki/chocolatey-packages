﻿$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\glow_1.5.0_Windows_i386.zip.sbom"
  file64        = "$toolsDir\glow_1.5.0_Windows_x86_64.zip.sbom"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file
Remove-Item -Path $packageArgs.file64
