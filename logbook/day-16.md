# Day 16 – Detection-as-Code

**Date:** 27 October 2026  
**Hours:** 5 hours

## What I Did
- Validated two Sigma detection rules for Ubuntu and Windows.
- Queried Wazuh telemetry and reviewed audit logs and Windows Sysmon events.
- Documented detection coverage for 12 MITRE ATT&CK techniques.
- Added detection results, validation notes and supporting evidence to GitHub.

## Outcome
Both Sigma rules passed syntax validation. Existing Wazuh rule 92031 detected Windows account-discovery activity mapped to T1087, while the end-to-end validation of the new Sigma rules remains incomplete.

## Next Steps
- Continue with the next task.
- Revisit Sigma backend mapping and end-to-end detection validation if required.

## AI Usage
Used AI assistance for troubleshooting, interpreting Wazuh results and preparing documentation.
