# Lab Setup and Verification

## Purpose

This document records the setup and verification procedure for the
authorised adversary-test laboratory.

## Network design

| Component | Address | Network |
|---|---|---|
| Ubuntu lab interface | 192.168.56.10/24 | VirtualBox internal network: cyber-lab |
| Windows lab interface | 192.168.56.21/24 | VirtualBox internal network: cyber-lab |
| Ubuntu management interface | 192.168.57.10/24 | VirtualBox host-only |
| Windows management interface | 192.168.57.21/24 | VirtualBox host-only |

The external/NAT adapter is intended to be disabled in the final lab state.
Neither guest should have an unintended default route.

## Current validation evidence

The validation VMs passed these checks:

- Ubuntu and Windows could ping each other over the internal lab network.
- Ubuntu had no IPv4 default route.
- Windows had no IPv4 default route.
- VirtualBox reported adapter 1 as none, adapter 2 as intnet,
  and adapter 3 as hostonly for both guests.
- Ubuntu could not resolve example.com during the external connectivity test.

These results describe the existing validation VMs. They do not establish
that a clean clone can recreate the lab automatically.

## Clean-clone acceptance criteria

The clean-clone test is not yet confirmed complete. Before marking the lab
reproducible, verify that:

1. Both Vagrantfiles validate.
2. Both guests can be created from a clean clone without manual console work.
3. Both guests have their expected lab and management addresses.
4. Both guests have no unintended default route.
5. Ubuntu and Windows can communicate over the internal lab network.
6. The external adapter is disabled in the final state.
7. Teardown and rebuild from a clean clone succeeds.
8. Test results and any limitations are recorded.

## Safety and authorisation

Only test systems within the authorised lab. Do not connect the lab to
campus networks, public systems, third-party systems, or personal systems.
Obtain the required infrastructure approval before treating isolation
as formally authorised.