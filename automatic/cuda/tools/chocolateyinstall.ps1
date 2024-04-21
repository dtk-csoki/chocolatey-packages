$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://developer.download.nvidia.com/compute/cuda/12.4.1/local_installers/cuda_12.4.1_551.78_windows.exe'
  checksum     = '7d20c5eb186e4d3c64680fe5096bed05926aea89754192102323c956c26244de'
  checksumType = 'sha256'

  silentArgs   = '/s'
}

If ( [environment]::OSVersion.Version.Major -lt 10 )  {
  Write-Warning 'Skipping installation because Cuda supports only Windows 10, Windows 2016 and Windows 2019.'
  return
}

Install-ChocolateyPackage @packageArgs
