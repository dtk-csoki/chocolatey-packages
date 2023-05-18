$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    zipFileName = "$($env:ChocolateyPackageVersion).zip"    
}
Write-Verbose "Uninstall zip: $($packageArgs.zipFileName)"

$fontFiles = (Get-ChildItem -Path "$([Environment]::GetFolderPath('Fonts'))" -Filter 'SourceHanCodeJP*.otf').Name

Remove-Font $fontFiles -Multiple

Write-Warning 'If you receive any errors uninstalling, please reboot and try again to release the font files.'
