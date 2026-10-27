# Detection Coverage Results

Date: 2026-10-27

## Verdicts

- **Detected:** Technique-specific detection confirmed.
- **Missed:** Test ran, relevant telemetry was reviewed, but no detection occurred.
- **Not verified:** Evidence is insufficient to confirm detection or a miss.
- **Not tested:** Technique was not executed.

| Technique | Execution | Evidence / Reason | Verdict |
|---|---|---|---|
| T1082 | Executed | `hostnamectl`; general process telemetry only | Not verified |
| T1033 | Executed | `id`; no confirmed technique-specific detection | Not verified |
| T1016 | Executed | `ip addr`; general process telemetry only | Not verified |
| T1057 | Executed | Detection outcome not verified | Not verified |
| T1049 | Executed | Detection outcome not verified | Not verified |
| T1087 | Executed | Sysmon Event ID 1; Wazuh rule 92031 mapped `net user` to T1087 | Detected |
| T1059.003 | Executed | Rule 92852 alert observed; attribution to the test uncertain | Not verified |
| T1005 | Executed | Detection outcome not verified | Not verified |
| T1059.004 | Manual equivalent | Technique-specific detection not verified | Not verified |
| T1552.001 | Manual equivalent | Technique-specific detection not verified | Not verified |
| T1070.004 | Manual equivalent | Technique-specific detection not verified | Not verified |
| T1547.001 | Not executed | Test skipped due to startup-persistence or registry changes | Not tested |

## Summary

- Confirmed detections: 1/12 (8.3%).
- Not verified: 10 techniques.
- Not tested: 1 technique.
- No confirmed misses established by the reviewed evidence.

The score is a confirmed-detection rate, not a miss rate. Existing Wazuh alerts do not prove that the new Sigma rules generated alerts.
