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

Clean-clone build, automated provisioning from a clean clone,
teardown and rebuild have not yet been confirmed successful.

Before declaring the implementation complete, verify:

1. The Vagrantfile validates.
2. A clean clone can build and configure Ubuntu using documented commands.
3. Ubuntu has the expected lab and management addresses.
4. NAT is disabled and no unintended IPv4 default route exists.
5. External connectivity restrictions are tested and recorded.
6. The VM can be destroyed and recreated from the repository.
7. Actual results and any limitations are documented.

## Safety and Authorisation

Only test systems within the authorised lab.
Do not connect the lab to campus networks, public systems,
third-party systems or personal systems.

Confirm the reduced scope with the supervisor before treating
the single-target implementation as the final approved deliverable.
