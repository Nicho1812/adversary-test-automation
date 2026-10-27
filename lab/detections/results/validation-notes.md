# Detection-as-Code Validation Notes

Date: 2026-10-27

## Sigma Rules

- `sigma/ubuntu_process_execution.yml`
- `sigma/windows_account_discovery.yml`
- Both rules passed Sigma CLI syntax validation with no reported issues.
- Both remain candidates; end-to-end detection by the new Sigma rules is not confirmed.

## Ubuntu Validation

- Query: `data.audit.key:placement_test AND data.audit.type:SYSCALL AND data.audit.success:yes`
- Wazuh search returned 39,846 events for the reviewed period.
- An inspected event matched the fields and existing Wazuh rule 100100.
- This confirms general process telemetry, not technique-specific detection by the new Sigma rule.

## Windows Validation

- Wazuh query: `data.win.eventdata.commandLine: "net user"`
- Search returned 32 events for the reviewed period.
- An inspected Sysmon Event ID 1 event matched `net user`.
- Existing Wazuh rule 92031 generated an alert mapped to T1087 Account Discovery.
- The generated Lucene query used different field names from observed Wazuh fields and was not successfully validated end to end.

## Custom Wazuh Rule

- Custom rule 100101 was added as a child of rule 92031.
- Manager configuration validation passed.
- An earlier representative `wazuh-logtest` matched rule 100101, but a live alert from that rule was not confirmed.
- Existing Ubuntu rule 100100 was preserved.

## Limitations

- Existing Wazuh alerts are not proof that the new Sigma rules generated alerts.
- Backend field mapping and end-to-end Sigma validation remain outstanding.
- Most technique-specific outcomes remain unverified; T1547.001 was not tested.
