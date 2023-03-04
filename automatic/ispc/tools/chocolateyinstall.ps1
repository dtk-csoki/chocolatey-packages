$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

<#$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'MSI'

  file        = "$toolsDir\ispc-v1.18.0-windows.msi&response-content-type=application%2Foctet-stream"
  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}#>

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\ispc-v1.18.0-windows.msi&response-content-type=application%2Foctet-stream"  
}

Install-ChocolateyPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "InfiniTex.lnk"
$targetPath = Join-Path $toolsDir "InfiniTex-0.9.16.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath