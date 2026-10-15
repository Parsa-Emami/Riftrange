# RiftRange — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## Golden E2E scenarios
1. Provision/reconcile/terminate one harmless lab
2. Crash orchestrator during provisioning then converge
3. Expire agent and mark degraded without deleting authoritative lab
4. Deny unauthorized cross-workspace operator
5. Reject forbidden egress/runtime flags

For every golden scenario record expected authoritative state, emitted event IDs/types, audit action, projection state, critical metrics and cleanup state. Run from a clean environment with deterministic synthetic fixtures. At least one scenario must fail mid-flight and then converge after restart/retry/reconciliation.
