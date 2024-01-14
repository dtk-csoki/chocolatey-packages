$ErrorActionPreference = 'Stop'
Import-Module au

$releases = 'https://slproweb.com/download/win32_openssl_hashes.json'

$json = (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content | ConvertFrom-Json 
$Win32OpenSSL   = $json.files.psobject.properties.Where({$_.Name -match "Win32OpenSSL-[\d_]+.exe"}).value
$Win64OpenSSL   = $json.files.psobject.properties.Where({$_.Name -match "Win64OpenSSL-[\d_]+.exe"}).value


function global:au_BeforeUpdate {
    $Latest.ChecksumType32 = 'sha512'
    $Latest.Checksum32     = $Win32OpenSSL.sha512 | Select -Last 1
    $Latest.ChecksumType64 = 'sha512'
    $Latest.Checksum64     = $Win64OpenSSL.sha512 | Select -Last 1
}

function global:au_GetLatest {
    return @{
        Version         = $Win64OpenSSL.basever | Select -Last 1
        URL32           = $Win32OpenSSL.url | Select -Last 1
        URL64           = $Win64OpenSSL.url | Select -Last 1        
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
          "(^(\s)*url32\s*=\s*)('.*')"        = "`${1}'$($Latest.URL32)'"
          "(^(\s)*checksumType32\s*=\s*)('.*')"   = "`${1}'$($Latest.ChecksumType64)'"
          "(^(\s)*checksum32\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum32)'"
          "(^(\s)*url64\s*=\s*)('.*')"        = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksumType64\s*=\s*)('.*')"   = "`${1}'$($Latest.ChecksumType64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')"   = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

update -ChecksumFor None