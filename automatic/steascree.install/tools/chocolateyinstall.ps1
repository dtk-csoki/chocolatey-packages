$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp = Get-PackageParameters
$DesktopShortcutPath = "$env:PUBLIC\Desktop\SteaScree.lnk"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\steascree-1.5.4-windows.exe"
  silentArgs  = '--mode unattended'
}

Install-ChocolateyInstallPackage @packageArgs

function InstallShortcut {
  param (
    $ShortcutPath
  )

  $installLocation = "${env:ProgramFiles(x86)}\SteaScree"

  $shortcutArgs = @{
    shortcutFilePath = $ShortcutPath
    workingDirectory = "$installLocation"
    targetPath       = "$installLocation\SteaScree.exe"
  }

  Install-ChocolateyShortcut @shortcutArgs
}

If ($pp['DesktopShortcut']) {
    InstallShortcut $DesktopShortcutPath
}