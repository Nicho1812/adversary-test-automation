$ErrorActionPreference = "Stop"
$LabDir = Join-Path $PSScriptRoot "lab"
$Marker = Join-Path $LabDir ".nat-disabled"
$VBoxManage = Join-Path $env:ProgramFiles "Oracle\VirtualBox\VBoxManage.exe"
$IdFile = Join-Path $LabDir ".vagrant\machines\default\virtualbox\id"

Push-Location $LabDir
try {
    vagrant validate
    if ($LASTEXITCODE -ne 0) { throw "Vagrant validation failed." }

    # Bootstrap using NAT, then restore isolation.
    Remove-Item $Marker -Force -ErrorAction SilentlyContinue

    if (Test-Path $IdFile) {
        vagrant reload
        if ($LASTEXITCODE -ne 0) { throw "Could not switch existing VM to bootstrap networking." }

        vagrant provision
        if ($LASTEXITCODE -ne 0) { throw "Provisioning failed." }
    }
    else {
        vagrant up --provision
        if ($LASTEXITCODE -ne 0) { throw "Fresh Ubuntu bootstrap failed." }
    }

    Set-Content -Path $Marker -Value "NAT disabled; isolated lab mode" -NoNewline
    vagrant reload
    if ($LASTEXITCODE -ne 0) { throw "Could not enable isolated mode." }

    $network = vagrant ssh -c "ip -br address; ip route" | Out-String
    if ($LASTEXITCODE -ne 0) { throw "Guest network check failed." }
    Write-Host $network

    if ($network -match '(?m)^default\s') {
        throw "FAIL: IPv4 default route exists."
    }
    if ($network -notmatch '192\.168\.56\.10/24' -or
        $network -notmatch '192\.168\.57\.10/24') {
        throw "FAIL: expected lab or management IP is missing."
    }

    $vmId = (Get-Content $IdFile -Raw).Trim()
    $vmLine = & $VBoxManage list vms |
        Where-Object { $_ -match [regex]::Escape($vmId) } |
        Select-Object -First 1
    if (!$vmLine) { throw "Could not find VM in VirtualBox." }

    $vmName = [regex]::Match($vmLine, '^"(.+)" \{').Groups[1].Value
    $info = & $VBoxManage showvminfo $vmName --machinereadable
    if ($LASTEXITCODE -ne 0) { throw "Could not inspect VirtualBox VM." }

    $nic1 = $info | Where-Object { $_ -match '^nic1=' } |
        Select-Object -First 1
    Write-Host "VM: $vmName"
    Write-Host "Adapter 1: $nic1"

    if ($nic1 -ne 'nic1="none"') {
        throw "FAIL: NAT adapter is not disabled."
    }

    Write-Host "`nPASS: isolated Ubuntu build and network checks passed."
}
finally {
    Pop-Location
}
