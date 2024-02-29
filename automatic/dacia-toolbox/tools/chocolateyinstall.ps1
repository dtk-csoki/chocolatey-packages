$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.naviextras.com/content/!application/TOOLBOX/Agents/ReDa_ULC_4/2024_02_26_11_02/Dacia/DaciaMediaNavEvolutionToolbox-inst.exe'
  checksum     = 'b702973479b4103c3322c38ef09b21b8384dffe3290973f29b710996c51350ca'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
