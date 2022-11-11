import-module au

function global:au_GetLatest {
	$releases = 'https://www.xnview.com/fr/'
	$regex    = '>XnShell Extension</span> <span class="list-group-item-description">(?<Version>[\d\.]+)</span>'
	
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	$download_page.RawContent -match $regex
	$version = $matches.Version

    return @{
        Version = $version
        URL32   = "https://download.xnview.com/XnShellEx.exe"
        URL64   = "https://download.xnview.com/XnShellEx64.exe"
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update