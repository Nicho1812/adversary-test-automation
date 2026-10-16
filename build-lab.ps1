$ErrorActionPreference = "Stop"
$LabDir = Join-Path $PSScriptRoot "lab"
$VBoxManage = Join-Path $env:ProgramFiles "Oracle\VirtualBox\VBoxManage.exe"

Push-Location $LabDir
try {
    vagrant validate
    if ($LASTEXITCODE -ne 0) { throw "Vagrant validation failed." }

    vagrant up
    if ($LASTEXITCODE -ne 0) { throw "Vagrant startup failed." }

    $network = vagrant ssh -c "ip -br address; ip route" | Out-String
    $network
    if ($LASTEXITCODE -ne 0) { throw "SSH network check failed." }
    if ($network -match '(?m)^default\s') { throw "Unexpected IPv4 default route." }
    if ($network -notmatch '192\.168\.56\.10/24' -or
        $network -notmatch '192\.168\.57\.10/24') {
        throw "Expected lab or management IP is missing."
    }

    $vmLine = & $VBoxManage list runningvms
    if ($LASTEXITCODE -ne 0) { throw "Could not query VirtualBox." }
    $vmLine

    Write-Host "`nUbuntu address and routing checks passed."
    Write-Host "Verify the VM's adapter 1 is none using VBoxManage showvminfo."
}
finally {
    Pop-Location
}

