$ErrorActionPreference = 'Stop'
Import-Module au

function global:au_BeforeUpdate {    
    $Latest.ChecksumType32 = 'sha256'
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
	$releases      = 'https://helpx.adobe.com/fr/adobe-connect/connect-downloads-updates.html'	
    $regex_version = 'v(?<Version>[\d\.]+)'
    $regex_url32     = 'https://www.adobe.com/(.*)?go/(?<url_suffix32>Connect(\d+)_32msi)'
    $regex_url64     = 'https://www.adobe.com/(.*)?go/(?<url_suffix64>Connect(\d+)msi)'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page -match "$regex_version.64" | Out-Null
    $version = $matches.Version -Replace '_','.'

    ($download_page.links | ? href -match $regex_url32).href | Out-Null
    $url_suffix32 = $matches.url_suffix32
    ($download_page.links | ? href -match $regex_url64).href | Out-Null
    $url_suffix64 = $matches.url_suffix64    

    return @{
        Version = $version
        URL32   = 'https://www.adobe.com/go/' + $url_suffix32
        URL64   = 'https://www.adobe.com/go/' + $url_suffix64
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url32\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -NoCheckUrl -ChecksumFor None
