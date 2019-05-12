﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  destination   = "$toolsDir"    
  file          = "$toolsDir\uncrustify-0.68.1-win32.zip"
  file64        = "$toolsDir\uncrustify-0.68.1-win64.zip"
}

Get-ChocolateyUnzip @packageArgs