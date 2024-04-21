$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2024_04_10_10_53/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = '76e77d982b65c83e442a12bb61fedddce980ba3a45e792cfbb38625be28beb57'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
