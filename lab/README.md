# Cybersecurity Testing Lab

This lab uses Vagrant and VirtualBox to create reproducible Linux and Windows targets for cybersecurity testing.

## Lab Configuration

| Setting | Linux Target | Windows Target |
|---|---|---|
| Operating System | Ubuntu 24.04.3 LTS | Windows 10 |
| Provisioning | Vagrant | Vagrant |
| CPUs | 2 | 2 |
| RAM | 2048 MB | 4096 MB |
| Internal IP | 192.168.56.10 | 192.168.56.21 |

- Internal network: `cyber-lab`
- Subnet: `192.168.56.0/24`
- Both targets also have a NAT network interface.

## Verification Results

- Vagrant configurations created for both targets.
- Both VMs start successfully.
- Ubuntu SSH and Windows WinRM connections verified.
- Internal IP addresses configured successfully.
- Windows-to-Ubuntu connectivity verified.
- Ubuntu-to-Windows connectivity verified after allowing inbound ICMPv4 on Windows.

## Remaining Work

- Verify network isolation and outbound connectivity boundaries.
- Test recreating both VMs from a clean repository clone.
- Document the final reproducibility test results.
