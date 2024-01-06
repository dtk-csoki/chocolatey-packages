$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url32         = 'https://www.adobe.com/go/Connect11_32msi'
  checksum32    = '3587dd228962bb6d376a657185460c7e5bbba43dae91271c889a269cfa178bf4'
  url64         = 'https://www.adobe.com/go/Connect11msi'
  checksum64    = 'addf0f579d16e5ca2906eecb966aab6d12a4f2278c982bbf99f2f46df80138c3'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
