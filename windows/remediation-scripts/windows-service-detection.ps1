<#
windows-service-detection.ps1 v0.0.1
github.com/stormcrowdev/dm
Run as SYSTEM made for 64-bit context
Detects if the specificed service exists and if it is running
#>

$servicename = "SericeNameGoesHere"

<# Checks if service exists #>
$existsarray = 0
$serviceexist = Get-Service -Name $servicename -ErrorAction SilentlyContinue
if ($null -ne $serviceexist) {
    $existsarray++
}
if ($existsarray -ne 0) {
    Write-Host "$servicename exists"
} else {
    Write-Host "$servicename does not exist"
    exit 1
}

<# Checks if service is running #>
$runningarray = 0
$servicerunning = Get-Service -Name $servicename -ErrorAction SilentlyContinue | Where-Object {$_.Status -eq "Running"}
if ($null -ne $servicerunning) {
    $runningarray++
}
if ($existsarray -ne 0) {
    Write-Host "$servicename is available and running"
    exit 0
} else {
    Write-Host "$servicename is not there/running"
    exit 1
}
