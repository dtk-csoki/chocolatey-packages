$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
	$releases = 'https://gridtracker.org/index.php/downloads/gridtracker'

    $regex = '/gridtracker-releases/v(?<Version>[\d-]+).*/files'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	($download_page.links | ? href -match $regex | select -First 1).href | Out-Null

    $Version_url = $matches.Version
    $Version     = $Version_url -replace '-', '.'
    
    return @{
        Version = $Version
        URL32   = 'https://gridtracker.org/index.php/component/osdownloads/download/gridtracker-releases/v' + $matches.Version + '/' + 'gridtracker-v' + $matches.Version + '-windows'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -noCheckUrl