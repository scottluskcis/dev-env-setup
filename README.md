# Development Environment Setup

## Overview

Scripts for automating developer enviroment setup

## Steps

1. Check the `chocoPackages.config` file to ensure all desired packages are there
2. Run `setup.cmd` as _Administrator_
3. Follow any prompts any the command window, _these can vary depending upon what is being installed_
4. Check for any errors
5. Reboot machine

## Expected Installs

* Chocolatey (latest version)
* All dependencies specified in your `chocoPackages.config`
* All modules specified in `poshModules.config`

## See Also

* [Set Up A Development Environment Using Chocolatey
](https://chocolatey.org/docs/development-environment-setup)
* [Install Command - choco install](https://chocolatey.org/docs/commandsinstall)