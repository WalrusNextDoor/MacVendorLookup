$URL = "api.macvendors.com/"

foreach($line in Get-Content $Args[0]) {
    $URL2 = $URL + $line
    $response = Invoke-WebRequest $URL2 | Select-Object -Expand Content

    New-Object -TypeName PSCustomObject -Property @{
    Vendor = $response
    MacAddress = $line
    } | Export-Csv -Path $Args[1] -NoTypeInformation -Append

    Start-Sleep -s 1
}
