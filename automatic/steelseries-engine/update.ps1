$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { 
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32    
}

function global:au_GetLatest {        
    $regex = 'SteelSeriesGG(?<Version>[\d\.]+)Setup.exe'
    $redirectedUrl = Get-RedirectedUrl https://steelseries.com/gg/downloads/gg/latest/windows

    $redirectedUrl -match $regex | Out-Null

    return @{
        Version = $matches.version
        URL32 = $redirectedUrl
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -ChecksumFor none