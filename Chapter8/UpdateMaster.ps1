Add-PsSnapin Microsoft.SharePoint.PowerShell

$web = Get-SPWeb "http://portal/sites/davetest1"
$web.MasterUrl
$web.CustomMasterUrl = "/sites/davetest1/_catalogs/masterpage/pencilblue.master" 
$web.MasterUrl
$web.Update()
$web.Dispose()


