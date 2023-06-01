$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2023_05_23_18_11/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = '7ec7a347aab2d81a353ab1231f2958a818b5a41d25635bf7f328fa39da478d74'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
