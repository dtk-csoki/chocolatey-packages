import-module au

function global:au_GetLatest {
	$releases	= 'https://kmymoney.org/windows.html'
	$regex		= '/kmymoney/[\d\.]+/windows/'
	$url		= (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex

	$releases	= $url.href
	$regex		= 'kmymoney-(?<Version>[\d\.-]+)-windows-.*_64(-cl)?.exe$'
	$url		= (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex

    return @{
		Version = $matches.version -replace '-', '.'
		URL64   = $releases + $url.href		
	}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{			
			"(^(\s)*url64\s*=\s*)('.*')"		= "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')"	= "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -checksumFor 64