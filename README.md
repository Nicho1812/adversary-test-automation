# Adversary Test Automation

## Overview

This project explores building a repeatable and isolated cybersecurity testing lab using Vagrant and Oracle VirtualBox.

## Current Setup

The current implementation uses one Ubuntu 24.04 virtual machine with:

- An internal lab network.
- A separate host-only management network.
- NAT disabled in the final configuration.
- Automated network verification.

The Windows target and cross-target testing are deferred pending supervisor approval.

## Requirements

- Windows
- Oracle VirtualBox
- Vagrant
- PowerShell

## Build and Verify

Run this command from the repository root:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\build-lab.ps1"
```

The script creates or reconfigures the Ubuntu VM and checks its network configuration.

Expected results:

- Lab IP: `192.168.56.10/24`
- Management IP: `192.168.57.10/24`
- No IPv4 default route
- VirtualBox adapter 1: `none` (NAT disabled)
- VirtualBox adapter 2: `intnet` (internal network)
- VirtualBox adapter 3: `hostonly` (management network)

## Manual Verification

From the `lab` directory, run:

```powershell
vagrant ssh -c "ip -br address; ip route"
```

## Stop or Remove the Lab

From the `lab` directory, stop the VM:

```powershell
vagrant halt
```

To remove the VM and its virtual disks:

```powershell
vagrant destroy
```

To rebuild the lab, return to the repository root and run the build command again.

## Test Results

The following tests passed:

- Fresh-clone build from GitHub.
- Ubuntu VM creation and provisioning.
- Network address and routing checks.
- Verification that NAT is disabled.
- Destroy-and-rebuild test using a disposable VM.

These results apply to the single-Ubuntu setup. They do not verify Windows deployment or communication between multiple targets.

## Evidence

The `evidence/` directory contains:

- `lab-verification.txt`
- `virtualbox-adapters.txt`
- `rebuild-test-summary.txt`

## Safety

Use the lab only for authorised testing. Do not test external or third-party systems without permission. Consult the supervisor if unexpected connectivity or scope issues arise.

**Supervisor:** Dr Ahsan
