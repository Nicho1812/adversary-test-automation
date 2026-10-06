# Day 1 – Scope and Induction

## 1. Project Scope

This project will investigate and develop an automated adversary-testing
approach within an isolated and authorised laboratory environment.

The project will explore how adversary behaviours can be represented as
repeatable test cases and mapped to the MITRE ATT&CK framework.

The project will investigate automated adversary emulation, software and
protocol testing, and the use of AI and LLMs for generating test cases.

The final scope will be confirmed and adjusted based on supervisor
feedback, available infrastructure and technical feasibility.

## 2. Proposed Target Set

The proposed target environment includes:

- Windows target
- Ubuntu server
- OWASP Juice Shop
- One small C/C++ library

The final target configuration will be confirmed with the supervisor.

## 3. Out of Scope

The following activities are outside the project scope:

- Testing campus networks or infrastructure
- Testing public systems
- Testing third-party systems
- Testing cloud accounts or external environments
- Testing personal or home networks
- Testing unauthorised systems
- Testing outside the authorised laboratory
- Using live malware
- Using real personal data
- Using real personal information or accounts

## 4. Rules of Engagement

Testing will only be conducted within the authorised and isolated
laboratory environment.

The final rules of engagement and acceptable-use requirements will be
confirmed with the supervisor before adversary emulation or security
testing begins.

## 5. Escalation Contact

**Supervisor:** Dr Ahsan

Any unexpected security, infrastructure or scope issue will be reported
to the supervisor before proceeding.

## 6. MITRE ATT&CK – Basic Understanding

MITRE ATT&CK is a framework used to organise and describe adversary behaviour.

A **tactic** describes why an adversary performs an action, while a **technique** describes how the action is performed.

The Enterprise ATT&CK framework includes the following tactics:

| Tactic | Purpose |
|---|---|
| Reconnaissance | How an adversary gathers information to plan future operations |
| Resource Development | How an adversary establishes resources to support operations |
| Initial Access | How an adversary gets into a network |
| Execution | How an adversary runs malicious code |
| Persistence | How an adversary maintains access |
| Privilege Escalation | How an adversary gains higher-level permissions |
| Stealth | How an adversary hides or conceals their actions |
| Defense Impairment | How an adversary weakens security mechanisms and tools |
| Credential Access | How an adversary obtains account names and passwords |
| Discovery | How an adversary learns about the environment |
| Lateral Movement | How an adversary moves through the environment |
| Collection | How an adversary gathers data of interest |
| Command and Control | How an adversary communicates with compromised systems |
| Exfiltration | How an adversary steals or removes data |
| Impact | How an adversary affects, interrupts, or destroys systems and data |

For this project, MITRE ATT&CK will be used to organise adversary behaviours into repeatable test cases. The specific techniques will be selected later based on the project scope, laboratory environment, and supervisor guidance.

### References

- MITRE ATT&CK – Enterprise Tactics: https://attack.mitre.org/tactics/enterprise/
- MITRE ATT&CK – Enterprise Techniques: https://attack.mitre.org/techniques/enterprise/

## 7. Questions for Supervisor

1. Will I use a university hypervisor or build the laboratory locally?

2. With my 16 GB laptop, should the Windows environment be reduced to
   one target?

3. Which lab-as-code approach should I use: Terraform or Vagrant?

4. Will Deakin provide the isolated network environment and the required
   written IT approval?

5. Will the Windows evaluation ISOs and other target environments be
   provided, or do I need to obtain them myself?

6. Should I continue using the private GitHub repository I created, or
   will a Deakin GitHub organisation and self-hosted runner be provided?

7. Will an LLM API key be provided, and what spending cap should be used?

8. What rules of engagement and student acceptable-use requirements do I
   need to complete before testing begins?

9. Which tools from the proposed tool stack should I prioritise, and
   which can be adjusted if they are too difficult or time-consuming?

10. Can we confirm the final project scope and target environment?
