import-module au

function global:au_GetLatest {
	<# $releases_32 = 'https://download.kde.org/stable/kmymoney/latest/win32/'
	
	$download_page_32 = Invoke-WebRequest -Uri $releases_32 -UseBasicParsing	
	$regex_32   = 'kmymoney(-i686)?(-w64)?-mingw32-(?<Version_32>[\d\.]+?)(-[\d\.]+)?-setup.exe$'
	$url_32 = $download_page_32.links |? href -match $regex_32 | select -Last 1	
	$version = $matches.Version_32 #>

	<#$releases = 'https://kmymoney.org/download.html'
	$regex_version = 'https://download.kde.org/stable/kmymoney/(?<Version>[\d\.]+)/'
	$urlpath = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links |? href -match $regex_version
	$version = $matches.Version

	$download_page_64 = Invoke-WebRequest -Uri $($urlpath.href + '/win64') -UseBasicParsing
	$regex_64   = 'kmymoney(\d+)?(-x86_64)?(-w64)?-mingw\d+-(?<Version_64>[\d\.]+?)(-[\d\.]+)?-setup.exe$'	
	$url_64 = $download_page_64.links |? href -match $regex_64 | select -Last 1

	$download_page_32 = Invoke-WebRequest -Uri $($urlpath.href + '/win32') -UseBasicParsing
	$regex_32   = 'kmymoney(\d+)?-mingw\d+-([\d\.]+?)(-[\d\.]+)?-setup.exe$'		
	$url_32 = $download_page_32.links |? href -match $regex_32 | select -Last 1#>

	$releases = 'https://binary-factory.kde.org/job/KMyMoney_Release_win64/1567/artifact/'	
	$regex = 'kmymoney-(?<Version>[\d\.-]+)-windows-.*_64-cl.exe$'
	
	$url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex
    return @{
		Version = $matches.version -replace '-', '.'
		URL64   = $releases + $url.href		
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

update -checksumFor 64