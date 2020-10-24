Param (
  [switch] $SetupChocoPackages,
  [switch] $SetupPoshModules
)

Function Install-NeededFor {
  param(
    [string] $packageName = '', 
    [bool] $defaultAnswer = $true
  )
  if ($packageName -eq '') { return $false }

  $yes = '6'
  $no = '7'
  $msgBoxTimeout = '-1'
  $defaultAnswerDisplay = 'Yes'
  $buttonType = 0x4;
  if (!$defaultAnswer) { $defaultAnswerDisplay = 'No'; $buttonType = 0x104; }

  $answer = $msgBoxTimeout
  try {
    $timeout = 10
    $question = "Do you need to install $($packageName)? Defaults to `'$defaultAnswerDisplay`' after $timeout seconds"
    $msgBox = New-Object -ComObject WScript.Shell
    $answer = $msgBox.Popup($question, $timeout, "Install $packageName", $buttonType)
  }
  catch {
  }

  if ($answer -eq $yes -or ($answer -eq $msgBoxTimeout -and $defaultAnswer -eq $true)) {
    write-host "Installing '$packageName'"
    return $true
  }

  write-host "Not installing '$packageName'"
  return $false
}

# Variables
$thisDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$configDir = "${thisDir}\config"
$scriptDir = "${thisDir}\scripts"

# Chocoatey Packages Setup
if (($SetupChocoPackages -eq $true) -or (Install-NeededFor 'Chocolatey Packages')) {
  $chocoPackagesConfig = "${configDir}\chocoPackages.config"
  if(Test-Path -Path $chocoPackagesConfig) {
    & "${scriptDir}\setup-choco-pkgs.ps1" -chocoPackagesConfig $chocoPackagesConfig
  } else {
    Write-Error "config file not found: ${chocoPackagesConfig}"
  }
}

# Powershell Modules Setup
if(($SetupPoshModules -eq $true) -or (Install-NeededFor 'PowerShell Modules')) {
  $poshModulesConfig = "${configDir}\poshModules.config"
  if(Test-Path -Path $poshModulesConfig) {
    & "${scriptDir}\setup-posh-modules.ps1" -poshModulesConfig $poshModulesConfig
  } else {
    Write-Error "config file not found: ${poshModulesConfig}"
  }
}

# WrapUp
Write-Host "If you have made it here without errors, you should be setup and ready to hack on the apps."
Write-Warning "If you see any failures happen, you may want to reboot and continue to let installers catch up. This script is idempotent and will only apply changes that have not yet been applied."