import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'albar965/littlenavmap'
        regex32    = '(/LittleNavmap-win32-(?<Version>[\d\.]+(\.beta)?).zip)'
        regex64    = '(/LittleNavmap-win64-(?<Version>[\d\.]+(\.beta)?).zip)'        
   }
}

function global:au_SearchReplace {
    @{
       "tools\chocolateyinstall.ps1" = @{        
          "(^(\s)*url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
          "(^(\s)*checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
          "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update