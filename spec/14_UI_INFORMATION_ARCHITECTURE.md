# RiftRange — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## Primary product surfaces
- Mission Control
- Lab Templates
- Lab Detail / Desired vs Observed
- Topology
- Agents
- Scenario Library
- Run Replay
- Evidence/Scorecard
- Operations

## UX states every screen must represent
loading, empty, partial/stale, permission denied, validation error, transient failure/retry, permanent failure, pending async action, reconciled success. Security-sensitive async mutations must not be displayed as durable success before authoritative acknowledgement.

## Accessibility
Keyboard and screen-reader path exists for critical functionality even where graph/canvas visualization is used. Reduced-motion is honored. Status has text/icon semantics, not color alone.
