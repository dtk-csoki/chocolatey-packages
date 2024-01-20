$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'https://docs.rapidminer.com/latest/studio/releases'
    $regex = 'Version (?<Version>[\d\.]+)'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -match $regex

    return @{
        Version = $matches.Version        
        URL64   = 'https://pages.rapidminer.com/latest-studio-win64bit-download.html'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"            
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor 64
