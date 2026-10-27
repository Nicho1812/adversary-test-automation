# Detection-as-Code Validation Notes

Date: 2026-10-27

## Sigma candidate

File: `lab/detections/sigma/ubuntu_process_execution.yml`

- Basic structural checks passed for the title, ID, experimental status, log source, detection section, selection, condition, false positives, and informational level.
- The rule remains experimental.
- Sigma CLI parser validation completed on 2026-10-27 with 0 errors, 0 condition errors, and 0 validation issues.
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

1. Sigma CLI syntax validation passed on 2026-10-27 with 0 errors, 0 condition errors, and 0 validation issues.
2. OpenSearch backend conversion was attempted. The backend plugin installed successfully, but conversion required a processing pipeline and no predefined pipeline was available for the selected target. Custom field mapping and live Wazuh detection testing remain outstanding.
3. Test the rule against the intended backend before claiming operational detection.
4. Review existing evidence for remaining techniques and update coverage verdicts only when supported.

## OpenSearch query validation

- Sigma CLI validation passed on 2026-10-27: 0 errors, 0 condition errors, 0 issues.
- Converted the rule to this OpenSearch Lucene query using `--without-pipeline`:
  `data.audit.key:placement_test AND data.audit.type:SYSCALL AND data.audit.success:yes`
- In Wazuh Threat Hunting (2026-10-19 to 2026-10-27), the query returned 39,846 hits. An inspected `ubuntu-lab` event contained all three matching field values and matched Wazuh rule `100100` (Ubuntu process execution detected by placement_test audit rule).
- This confirms the query fields match observed Wazuh data, but does not prove technique-specific detection. A processing pipeline and full backend compatibility remain unverified.

## Windows Account Discovery Sigma Validation

- Rule: `lab/detections/sigma/windows_account_discovery.yml`
- Sigma CLI syntax validation passed on 2026-10-27 with 0 errors, 0 condition errors, and 0 issues.
- OpenSearch Lucene conversion produced:
  `(Image:(*\\net.exe OR *\\net1.exe)) AND CommandLine:*net\ user*`
- Wazuh Threat Hunting query `data.win.eventdata.commandLine:"net user"` returned 32 hits for the selected period (2026-10-19 to 2026-10-27).
- An inspected event contained `data.win.eventdata.commandLine: net user` and `data.win.eventdata.image: C:\Windows\SysWOW64\net.exe`. It was a Sysmon Event ID 1 and matched existing Wazuh rule 92031, mapped to T1087 Account Discovery.
- This confirms relevant telemetry and an existing Wazuh alert. It does not establish that the new Sigma rule itself generated an alert or that its generated OpenSearch query works without field mapping.
- Limitation: the generated query uses `Image` and `CommandLine`, while the observed Wazuh fields are `data.win.eventdata.image` and `data.win.eventdata.commandLine`. Backend field mapping and live validation of the Sigma rule remain outstanding.

## Windows Sigma Field-Mapping Follow-up — 2026-10-27

- Updated the Windows Sigma candidate to use observed Wazuh field paths: `data.win.eventdata.image` and `data.win.eventdata.commandLine`.
- Sigma CLI syntax validation passed after the update with 0 errors, 0 condition errors, and 0 issues.
- Wazuh DQL query `data.win.eventdata.commandLine: "net user"` returned 32 hits.
- An inspected event confirmed the command line `net user`, image `C:\Windows\SysWOW64\net.exe`, Sysmon Event ID 1, and existing Wazuh rule 92031 mapped to T1087 Account Discovery.
- Attempts to query `data.win.eventdata.image` separately returned no results. The combined Lucene query could not be tested successfully in Wazuh DQL because of a syntax error.
- Outcome: relevant telemetry is confirmed, but end-to-end execution of the new Sigma rule is not verified. Do not claim that the candidate Sigma rule itself generated the existing Wazuh alert.

## Final Task 9 Status — 2026-10-27

### Detection coverage

- T1087: Confirmed technique-specific evidence from existing Wazuh rule 92031 and Sysmon process-creation telemetry.
- T1059.003: A matching Wazuh rule 92852 alert was observed, but attribution to the recorded test is not fully confirmed.
- T1082, T1033, T1016, T1057, T1049, T1005, T1059.004, T1552.001 and T1070.004: Detection outcome remains unverified based on the evidence reviewed.
- T1547.001: Not tested because the test was skipped.

### Completion limitations

- Both Sigma candidate rules passed syntax validation.
- Relevant Ubuntu and Windows telemetry was observed, but this does not establish that the new Sigma candidates generated alerts.
- The Ubuntu query matched 39,846 events; the Windows `net user` search returned 32 events for the reviewed period. These are search-result counts, not detection-coverage scores.
- End-to-end Sigma execution, backend field mapping and successful validation of the generated Windows Lucene query remain outstanding.
- Do not interpret unverified techniques as confirmed misses or count existing Wazuh alerts as alerts generated by the new Sigma candidates.
