# RiftRange — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## Domain objects
- `Workspace`
- `LabTemplate`
- `Lab`
- `LabNode`
- `NetworkPolicy`
- `RuntimeLease`
- `Agent`
- `ScenarioPack`
- `Scenario`
- `ScenarioRun`
- `RunStep`
- `TelemetryEvent`
- `Detection`
- `Artifact`
- `Scorecard`

## Aggregate rules
- Aggregate mutations occur through application commands, never controller/model convenience writes.
- Aggregate version is checked on conflicting writes.
- Invariants are tested with illegal-transition/negative cases.
- Domain objects do not import Laravel/Eloquent/vendor SDKs.

## Frozen v1 invariants
1. No lab reaches RUNNING until required nodes and network policy are observed healthy.
2. Every external runtime resource has project/workspace/lab ownership labels and a lease.
3. Termination is idempotent and converges even after orchestrator restart.
4. Public v1 scenario capability cannot invoke arbitrary shell or target arbitrary Internet hosts.
