# RiftRange — Final Implementation Specification

This specification freezes the v1 implementation contract. Changes that violate an invariant, authority boundary or public contract require an ADR/RFC and migration/compatibility plan.

## HTTP conventions
- Prefix `/api/v1`; JSON UTF-8; explicit content type.
- Resource IDs are opaque UUID/ULID-style identifiers and authorization is re-evaluated after lookup.
- Cursor pagination for unbounded collections.
- Mutation request/response schemas are versioned in OpenAPI; unknown security-sensitive fields are rejected where ambiguity is dangerous.
- Stable error codes follow the common error standard.

| Method | Route | Purpose | Gate |
|---|---|---|---|
| `POST` | `/workspaces/{workspace}/labs` | Create lab from immutable template | auth + validation + idempotency where side-effecting |
| `POST` | `/labs/{lab}/provision` | Request provisioning; idempotent | auth + validation + idempotency where side-effecting |
| `POST` | `/labs/{lab}/terminate` | Request deterministic teardown | auth + validation + idempotency where side-effecting |
| `GET` | `/labs/{lab}` | Read desired/observed/reconciliation state | auth + validation + idempotency where side-effecting |
| `POST` | `/agents/enroll` | One-time agent enrollment | auth + validation + idempotency where side-effecting |
| `POST` | `/agents/{agent}/heartbeat` | Authenticated heartbeat/observed state | auth + validation + idempotency where side-effecting |

## Compatibility
Additive compatible changes may ship in v1. Removing/renaming/changing semantics requires deprecation + migration and normally a new API major. Golden request/response fixtures run in CI.
