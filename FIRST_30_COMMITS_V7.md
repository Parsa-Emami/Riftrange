# RiftRange — First 30 Commit Plan v7

These are atomic intent boundaries, not mandatory commit-message text. Do not combine unrelated items merely to hit a number.

1. chore: initialize toolchain manifests and lockfiles
2. ci: make repository validation executable
3. chore: add local development environment/health checks
4. test: add clean-bootstrap smoke test
5. docs: freeze Phase 0 invariants and ADR index
6. phase0: create Laravel control plane and Go orchestrator/agent modules
7. phase0: define UUID/ULID identity policy and tenant boundary
8. phase0: implement authn/authz skeleton and audit context
9. phase0: create PostgreSQL migrations for lab/template/node/agent identities
10. test(phase0): add unit tests for IDs and authorization
11. docs(phase0): record exit evidence and ADR updates
12. phase1: implement Lab aggregate and immutable Template revision model
13. phase1: add state machine guards
14. phase1: implement transactional outbox and idempotent consumer contract
15. phase1: expose create/read lifecycle API from OpenAPI contract
16. test(phase1): add aggregate transition tests
17. docs(phase1): record exit evidence and ADR updates
18. phase2: define RuntimeProvider interface
19. phase2: implement rootless Podman provider with explicit capability allowlist
20. phase2: pin image digests; deny privileged/host mounts/network by default
21. phase2: implement deterministic teardown
22. test(phase2): add provider contract tests
23. docs(phase2): record exit evidence and ADR updates
24. phase3: implement one-time enrollment token flow
25. phase3: issue/rotate mTLS identity
26. phase3: implement heartbeat schema and monotonic lease metadata
27. phase3: reject replayed/expired enrollment material
28. test(phase3): add enrollment replay tests
29. docs(phase3): record exit evidence and ADR updates
30. test: close Phase 0/1 regression or failure-proof gap before scope expansion
