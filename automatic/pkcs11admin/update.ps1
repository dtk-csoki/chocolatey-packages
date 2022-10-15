$ErrorActionPreference = 'Stop'
import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'Pkcs11Admin/Pkcs11Admin'
        regex32    = 'Pkcs11Admin-(?<Version>[\d\.]+).zip$'
   }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName32)`""
          "(`"Pkcs11Admin-)[\d\.]+(\\)"    = "`${1}$($Latest.Version)`${2}"
        }

        "tools\chocolateyuninstall.ps1" = @{
          "`'(Pkcs11Admin-)[\d\.]+(.zip`')"    = "`${1}$($Latest.Version)`${2}"
        }
    }
}

update -ChecksumFor none