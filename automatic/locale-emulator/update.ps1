import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'xupefei/Locale-Emulator'
        regex32    = '/releases/download/.*/Locale.Emulator\.(?<Version>[\d\.]*)[\w-]*.zip'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"            
            "(?i)([$]toolsDir `"Locale.Emulator.)[\d\.]+(\\LEGUI.exe)`"" = "`${1}$($Latest.Version)`${2}`""
        }        
    }
}

update