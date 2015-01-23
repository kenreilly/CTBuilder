Set-Variable -name sysdrive -Scope global -value (Get-Item Env:\SystemDrive).Value;
Set-Variable -name appRoot -Scope global -Value "$sysdrive\CTIO";
Set-Variable -name downloadRoot -Scope global -value "$sysdrive\CTIO\Downloads";

function Install-CTIO {	
	New-Item -ItemType Directory -Force -Path $appRoot | Out-Null;
	New-Item -ItemType Directory -Force -Path $downloadRoot | Out-Null;
	Write-Output "CTIO Installed";
}


function Install-DriverPacks {

	$remoteHost = "http://driverpacks.net/";
	$response = Invoke-WebRequest "$remoteHost/driverpacks/latest"
	$links = $response.parsedHTML.getElementsByTagName("a");

	foreach ($tag in $links) {
	    if ($tag.innerHTML -eq "download") {     
	        $webResponse = Invoke-WebRequest -Uri ($remoteHost + $tag.pathname) 
	        $link =  $webResponse.links | where href -like "*torrent*";
	        $href = ($remoteHost + $link.href);

			Get-DriverPackTorrents($href);
	    }
	}
}

function Get-DriverPackTorrents($url) {

	$webResponse = Invoke-WebRequest -Uri $url 
	$webResponse;
	$div = $webResponse.links | where href -like "*torrent*"
	$div;
	# $tags = $webResponse.parsedHTML.getElementsByTagName("a");
	# $dl = $tags | where {$_.innerText -like "Download*"}
	# $dl	
}

function RetrieveHeader($url) {

    Invoke-WebRequest -Uri $url -Method head 
}

function DownloadIfNewer($filepath, $url) {
	$webResponse = RetrieveHeader($url);
	$remoteLastModified = ($webResponse.LastModified) -as [DateTime]
}