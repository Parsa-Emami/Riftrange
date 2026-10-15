# RiftRange — Failure & Recovery Proof v7

## Mandatory injected failures
- orchestrator crash mid-provision
- duplicate command
- expired lease
- agent offline
- provider timeout
- partial teardown
- egress attempt
- quota exhaustion

## Pass criteria
For every failure: no invariant violation; no unauthorized bypass; no unbounded retry storm; orphan resources are reconciled; user-visible state becomes correct; telemetry identifies cause; retry/cancel/manual recovery is documented; recovery test is automated where feasible.
