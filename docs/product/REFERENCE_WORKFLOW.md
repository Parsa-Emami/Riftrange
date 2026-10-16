# RiftRange: reference workflow

Status: planned domain acceptance; the current JSON structure preview does not implement this workflow.

Validate one fixed template -> start rootless nodes -> prove egress deny -> heartbeat -> kill/restart orchestrator -> reconcile -> run safe scenario -> repeated stop with no resource leaks.

Required invariants:

- Only allowlisted scenario capabilities
- Lease/fencing ownership before side effects
- RUNNING requires observed healthy resources

Required UAT:

- یک template ثابت را راه‌اندازی و stop کن؛ container/network/mount اضافه باقی نماند
- orchestrator وسط provisioning کشته شود؛ restart به حالت صحیح برسد
- سناریو اجازهٔ shell دلخواه، mount میزبان و هدف اینترنتی ندهد

Machine contract: tests/scenarios/clone-to-value.json. C01/C04 create and freeze the actual synthetic positive/negative fixture formats; no real secrets, user source/traffic/case data or unlicensed corpus. A clean source clone must reproduce the entire workflow with restart and restore at C30.
