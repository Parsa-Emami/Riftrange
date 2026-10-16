# RiftRange — Data Ownership v7

- **PostgreSQL:** authoritative workspaces/labs/scenarios/runs/leases
- **Valkey:** queues, short-lived locks and cache only
- **ObjectStore:** immutable run artifacts and exported reports
- **RuntimeProvider:** external observed state, reconciled projection

## Universal rules
- cache is never authority
- derived projections have checkpoint + rebuild + staleness metric
- secrets/evidence follow project-specific retention and redaction
- deletion does not rewrite immutable audit/custody history
