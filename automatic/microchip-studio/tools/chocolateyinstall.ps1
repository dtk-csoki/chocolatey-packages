$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/as-installer-7.0.2594-full.exe'
  checksum     = '9e4238a7713dd2dcf31e4a2ad9b74d29fb5f27feaa20fea404e16e6366439db5'
  checksumType = 'sha256'

  silentArgs   = '-q'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }

Write-Warning @'
Important Notes:
  - microchip-studio needs a reboot to finish automatically the installation. After the restart, you will be prompted to install 2 certificates from:
    - Microchip Technology, Inc.
    - Atmel Corporation.
  - microchip-studio shortcut icon will appear on the desktop after about 5/10 minutes after the restart.
  - If you are upgrading from atmel-studio to microchip-studio, you may need to delete the following directories for each users was using atmel-studio:
    - `$env:appdata\Atmel
    - `$env:localappdata\Atmel
'@
