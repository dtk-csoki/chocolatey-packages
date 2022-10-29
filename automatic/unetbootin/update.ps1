$ErrorActionPreference = 'Stop'
import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_GetLatest {
    $output = github_GetInfo -ArgumentList @{
        repository = 'unetbootin/unetbootin'
        regex32    = 'unetbootin-windows-(?<Version>.*).exe'        
    }
    If ($output.Version -match '\d{3}') {
        $output.Version = $output.Version -replace '(\d)(\d)(\d)', '$1.$2.$3'
    } ElseIf ($output.Version -match '\d{3}') {
        $output.Version = $output.Version -replace '(\d)(\d)(\d)(\d)', '$1.$2.$3.$4'
    }
    return $output
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none