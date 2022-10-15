Import-Module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'adobe-fonts/source-han-code-jp'
        regex32    = '/(?<Version>[\d\.]+)R.zip$'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update