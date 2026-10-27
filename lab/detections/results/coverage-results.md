# Detection Coverage Results

Date: 2026-10-27

## Verdict definitions

- **Detected:** Evidence confirms a technique-specific detection.
- **Missed:** The technique ran, relevant telemetry was reviewed, and no corresponding detection was found.
- **Not verified:** Available evidence is insufficient to confirm detection or a miss.
- **Not tested:** The technique was not executed.

| Technique | Execution status | Telemetry evidence | Detection verdict | Reason |
|---|---|---|---|---|
| T1082 | Executed successfully | Manual `hostnamectl` test recorded by Wazuh rule 100100 | Not verified | General process telemetry was collected; technique-specific detection is unconfirmed |
| T1033 | Executed successfully | Manual `id` test recorded by Wazuh rule 100100; no matching indicator found in the reviewed Windows Sysmon file | Not verified | Reviewed evidence does not establish a technique-specific detection or a confirmed miss across all relevant telemetry |
| T1016 | Executed successfully | Manual `ip addr` test recorded by Wazuh rule 100100 | Not verified | General process telemetry was collected; technique-specific detection is unconfirmed |
| T1057 | Executed successfully | Technique-specific detection evidence not established in the reviewed records | Not verified | Execution is recorded in the existing coverage table, but the matching telemetry and detection outcome have not been verified |
| T1049 | Executed successfully | Technique-specific detection evidence not established in the reviewed records | Not verified | Execution is recorded in the existing coverage table, but the matching telemetry and detection outcome have not been verified |
| T1087 | Executed successfully | Windows Sysmon Event ID 1; Wazuh rule 92031 detected `net user` and mapped the alert to T1087 | Detected | Wazuh explicitly mapped the alert to Account Discovery; the subtechnique is not established |
| T1059.003 | Executed successfully | Windows Sysmon Event ID 1; Wazuh rule 92852 flagged a Windows command-prompt process and mapped it to T1059.003 | Detected | A technique-specific alert was observed, but attribution of this event to the recorded test is not fully confirmed |
| T1005 | Executed successfully | Technique-specific detection evidence not established in the reviewed records | Not verified | Execution is recorded in the existing coverage table, but the matching telemetry and detection outcome have not been verified |
| T1059.004 | Manual equivalent | Manual-equivalent test recorded; technique-specific detection not verified | Not verified | A manual equivalent does not establish an Invoke-AtomicTest result or a technique-specific detection |
| T1552.001 | Manual equivalent | Manual-equivalent test recorded; technique-specific detection not verified | Not verified | A manual equivalent does not establish an Invoke-AtomicTest result or a technique-specific detection |
| T1070.004 | Manual equivalent | Manual-equivalent test recorded; technique-specific detection not verified | Not verified | A manual equivalent does not establish an Invoke-AtomicTest result or a technique-specific detection |
| T1547.001 | Not executed | No test telemetry expected from the skipped test | Not tested | Test was skipped because available tests modify startup persistence or registry settings |

## Summary

One detection is directly confirmed for T1087. A matching T1059.003 alert was also observed (Wazuh rule 92852), although attribution to the recorded test is not fully confirmed. The three Gate 1 manual tests (T1082, T1016 and T1033) confirmed process telemetry collection, but not technique-specific detection. Other verdicts remain unverified where the available evidence is insufficient. T1547.001 was not tested.

## Detection score

- Confirmed: 1/12 techniques (T1087) — 8.3%.
- T1059.003 had a matching alert, but test attribution is uncertain.
- 10 techniques remain unverified; T1547.001 was not tested.
- This is a confirmed-detection rate, not a miss rate.

