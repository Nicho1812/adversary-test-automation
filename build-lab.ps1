$ErrorActionPreference = "Stop"
$LabDir = Join-Path $PSScriptRoot "lab"
$VBoxManage = Join-Path $env:ProgramFiles "Oracle\VirtualBox\VBoxManage.exe"

Push-Location $LabDir
try {
    vagrant validate
    if ($LASTEXITCODE -ne 0) { throw "Vagrant validation failed." }

    if (!(Test-Path ".nat-disabled")) {
        throw "Isolation marker missing. Restore it before running verification."
    }

    vagrant up
    if ($LASTEXITCODE -ne 0) { throw "Vagrant startup failed." }

    $network = vagrant ssh -c "ip -br address; ip route" | Out-String
    if ($LASTEXITCODE -ne 0) { throw "SSH network check failed." }
    Write-Host $network

    if ($network -match '(?m)^default\s') {
        throw "FAIL: an IPv4 default route exists."
    }
    if ($network -notmatch '192\.168\.56\.10/24' -or
        $network -notmatch '192\.168\.57\.10/24') {
        throw "FAIL: expected IP address is missing."
    }

    $idFile = Join-Path $LabDir ".vagrant\machines\default\virtualbox\id"
    if (!(Test-Path $idFile)) { throw "Vagrant VM ID file not found." }
    $vmId = (Get-Content $idFile -Raw).Trim()
    $vmLine = & $VBoxManage list vms |
        Where-Object { $_ -match [regex]::Escape($vmId) } |
        Select-Object -First 1

    if (!$vmLine) { throw "Could not find this VM in VirtualBox." }
    $vmName = [regex]::Match($vmLine, '^"(.+)" \{').Groups[1].Value
    $info = & $VBoxManage showvminfo $vmName --machinereadable
    if ($LASTEXITCODE -ne 0) { throw "Could not inspect VirtualBox VM." }

    $nic1 = $info | Where-Object { $_ -match '^nic1=' } |
        Select-Object -First 1
    Write-Host "VirtualBox VM: $vmName"
    Write-Host "Adapter 1: $nic1"

    if ($nic1 -ne 'nic1="none"') {
        throw "FAIL: VirtualBox adapter 1 is not disabled."
    }

    Write-Host "`nPASS: Ubuntu isolation and network verification passed."
}
finally {
    Pop-Location
}