Add-PSSnapin Microsoft.SharePoint.Powershell 

$bdcName = "Business Data Connectivity Service"
$bdcDBName = "BDC_Services_DB"

$creds = Get-Credential

$managedAccount = Get-ManagedAccount $creds $true
$pool = New-SPServiceApplicationPool -Name "BDC Service App Pool" -Account $managedAccount

Write-Host "Creating $bdcName Service Application and Proxy..."
$bdc = New-SPBusinessDataCatalogServiceApplication -Name $bdcName -ApplicationPool $pool -DatabaseName $bdcDBName

Write-Host "Starting the $bdcName Instance..."
Get-SPServiceInstance | where-object {$_.TypeName -eq $bdcName} | Start-SPServiceInstance

Write-Host "Completed Successfully!!"

