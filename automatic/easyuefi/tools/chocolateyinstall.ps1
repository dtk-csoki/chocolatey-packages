$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.easyuefi.com/downloads/EasyUEFI_Trial.exe'
  checksum      = 'c723e3b33efd9aa579ac206f2cdab93956f8758ba3a2fcabd55c70631e3808e8'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

# Note: Installation does not work with Windows 2012 R2
 If ( [environment]::OSVersion.Version.Major -lt 10 )  {
   Write-Warning 'Skipping installation because EasyUEFI supports only Windows 10, Windows 2016 and Windows 2019.'
   return
 }

Install-ChocolateyPackage @packageArgs
