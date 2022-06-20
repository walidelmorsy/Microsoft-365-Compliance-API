# This is an example of using the Get-DLPdetailreport commandlet in the ExchangeOnline Management shell

# We then send the Data to Log Analytics.
Get-DLPdetailreport 
#specify your Exchange Admin credentials in the Automation account

$CrescentCred = Get-AutomationPSCredential -Name "m365demoaccount"

Connect-ExchangeOnline -Credential $CrescentCred

# you can customize this line how you like with extra parameters such as -Startdaye -EndDate Pagesize is default to 1000

$DLPdetailreport=Get-DlpDetailReport -PageSize 5000|Select *| ConvertTo-Json
write-output "Got DLP Report"
$CustomerId = "InputWorkspaceID"
$SharedKey = "InputSharedKey"
$StringToSign = "POST" + "`n" + $DLPdetailreport.Length + "`n" + "application/json" + "`n" + $("x-ms-date:" + [DateTime]::UtcNow.ToString("r")) + "`n" + "/api/logs"
$BytesToHash = [Text.Encoding]::UTF8.GetBytes($StringToSign)
$KeyBytes = [Convert]::FromBase64String($SharedKey)
$HMACSHA256 = New-Object System.Security.Cryptography.HMACSHA256
$HMACSHA256.Key = $KeyBytes
$CalculatedHash = $HMACSHA256.ComputeHash($BytesToHash)
$EncodedHash = [Convert]::ToBase64String($CalculatedHash)
$Authorization = 'SharedKey {0}:{1}' -f $CustomerId, $EncodedHash
write-output "Completed building Oauth Object"
$Uri = "https://" + $CustomerId + ".ods.opinsights.azure.com" + "/api/logs" + "?api-version=2016-04-01"
$Headers = @{
    "Authorization"        = $Authorization;
    "Log-Type"             = "CUSTOMLOG";
    "x-ms-date"            = [DateTime]::UtcNow.ToString("r");
    "time-generated-field" = $(Get-Date)
}
write-output "Connecting and sending data"
$Response = Invoke-WebRequest -Uri $Uri -Method Post -ContentType "application/json" -Headers $Headers -Body $DLPdetailreport -UseBasicParsing
if ($Response.StatusCode -eq 200) {
    Write-Output "Logs are Successfully Stored in Log Analytics Workspace" $Response.code
}
write-output "Finished" $Response.StatusCode
Write-Output $Response
Disconnect-exchangeOnline -Confirm:$false