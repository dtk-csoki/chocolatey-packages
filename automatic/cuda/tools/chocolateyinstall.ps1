$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda_12.2.0_536.25_windows.exe'
  checksum     = 'db438aca524f593422aa32c63314285e57b54b31c24033553757cfe5bb7174ff'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Skipping installation because Cuda supports only Windows 10, Windows 2016 and Windows 2019.'
  return
}

Install-ChocolateyPackage @packageArgs
