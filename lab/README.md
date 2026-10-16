# Cybersecurity Testing Lab

This lab uses Vagrant and VirtualBox to build reproducible Linux and Windows targets for cybersecurity testing.

## Lab Configuration

| Setting | Ubuntu Target | Windows Target |
|---|---|---|
| Operating System | Ubuntu 24.04.3 LTS | Windows 10 |
| CPUs | 2 | 2 |
| RAM | 2048 MB | 4096 MB |
| Internal IP | `192.168.56.10` | `192.168.56.21` |
| Management IP | `192.168.57.10` | `192.168.57.21` |

- Internal network: `cyber-lab` (`192.168.56.0/24`)
- Host-only management network: `192.168.57.0/24`

## Verification Results

- Both Vagrant configurations validate successfully.
- Both VMs boot successfully from a fresh repository clone.
- Ubuntu SSH and Windows WinRM work with NAT enabled.
- Both VMs have the expected internal and management IP addresses.
- Ubuntu-to-Windows connectivity passes.
- Windows-to-Ubuntu connectivity passes.
- Both VMs can be shut down and restarted in normal NAT mode.

## Network Isolation Status

**Pending verification.** The current working configuration uses NAT. An attempt to disable NAT caused Ubuntu SSH authentication problems, so the isolated configuration has not yet passed verification.

Before declaring the lab isolated, verify that:

- NAT is disabled on both VMs.
- Host-only management access remains available.
- Both targets communicate over the internal lab network.
- External connectivity is blocked.
- The lab can be rebuilt and torn down successfully from a clean clone.

Do not consider the lab fully isolated until all these checks pass.