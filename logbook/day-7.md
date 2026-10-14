# Day 7 – Lab as Code Network Isolation and Troubleshooting

**Date:** 14 October 2026  
**Hours:** 5

## What I did

- Updated the Ubuntu and Windows Vagrantfiles to disable NAT adapters.
- Verified that NAT was disabled on both VMs in VirtualBox.
- Investigated Ubuntu host-only connectivity using Linux networking commands.
- Identified that Ubuntu's host-only IP address (`192.168.57.10`) was missing after restarting the VM.

## Outcome

Successfully disabled NAT adapters on both clean-clone VMs and identified the cause of the host-only connectivity issue. Network isolation and connectivity are not yet fully verified.

## Issues / Next Steps

Restore Ubuntu host-only connectivity, verify communication between the Ubuntu and Windows targets, test external connectivity restrictions, and validate clean-clone reproducibility.

## AI Usage

Used AI assistance to troubleshoot VM networking, inspect network configurations, and document testing results.
