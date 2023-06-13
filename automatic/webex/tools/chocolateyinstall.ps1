$ErrorActionPreference = 'Stop';
$pp = Get-PackageParameters

$sa = ""
$sa += if ($pp.ACCEPT_EULA) { ' ACCEPT_EULA=TRUE' }
$sa += if ($pp.AUTOSTART_WITH_WINDOWS) { ' AUTOSTART_WITH_WINDOWS=' + $pp.AUTOSTART_WITH_WINDOWS }
$sa += if ($pp.DEFAULT_THEME) { ' DEFAULT_THEME="' + $pp.DEFAULT_THEME + '"' }
$sa += if ($pp.DELETEUSERDATA) { ' DELETEUSERDATA=1' }
$sa += if ($pp.EMAIL) { ' EMAIL=' + $pp.EMAIL }
$sa += if ($pp.ENABLEOUTLOOKINTEGRATION) { ' ENABLEOUTLOOKINTEGRATION=1' }
$sa += if ($pp.INSTALL_ROOT) { ' INSTALL_ROOT="' + $pp.INSTALL_ROOT + '"' }
$sa += if ($pp.ALLUSERS) { ' ALLUSERS=1' }
$sa += if ($pp.INSTALLWV2) { ' INSTALLWV2=1' }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex_x86.msi'
  checksum      = '43E0DFACE98BB578D053CD14D1622F72941B2B7AFDD6F54EBBF985EBD7B0F3C5'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = 'BAFAFA8407A1BEAD6DEFA29068EAB53DB8111D2B4163FAC0F31E801F111CA3EA'
  checksumType64= 'sha256'

  silentArgs    = "$sa /qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
