function github_GetInfo {
    Param([array]$ArgumentList)    

    $debug = 1;
    $github_url = 'https://github.com/'
    $github_repository_root = "$github_url" + $ArgumentList.repository
    $github_latest_version  = (Get-RedirectedUrl "${github_repository_root}/releases/latest") -match '/tag/v(?<Version>.*)'
    $github_expanded_assets = "$github_repository_root" + '/releases/expanded_assets/v' + $matches.Version
    $isVersionMatched = $false

    $regex32 = $ArgumentList.regex32;
    $regex64 = $ArgumentList.regex64;
    $output = @{}

    $download_page = Invoke-WebRequest -Uri $github_expanded_assets -UseBasicParsing

    If ($regex64) {
        $uri64_path = ($download_page.links | ? href -match $regex64 | select -Last 1).href
        $output += @{ URL64 = $github_url + $uri64_path }
        If ($matches.Version) {
            $output += @{ Version = $matches.Version -replace '-', '.' }
            $isVersionMatched = $true
        }
    }
    If ($regex32) {
        $uri32_path = ($download_page.links | ? href -match $regex32 | select -Last 1).href
        $output     += @{ URL32 = $github_url + $uri32_path }
        If (($matches.Version) -And ($isVersionMatched -eq $false)) {
            $output += @{ Version = $matches.Version -replace '-', '.' }
         
        }
    }

    If (-Not($output.Version)) { Write-Warning "Version is missing."}
    If ((-Not($output.URL32))-And(-Not($output.URL64))) { Write-Warning "URL32 and/or URL64 are missing."}

    If ($debug) {
        Write-Host "github_releases_latest:" "${github_repository_root}/releases/latest"
        Write-Host "github_latest_version:" $github_latest_version
        Write-Host "github_expanded_assets:" $github_expanded_assets
        Write-Host "Regex32:" $ArgumentList.regex32
        Write-Host "Regex64:" $ArgumentList.regex64
        Write-Host "Version:" $matches.Version
        Write-Host "uri32_path: " $uri32_path
        Write-Host "uri64_path: " $uri64_path
        Write-Host "output: " ($output | Format-Table | Out-String)
    }

    return $output
}