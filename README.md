# Cyber Security Placement â€“ Adversary Test Automation

## Project Overview

This project investigates and develops an automated adversary-testing
approach within an isolated and authorised laboratory environment.

The project will explore how adversary behaviours can be represented as
repeatable test cases and mapped to the MITRE ATT&CK framework.

The project will also investigate automated adversary emulation,
software and protocol testing, and the use of AI and LLMs for test-case
generation. AI-generated tests will be compared with manually written
tests.

## Target Set

The proposed target environment includes:

- Windows target
- Ubuntu server
- OWASP Juice Shop
- One small C/C++ library

The final target configuration will be confirmed with the supervisor.

## Out of Scope

The following activities are outside the project scope:

- Campus networks
- Public systems
- Third-party systems
- Personal systems
- Unauthorised systems
- Testing outside the authorised laboratory environment
- Live malware
- Real personal data

## Documentation

Project documentation, planning documents,
and other placement materials are maintained in the
[`docs/`](docs/) folder.

The contents of the `docs` folder may be updated throughout the
placement as the project develops and supervisor feedback is received.

## Escalation Contact

**Supervisor:** Dr Ahsan

Any unexpected security, infrastructure or scope issue will be reported
to the supervisor before proceeding.

## Authorisation

All testing activities will be performed only within the authorised
and isolated laboratory environment and in accordance with the agreed
rules of engagement.

## Single-Target Lab-as-Code

The current implementation focuses on one Ubuntu 24.04 target.
The Windows target and cross-target testing are deferred pending
supervisor approval of the reduced scope.

### Start and verify

From the repository root, run:

    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\build-lab.ps1"

Verify Ubuntu's addresses and routes:

    cd lab
    vagrant ssh -c "ip -br address; ip route"

Expected addresses:
- Lab interface: 192.168.56.10/24
- Management interface: 192.168.57.10/24
- No IPv4 default route
- VirtualBox adapter 1 disabled (none)

### Stop and remove the VM

From the lab directory, run:

    vagrant halt

To remove the Ubuntu VM, run:

    vagrant destroy

Review the confirmation before proceeding.

### Reproducibility status

A fresh clone from GitHub successfully created and provisioned a new Ubuntu VM. The build script verified the expected lab and management IP addresses, absence of an IPv4 default route, and VirtualBox adapter 1 set to `none`.

The destroy-and-rebuild lifecycle test passed: the disposable VM was destroyed, recreated from the fresh clone, and the network isolation checks passed.


