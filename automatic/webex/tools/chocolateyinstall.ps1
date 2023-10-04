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
  checksum      = '3084D77D8C370605CFB94E1C9CE23EF2E76EB116A3C2E565089FC7B8084CEDDC'
  checksumType  = 'sha256'

  url64         = 'https://binaries.webex.com/WebexTeamsDesktop-Windows-Gold/Webex.msi'
  checksum64    = 'E726EC60D7E946036A39F83F36539AA29EA174F7A98E55B076698D5E247F6D71'
  checksumType64= 'sha256'

  silentArgs    = "$sa /qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}

Install-ChocolateyPackage @packageArgs
