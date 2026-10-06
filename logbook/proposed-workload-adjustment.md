# Proposed Workload Adjustment

## 1. Purpose

This document outlines proposed adjustments to the Cyber Security Placement – Adversary Test Automation plan based on my current technical experience, available hardware, placement timeframe, and available infrastructure.

The core objectives of the original plan will remain unchanged. The proposed adjustments are intended to make the workload achievable while maintaining the main learning and project outcomes.

The final workload and technical approach will be confirmed with the supervisor.

## 2. Proposed Lab Environment

### Host Environment

The original plan proposes a 32 GB RAM workstation or university hypervisor environment.

**Proposed adjustment:**
- Use a university/cloud environment if one is available.
- If the personal laptop is used, start with one Windows target because the laptop has 16 GB RAM.

The final environment will depend on available infrastructure and supervisor guidance.

### Lab as Code

The original plan proposes Terraform or Vagrant, with other options for pre-built or software-based environments.

**Proposed adjustment:**
- Use Vagrant as the main lab-as-code approach.
- Use Docker Compose where appropriate for software-based targets.
- Avoid using multiple lab provisioning approaches unless required.

## 3. Proposed Target Environment

The original plan proposes:

- Windows Server and workstation
- Ubuntu server
- OWASP Juice Shop
- One small C/C++ library

**Proposed adjustment:**
- Start with one Windows target.
- Include the Ubuntu server.
- Use OWASP Juice Shop and the C/C++ library where practical.
- Adjust the final target configuration based on available resources and project requirements.

## 4. Proposed Tool Prioritisation

The original plan includes a broad range of tools. To keep the workload achievable, the tools will be prioritised according to their relevance to the selected scenario, available resources, and placement timeframe.

### Adversary Emulation

**Priority:**
- Atomic Red Team

**Additional tools if time and resources allow:**
- CALDERA
- Stratus Red Team

Atomic Red Team will be prioritised before exploring additional adversary-emulation tools.

### Network Testing

The most relevant network-testing tools will be selected based on the final testing scenario.

Nuclei may be prioritised where relevant.

Additional network-testing tools will only be explored if they are required and time allows.

### Software Testing

**Priority:**
- Semgrep
- OWASP ZAP

**Additional tools if time allows:**
- AFL++
- libFuzzer

### Orchestration

**Proposed:**
- Python
- pytest
- GitHub Actions or a self-hosted runner, depending on available infrastructure.

### AI

**Priority:**
- LLM-generated test cases
- Comparison between AI-generated and manually written test cases

Additional AI tools will only be explored if time and resources allow.

## 5. Workload Prioritisation

The core project objectives will be prioritised first.

The workload will be adjusted based on:

- Available infrastructure
- 16 GB personal laptop limitations
- Current technical experience
- Placement timeframe
- Complexity of each tool
- Relevance to the selected testing scenario

Core activities will be completed before additional or advanced activities are attempted.

If a tool or activity is not practical within the available environment or timeframe, it may be reduced, replaced, or recorded as a limitation rather than extending the workload beyond the placement timeframe.

## 6. Infrastructure and Prerequisites

The following requirements will be confirmed before the relevant technical work begins:

- Windows cloud or virtual machine access
- Isolated network environment
- Required IT approval
- Target operating systems and software
- GitHub organisation or self-hosted runner requirements
- LLM API access and spending limits
- Rules of engagement and acceptable-use requirements

## 7. Proposed Priorities

The main priorities are:

1. Build a reproducible and isolated testing environment.
2. Establish the required telemetry.
3. Select and map relevant adversary behaviours to MITRE ATT&CK.
4. Automate selected adversary-testing activities.
5. Develop an automated testing pipeline where practical.
6. Investigate AI/LLM-generated test cases.
7. Compare AI-generated tests with manually written tests.
8. Evaluate and document the results.

Additional tools and advanced activities will be considered only after the core objectives are progressing successfully.

## 8. Final Confirmation

These adjustments are proposed to make the placement workload achievable while maintaining the core objectives of the original project plan.

The final workload, tools, target environment, and infrastructure requirements will be confirmed with the supervisor.
