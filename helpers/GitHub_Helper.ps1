function github_GetInfo {
    Param([array]$ArgumentList)    

    $debug = 0;
    $github_url = 'https://github.com/'
    $github_repository_root = "$github_url" + $ArgumentList.repository

    If ($debug) { Write-Host "`$github_redirected_url  = (Get-RedirectedUrl "${github_repository_root}/releases/latest")" }
    $github_redirected_url  = (Get-RedirectedUrl "${github_repository_root}/releases/latest")
    # v is optional (ex: https://github.com/adobe-fonts/source-han-code-jp/releases/latest)
    $github_latest_version  = "$github_redirected_url" -match '/tag/(?<FullVersion>v?(?<Version>.*))' # Get version to re-use for expanded_assets

    $github_expanded_assets = "$github_repository_root" + '/releases/expanded_assets/' + $matches.FullVersion
    $isVersionMatched = $false

    $regex32 = $ArgumentList.regex32;
    $regex64 = $ArgumentList.regex64;
    $output = @{}

    If ($matches.Version -ne $null) {
        # If version has not the correct format - Ex: 2.0.12R -> 2.0.12 (source-han-code-jp)
        If ($matches.Version -Notmatch "^[\d\.]+$") {
            $matches.Version = $matches.Version -replace '([\d\.]+).*', '$1'
        } 

        If ($debug) { Write-Host "`$download_page = Invoke-WebRequest -Uri $github_expanded_assets -UseBasicParsing" }
        $download_page = Invoke-WebRequest -Uri $github_expanded_assets -UseBasicParsing    
    } Else {
        # If "${github_repository_root}/releases/latest" does not redirect to an URL like '/tag/v(?<Version>.*)'
        # Ex: zVirtualDesktop - <h1 data-view-component="true" class="d-inline mr-3">1.0.98.14</h1>
        $download_page = Invoke-WebRequest -Uri $github_redirected_url -UseBasicParsing        
        $version = $download_page -match '<h1 data-view-component="true" class="d-inline mr-3">(?<Version>[\d\.]+)<'
    }
    $version = $matches.Version

    If ($regex64) {
        $uri64_path = ($download_page.links | ? href -match $regex64 | select -Last 1).href

        If ($uri64_path -eq $null) {
            $uri64_path = $download_page.Links.href -match $regex64
        }

        If ($uri64_path -match "^https://") {
            $output += @{ URL64 = $uri64_path }
        } Else {
            $output += @{ URL64 = $github_url + $uri64_path }
        }

        If ($version) {
            $output += @{ Version = $version -replace '-', '.' }
            $isVersionMatched = $true
        } ElseIf ($matches.Version) {
            # cleanVersion - Ex: source-han-code-jp - 2.0.12R -> 2.0.12
            $version = $matches.Version -replace "([\d\.]+).*", '$1'
        }
    }
    If ($regex32) {
        $uri32_path = ($download_page.links | ? href -match $regex32 | select -Last 1).href

        If ($uri32_path -eq $null) {            
            $uri32_path = $download_page.Links.href -match $regex32
        }

        If ($uri32_path -match "^https://") {
            $output += @{ URL32 = $uri32_path }
        } Else {
            $output += @{ URL32 = $github_url + $uri32_path }
        }

        If (($version) -And ($isVersionMatched -eq $false)) {
            $output += @{ Version = $version -replace '-', '.' }         
        } ElseIf ($matches.Version) {
            # cleanVersion - Ex: source-han-code-jp - 2.0.12R -> 2.0.12
            $version = $matches.Version -replace "([\d\.]+).*", '$1'
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