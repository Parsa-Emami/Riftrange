# RiftRange — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

| Data class | v1 rule |
|---|---|
| audit | minimum configured security retention; append-only semantics |
| telemetry | bounded by workspace policy; raw high-volume telemetry may expire before aggregate scores |
| runtime artifacts | TTL + explicit legal/security hold where configured |
| agent credentials | revoked/expired metadata retained; secrets/cert private keys never stored if not required |

## Classification labels
`PUBLIC`, `INTERNAL`, `CONFIDENTIAL`, `SECRET`, plus project-specific `EVIDENCE`/`SECURITY_TELEMETRY`. Classification drives logging, export, encryption, backup and retention behavior.

## Deletion
Deletion is an explicit domain operation with authorization, hold checks, audit and downstream projection/cache invalidation. Derived stores must not resurrect deleted authoritative data during rebuild.
