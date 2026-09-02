# RiftRange — State Machines v7

- **Lab:** `DRAFT -> READY -> PROVISIONING -> RUNNING -> STOPPING -> TERMINATED | FAILED`
- **Run:** `QUEUED -> STARTING -> RUNNING -> COMPLETED | FAILED | CANCELLED`
- **Agent:** `ENROLLING -> ONLINE -> DEGRADED -> OFFLINE -> REVOKED`

Transitions are domain commands with authorization, optimistic version check where applicable, audit event and invariant tests. Illegal transitions fail closed and are observable.
