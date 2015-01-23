# CTBuilder Installation
#
# Copyright 2014 Kenneth Reilly
# Integrated Objects, Inc
# CoffeyTech, LLC

# Remove CTIO module if loaded
if ((Get-Module CTIO)) {
	Remove-Module CTIO;
}

# Import CTIO and run setup
Import-Module $PSScriptRoot\..\CTIO\CTIO
Install-CTIO;

#Test for Hadouken and install if it doesn't exist
$hadoukenDir = "$env:ProgramFiles (x86)\Hadouken";
if (!(Test-Path $hadoukenDir)) {
	iex ((new-object net.webclient).DownloadString('http://www.hdkn.net/install.ps1'));
	start  http://localhost:7890
}

#Install DriverPacks
Install-DriverPacks;
