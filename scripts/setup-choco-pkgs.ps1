Param(
    [string]$chocoPackagesConfig
)

Function Install-FromUrl {
    Param (
        [string] $url
    )
    Write-Host "installing from url: ${url}" -ForegroundColor Yellow
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString($url))
}

# Install Chocolatey
Install-FromUrl -url 'https://chocolatey.org/install.ps1'

# Install Dev Tools
cinst $chocoPackagesConfig
