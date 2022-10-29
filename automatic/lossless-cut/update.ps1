$ErrorActionPreference = 'Stop'
import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url64   
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'mifi/lossless-cut'
        regex64    = 'LosslessCut-win-x64.(zip|7z)'         
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            # "(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            # "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor none -noCheckUrl