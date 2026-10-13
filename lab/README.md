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
