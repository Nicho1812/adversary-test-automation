# Lab and Tool Setup Checklist

## 1. Host

### Priority
- [ ] Windows cloud VM available
- [ ] Confirm VM access and resources

### If time/resources allow
- [ ] Confirm additional virtualisation options

---

## 2. Lab as Code

### Priority
- [ ] Set up Vagrant
- [ ] Confirm Vagrant works with the available environment

---

## 3. Targets

### Priority
- [ ] Set up one Windows target
- [ ] Set up Ubuntu target if available

### If time/resources allow
- [ ] Set up OWASP Juice Shop
- [ ] Set up C/C++ target

---

## 4. Network

### Priority
- [ ] Confirm isolated network
- [ ] Confirm IT approval

---

## 5. Telemetry

### Priority
- [ ] Set up Sysmon
- [ ] Set up auditd if Ubuntu is used
- [ ] Set up Elastic or Wazuh
- [ ] Confirm telemetry is working

### If time/resources allow
- [ ] Set up Winlogbeat if required

---

## 6. Adversary Emulation

### Priority
- [ ] Set up Atomic Red Team
- [ ] Run selected Atomic tests

### If time/resources allow
- [ ] Explore CALDERA
- [ ] Explore Stratus Red Team

---

## 7. Network Testing

### Priority
- [ ] Set up Nuclei
- [ ] Run relevant Nuclei tests

### If time/resources allow
- [ ] Explore Scapy
- [ ] Explore boofuzz
- [ ] Explore Nmap NSE
- [ ] Explore tcpreplay

---

## 8. Software Testing

### Priority
- [ ] Set up Semgrep
- [ ] Set up OWASP ZAP Automation Framework
- [ ] Run relevant tests

### If time/resources allow
- [ ] Explore AFL++
- [ ] Explore libFuzzer
- [ ] Explore Trivy

---

## 9. Orchestration

### Priority
- [ ] Set up Python and pytest
- [ ] Create automated test execution

### If time/resources allow
- [ ] Set up GitHub Actions/self-hosted runner

---

## 10. Reporting

### Priority
- [ ] Prepare ATT&CK Navigator
- [ ] Record results as JSON
- [ ] Commit results to GitHub

### If time/resources allow
- [ ] Create Sigma rules where required

---

## 11. AI Tooling

### Priority
- [ ] Confirm LLM API access and spending limit
- [ ] Create manual test cases
- [ ] Generate LLM test cases
- [ ] Compare LLM-generated and manual tests

### If time/resources allow
- [ ] Explore promptfoo
- [ ] Explore other AI tools

---

## Required Approvals / Access

- [ ] IT approval for isolated network
- [ ] Windows cloud VM
- [ ] GitHub organisation/private repository
- [ ] Rules of engagement
- [ ] Student acceptable-use declaration
- [ ] Self-hosted runner access if required
- [ ] LLM API access if required
