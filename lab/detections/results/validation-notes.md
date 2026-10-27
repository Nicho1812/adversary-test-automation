# Detection-as-Code Validation Notes

Date: 2026-10-27

## Sigma candidate

File: `lab/detections/sigma/ubuntu_process_execution.yml`

- Basic structural checks passed for the title, ID, experimental status, log source, detection section, selection, condition, false positives, and informational level.
- The rule remains experimental.
- Full Sigma parser validation has not been performed.
- Live backend testing has not established that the rule generates an alert.
- The rule uses Wazuh-normalised field names; compatibility with a Sigma backend remains unverified.
- General process-execution telemetry must not be treated as proof of detection of a specific ATT&CK technique.

## Coverage evidence

- T1087: Wazuh rule 92031 and Sysmon Event ID 1 evidence show `net user`; the alert maps to the parent technique T1087 Account Discovery.
- T1082: execution was reported, but a technique-specific Wazuh detection has not been verified.
- T1033: no matching indicator was found in the reviewed Windows Sysmon alert file; other telemetry sources have not been fully assessed.
- Other techniques remain pending until relevant detection evidence is reviewed.
- T1547.001 remains not tested because the available test was skipped due to its startup-persistence or registry modifications.

## Limitations and next actions

1. Validate the Sigma rule with a compatible Sigma parser when available.
2. Test the rule against the intended backend before claiming operational detection.
3. Review existing evidence for remaining techniques and update coverage verdicts only when supported.
