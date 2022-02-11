# Development Environment Setup

## Overview

Scripts for automating developer enviroment setup

## Steps

1. Check the `chocoPackages.config` file to ensure all desired packages are there
  
   **NOTE:** You can search for Chocolatey packages to add at the [Community Package Repository](https://community.chocolatey.org/packages)
   
   Be certain to confirm that a package has been marked as a **trusted package** and any checks have passed before adding it to your config file. 
   
   To add an entry to the `chocoPackages.config` you will need to know the id of the package. For example if you know you want to install [Python](https://community.chocolatey.org/packages/python/3.10.2) you may see that the command for CLI would be `choco install python` so the entry to make in the config file would be 

   ```xml
   <package id="python" />
   ```
   
   Optionall, you can also specify a version if you need to install a specific version of a package, for example:
   
   ```xml
   <package id="python" version="3.9.10" />
   ```
   
   Additional details about what can go into the `chocoPackages.config` can be found at [Packages.config](https://docs.chocolatey.org/en-us/choco/commands/install#packages.config)
   
3. Run `setup.cmd` as _Administrator_
4. Follow any prompts any the command window, _these can vary depending upon what is being installed_
5. Check for any errors
6. Reboot machine

## Expected Installs

* Chocolatey (latest version)
* All dependencies specified in your `chocoPackages.config`
* All modules specified in `poshModules.config`

## See Also

* [Set Up A Development Environment Using Chocolatey
](https://chocolatey.org/docs/development-environment-setup)
* [Install Command - choco install](https://chocolatey.org/docs/commandsinstall)
