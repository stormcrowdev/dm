<#
windows-config-system-workgroup-name-detection.ps1 v0.0.1
github.com/stormcrowdev/dm
Run as SYSTEM made for 64-bit context
Detection - System Workgroup Name
#>

<# 15 char max - will be captialized regardless of case #>
$WORKGROUP = "FLEET"

$CSWORKGROUP = Get-ComputerInfo -Property CsWorkgroup | select -expandproperty CsWorkgroup
if ($CSWORKGROUP -eq "$WORKGROUP") {
    Write-Host "System Workgroup set to $CSWORKGROUP"
} else {
    Write-Host "System Workgroup set to $CSWORKGROUP"
    Write-Host "System Workgroup should be $WORKGROUP"
    exit 1
}

<#
windows-config-system-workgroup-name-remediation.ps1 v0.0.1
github.com/stormcrowdev/dm
Run as SYSTEM made for 64-bit context
Remediate - System Workgroup Name
#>

<# 15 char max - will be captialized regardless of case #>
$WORKGROUP = "FLEET" 

<# Updates Workgroup #>
Add-Computer -WorkGroupName "$WORKGROUP"
$CSWORKGROUP = Get-ComputerInfo -Property CsWorkgroup | select -expandproperty CsWorkgroup
if ($CSWORKGROUP -eq "$WORKGROUP") {
    Write-Host "System Workgroup set to $CSWORKGROUP"
    exit 0
} else {
    Write-Host "System Workgroup set to $CSWORKGROUP"
    Write-Host "System Workgroup should be $WORKGROUP "
    exit 1
}