# Lab Environment

This directory contains the Vagrant configuration for my cybersecurity testing lab.

## Current Status
- Ubuntu 24.04 VM successfully created using Vagrant and VirtualBox.
- Windows target and isolated lab network are not yet configured.

## Lab Network Configuration

Date: 13 October 2026

### Linux Target
- OS: Ubuntu 24.04.3 LTS
- Provisioning: Vagrant
- Provider: VirtualBox
- CPUs: 2
- RAM: 2048 MB

### Network Interfaces
- NAT interface: 10.0.2.15
- Internal lab interface: 192.168.56.10/24
- Internal network name: cyber-lab

### Verification
- Vagrant configuration validation: Successful
- VM restart: Successful
- SSH connection: Successful
- Internal interface address: Verified
- Default route: Still uses NAT

### Remaining Work
- Configure the Windows target through code.
- Connect the Windows target to the internal lab network.
- Verify connectivity between lab targets.
- Verify the intended isolation boundaries.
- Test recreation from a clean clone.

## Lab Network Verification

Date: 13 October 2026

### Target Configuration

| Target | Operating System | Internal Lab IP |
|---|---|---|
| Linux target | Ubuntu 24.04.3 LTS | 192.168.56.10 |
| Windows target | Windows 10 Enterprise | 192.168.56.20 |

### Network Configuration

- VirtualBox internal network: `cyber-lab`
- Subnet: `192.168.56.0/24`
- Both targets have an additional NAT interface.
- Both targets were provisioned using Vagrant.

### Connectivity Tests

| Test | Result |
|---|---|
| Windows to Ubuntu (`192.168.56.10`) | Successful |
| Ubuntu to Windows (`192.168.56.20`) | Successful after allowing inbound ICMPv4 on Windows |

### Remaining Work

- Verify network isolation and outbound connectivity boundaries.
- Confirm both targets can be recreated from the repository configuration.
- Document the clean-clone recreation test.
