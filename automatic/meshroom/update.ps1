# Disabled (package not embeddable and no available on another location than fosshub) - https://docs.chocolatey.org/en-us/community-repository/moderation/package-validator/rules/cpmr0028
import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'alicevision/meshroom'
        regex64    = '/Meshroom-(?<Version>[\d\.]+)-win64.zip$'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"            
            "([$]toolsDir `"Meshroom-)[\d\.]+(.*)`"" = "`${1}$($Latest.Version)`${2}`""
        }
    }
}

update -ChecksumFor 64 -NoCheckUrl