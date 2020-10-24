Param(
    [string] $poshModulesConfig
)

Function Install-Modules {
    Param (
        [string] $config,
        [string] $scope
    )

    [xml]$XmlConfig = Get-Content -Path $config

    foreach($module in $XmlConfig.modules.module) {
        $moduleId = $module.id
        $version = $module.version
        
        if(Get-Module -ListAvailable -Name $moduleId) {
            Write-Host "the module ${moduleId} is already installed"
        } else {
            if($version) {
                Write-Host "Installing Module - name: ${moduleId}, version: ${version}" -ForegroundColor Yellow
                Install-Module -Name $moduleId -RequiredVersion $version
            } else {
                Write-Host "Installing Module - name: ${moduleId}" -ForegroundColor Yellow
                Install-Module -Name $moduleId
            }
        }
    }
}

Install-Modules -config $poshModulesConfig