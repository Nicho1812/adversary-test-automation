# Cyber Security Placement – Adversary Test Automation

## Project Overview

This project investigates automated adversary testing in an isolated and authorised laboratory environment.

It explores repeatable test cases, the MITRE ATT&CK framework, automated testing, and the use of AI and LLMs for test-case generation.

## Current Progress

The Lab-as-Code implementation currently uses one Ubuntu 24.04 virtual machine managed by Vagrant and VirtualBox.

The following have been tested successfully:

- Fresh-clone build from GitHub.
- Ubuntu VM creation and provisioning.
- Network address and routing verification.
- NAT disabled in the final isolated configuration.
- Destroy-and-rebuild testing.

The Windows target and other proposed targets have not yet been verified as part of the current implementation. The final scope remains subject to supervisor confirmation.

## Proposed Target Set

- Windows target
- Ubuntu server
- OWASP Juice Shop
- One small C/C++ library

The final target configuration will be confirmed with the supervisor.

## Out of Scope

- Campus networks
- Public systems
- Third-party systems
- Personal or unauthorised systems
- Testing outside the authorised laboratory environment
- Live malware
- Real personal data

## Documentation and Evidence

Project documentation and planning materials are maintained in [`docs/`](docs/).

Lab verification records and supporting evidence are maintained in [`evidence/`](evidence/).

Daily placement activities are recorded in [`logbook/`](logbook/).

## Escalation Contact

**Supervisor:** Dr Ahsan

Unexpected security, infrastructure, or scope issues will be reported to the supervisor before proceeding.

## Authorisation

All testing must remain within the authorised laboratory environment and follow the agreed rules of engagement.
