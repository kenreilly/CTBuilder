# Remove CTIO module if loaded
if ((Get-Module CTIO)) {
	Remove-Module CTIO;
}

# Import CTIO and run setup
Import-Module $PSScriptRoot\..\CTIO\CTIO
Install-CTIO;

#Import Hadouken Modules
Import-Module "$hadoukenDir\Tools\PowerShellModules\Hadouken.Tools.Posh\Hadouken.Tools.Posh";

#Install DriverPacks
Install-DriverPacks;
