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
| Host-only IP | 192.168.57.10 | 192.168.57.21 |

- Internal network: `cyber-lab`
- Internal subnet: `192.168.56.0/24`
- Host-only subnet: `192.168.57.0/24`
- NAT adapters are disabled in the clean-clone VM configurations.
- Network isolation and external connectivity restrictions remain to be verified.

## Verification Results

- Vagrant configurations created and validated for both targets.
- Both VMs previously started successfully.
- Ubuntu SSH and Windows WinRM connections were verified before the latest network changes.
- Internal IP addresses configured successfully.
- Windows-to-Ubuntu connectivity verified.
- Ubuntu-to-Windows connectivity verified after allowing inbound ICMPv4 on Windows.
- NAT adapters disabled on both clean-clone VMs.

## Outstanding Issues

- Ubuntu host-only connectivity is currently unavailable after disabling NAT.
- Restore host-only connectivity without re-enabling NAT.
- Verify communication between both targets over the internal lab network.
- Verify that external connectivity is blocked.
- Test recreating both VMs from a clean repository clone.
- Document the final reproducibility and network-isolation test results.

## Network Isolation Notes

The lab is intended to operate using an isolated internal network and a host-only management network.

NAT adapters are disabled in the clean-clone VM configurations. However, complete network isolation has not yet been verified. Do not treat the lab as fully isolated until the relevant connectivity and routing tests have passed.
