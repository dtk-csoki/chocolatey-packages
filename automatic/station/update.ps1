$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
    $releases = 'https://github.com/getstation/desktop-app/releases/latest'
    # $regex   = 'browserX-Setup-(?<Version>[\d\.]+).exe$'    
    $regex   = '/releases/tag/v(?<Version>[\d\.]+)'
    (Get-RedirectedUrl $releases) -match $regex

    return @{
        Version = $matches.version
        URL32 = 'https://github.com/getstation/desktop-app/releases/download/v' + $matches.Version + '/Station-Setup.exe'        
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

update