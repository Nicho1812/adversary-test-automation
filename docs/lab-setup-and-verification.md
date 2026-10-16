# Lab Setup and Verification

## Purpose

This document records the single-target Lab-as-Code implementation
for the authorised adversary-test laboratory.

## Reduced Scope

The current implementation focuses on one Ubuntu 24.04 target.
The Windows target and cross-target communication are deferred,
pending supervisor approval of the reduced scope.

## Network Design

| Interface | Address | Network |
|---|---|---|
| Ubuntu lab interface | 192.168.56.10/24 | VirtualBox internal network: cyber-lab |
| Ubuntu management interface | 192.168.57.10/24 | VirtualBox host-only |

The NAT adapter must be disabled in the isolated state.
The Ubuntu guest should have no IPv4 default route.

## Verification Results

The following checks passed on 16 October 2026:

- Ubuntu booted successfully with Vagrant.
- VirtualBox reported adapter 1 as none.
- Adapter 2 was configured as the internal network.
- Adapter 3 was configured as the host-only network.
- Ubuntu retained its lab and management IPv4 addresses.
- Ubuntu had no IPv4 default route.
- An external ping attempt returned "Network is unreachable".

These checks verify the observed Ubuntu VM state. They do not
by themselves prove that every form of external connectivity is blocked.

## Reproducibility Status

A fresh clone from GitHub successfully created and provisioned a new Ubuntu VM. The build script verified the expected lab and management IP addresses, no IPv4 default route, and VirtualBox adapter 1 set to 
one.

The destroy-and-rebuild lifecycle test passed: the disposable VM was destroyed, recreated from the fresh clone, and the network isolation checks passed.
## Safety and Authorisation

Only test systems within the authorised lab.
Do not connect the lab to campus networks, public systems,
third-party systems or personal systems.

Confirm the reduced scope with the supervisor before treating
the single-target implementation as the final approved deliverable.


