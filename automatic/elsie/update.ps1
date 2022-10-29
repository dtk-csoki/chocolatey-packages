import-module au

function global:au_GetLatest {
    $releases = 'http://tonnesoftware.com/elsiedownload.html'
    $regex    = 'current version of Elsie is <b>(?<Version>[\d\.]+)</b> -'
    $regexURL = 'LCinstall\d+.exe$'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.Content -match $regex | Out-Null
    $version = $matches.Version
    $url = $download_page.links | ? href -match $regexURL | Select -First 1

    return @{
        Version = $version
        URL32   = 'http://tonnesoftware.com/' + $url.href
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

update