# Lab and Tool Setup Checklist

| Area | Priority | Status |
|---|---|---|
| **Host** | Windows cloud VM available | [ ] |
|  | Confirm VM access and resources | [ ] |
| **Lab as Code** | Set up Vagrant | [ ] |
|  | Confirm Vagrant works with the available environment | [ ] |
| **Targets** | Set up one Windows target | [ ] |
|  | Set up Ubuntu target if available | [ ] |
|  | Set up OWASP Juice Shop if practical | [ ] |
|  | Set up C/C++ target if practical | [ ] |
| **Network** | Confirm isolated network and IT approval | [ ] |
| **Telemetry** | Set up Sysmon | [ ] |
|  | Set up auditd if Ubuntu is used | [ ] |
|  | Set up Elastic or Wazuh | [ ] |
|  | Confirm telemetry is working | [ ] |
| **Adversary Emulation** | Set up and run selected Atomic Red Team tests | [ ] |
|  | Explore CALDERA if time/resources allow | [ ] |
|  | Explore Stratus Red Team if time/resources allow | [ ] |
| **Network Testing** | Set up and run relevant Nuclei tests | [ ] |
|  | Explore Scapy, boofuzz, Nmap NSE or tcpreplay if required | [ ] |
| **Software Testing** | Set up and run Semgrep | [ ] |
|  | Set up and run OWASP ZAP Automation Framework | [ ] |
|  | Explore AFL++, libFuzzer or Trivy if time allows | [ ] |
| **Orchestration** | Set up Python and pytest | [ ] |
|  | Create automated test execution | [ ] |
|  | Set up GitHub Actions/self-hosted runner if available | [ ] |
| **Reporting** | Prepare ATT&CK Navigator and record results | [ ] |
|  | Store results as JSON and commit to GitHub | [ ] |
|  | Create Sigma rules where required | [ ] |
| **AI Tooling** | Confirm LLM API access and spending limit | [ ] |
|  | Create manual test cases | [ ] |
|  | Generate and test LLM test cases | [ ] |
|  | Compare LLM-generated and manual tests | [ ] |
|  | Explore promptfoo if time allows | [ ] |

## Required Approvals / Access

- [ ] IT approval for isolated network
- [ ] Windows cloud VM
- [ ] GitHub organisation/private repository
- [ ] Rules of engagement
- [ ] Student acceptable-use declaration
- [ ] Self-hosted runner access if required
- [ ] LLM API access if required
