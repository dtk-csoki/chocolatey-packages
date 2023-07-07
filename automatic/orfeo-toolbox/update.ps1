$ErrorActionPreference = 'Stop'
import-module au

function global:au_GetLatest {
     $releases = 'https://www.orfeo-toolbox.org/download/'     
	 $regex64  = 'OTB-(?<Version>[\d\.]+)(-rc)?(?<VersionRC>\d+)?-Win64.zip'
     #https://www.orfeo-toolbox.org/packages/OTB-8.1.2-rc1-Win64.zip

	 $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	 
     $url64         = $download_page.links | ? href -match $regex64
     $version = $matches.Version

     if ($matches.VersionRC) {
        $version += "." + $matches.VersionRC + "-rc"
     }

     return @{
        Version = $version
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{		
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"            
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"            
            "(^(\s)*[$]version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"              
        }
    }
}

update -ChecksumFor 64