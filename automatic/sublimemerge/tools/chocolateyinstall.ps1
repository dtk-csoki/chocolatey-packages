$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2089_x64_setup.exe'
  checksum64    = '97bda0d58de59abb7e7b42331962c18ab3e0c9f48ad6b4b40a18963d0128ff27'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs


[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $submergeInstallLocation = Join-Path -Path $_.InstallLocation -ChildPath 'smerge.exe'
    Install-BinFile -Name 'smerge' -Path $submergeInstallLocation
  }
} elseif ($key.Count -eq 0) {
  Write-Error "$packageName installation failed, unable to detect uninstall registry key."
  Write-Warning "Please report this to the package maintainer."
} elseif ($key.Count -gt 1) {
  Write-Error "$packageName installation failed, multiple ($($key.Count)) uninstall registry keys found."
  Write-Warning "Please inform the package maintainer that the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $($_.DisplayName): $($_.InstallLocation)" }
}
