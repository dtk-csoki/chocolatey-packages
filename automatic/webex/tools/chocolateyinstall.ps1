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
  checksum      = 'C5A31D030AC64E54F648B51442442AEA0CCBC7B5991E52B2CB589D9E66DA9503'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = '41AF459D3EBA4BA709B8D1CCE80FCEB47A2B12823FF476158843DC352C3A7501'
  checksumType64= 'sha256'

  silentArgs    = "$sa /qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
