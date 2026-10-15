# RiftRange — Definitive Sequential Roadmap v7

**Portfolio order:** 5 / 10
**Complexity:** Very high
**Planning estimate:** 14–20 focused weeks (not a promise; recalibrate after Phase 1)

**Why this order:** Strong systems/security signal, but privileged runtime orchestration and isolation make it a poor first repository.

## First executable proof
Immutable lab template → rootless Podman node → enrolled agent → heartbeat → orchestrator restart/reconcile → deterministic teardown.

## Rules for this repository
- One phase at a time; no implementation work for phase N+1 before phase N exit evidence is merged.
- Contract/schema changes precede dependent implementation.
- Every retryable operation is idempotent.
- Every derived store/projection has a rebuild path.
- Negative and failure tests are part of the feature, not post-release hardening.
- Status claims must be evidence-backed.

## Phase 0 — Foundation & identities

**Implementation deliverables**
- Create Laravel control plane and Go orchestrator/agent modules
- Define UUID/ULID identity policy and tenant boundary
- Implement authn/authz skeleton and audit context
- Create PostgreSQL migrations for lab/template/node/agent identities

**Required verification**
- unit tests for IDs and authorization
- migration up/down test
- request-id/audit context integration test

**Definition of Done**
- Fresh checkout boots control plane and both Go binaries; authenticated health path and migrations pass.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 1 — Lab aggregate + transactional outbox

**Implementation deliverables**
- Implement Lab aggregate and immutable Template revision model
- Add state machine guards
- Implement transactional outbox and idempotent consumer contract
- Expose create/read lifecycle API from OpenAPI contract

**Required verification**
- aggregate transition tests
- outbox atomicity test
- duplicate command/idempotency tests

**Definition of Done**
- Lab creation is persisted atomically with its event; invalid transitions and duplicate requests are rejected deterministically.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 2 — RuntimeProvider + rootless Podman

**Implementation deliverables**
- Define RuntimeProvider interface
- Implement rootless Podman provider with explicit capability allowlist
- Pin image digests; deny privileged/host mounts/network by default
- Implement deterministic teardown

**Required verification**
- provider contract tests
- rootless smoke test
- forbidden capability abuse tests
- teardown leak test

**Definition of Done**
- One immutable template starts and stops in rootless Podman without privileged flags, leftover containers, mounts, or networks.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 3 — Agent enrollment + heartbeat

**Implementation deliverables**
- Implement one-time enrollment token flow
- Issue/rotate mTLS identity
- Implement heartbeat schema and monotonic lease metadata
- Reject replayed/expired enrollment material

**Required verification**
- enrollment replay tests
- certificate rotation tests
- clock-skew boundary tests

**Definition of Done**
- A new agent enrolls once, authenticates by mTLS, emits validated heartbeats, and cannot reuse enrollment credentials.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 4 — Reconciliation + leases

**Implementation deliverables**
- Implement desired/applied state loop
- Lease ownership and fencing token semantics
- Crash/restart reconciliation
- Exactly-once effects via idempotent commands, not exactly-once delivery claims

**Required verification**
- orchestrator kill/restart test
- dual-owner fencing test
- duplicate/out-of-order event tests

**Definition of Done**
- Killing the orchestrator during a transition converges to the correct applied state after restart without duplicate runtime resources.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 5 — Scenario compiler

**Implementation deliverables**
- Define safe scenario DSL/IR
- Compile only allowlisted actions
- Static validation of resource/network limits
- Version scenario schema and deterministic compiler output

**Required verification**
- golden compiler fixtures
- property tests for deterministic compilation
- malicious/oversized input tests

**Definition of Done**
- Same scenario input always produces the same normalized plan hash and cannot request forbidden host capabilities.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 6 — Telemetry + replay + scorecards

**Implementation deliverables**
- Instrument traces/metrics/logs with stable semantic attributes
- Persist replayable execution timeline
- Compute scorecards from immutable evidence
- Add bounded retention and redaction

**Required verification**
- trace propagation tests
- replay equality tests
- PII/secret redaction tests

**Definition of Done**
- A completed lab can be replay-audited from evidence and scorecard computation is deterministic.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 7 — Firecracker adapter + hardening

**Implementation deliverables**
- Implement RuntimeProvider adapter behind feature flag
- Define host prerequisites and failure modes
- Enforce microVM network/storage isolation
- Benchmark startup/teardown and leak behavior

**Required verification**
- adapter contract suite
- escape-surface configuration tests
- resource exhaustion tests

**Definition of Done**
- Firecracker passes the same provider contract as Podman and has documented host prerequisites and measured overhead.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Phase 8 — Public v1 evidence/release

**Implementation deliverables**
- Freeze compatibility contract
- Generate SBOM/provenance
- Run security, recovery, performance and install tests from clean host
- Publish signed release artifacts and reproducible demo

**Required verification**
- clean install test
- release verification test
- public demo acceptance suite

**Definition of Done**
- Public v1 can be installed from documentation, passes all release gates, and every security/performance claim links to executable evidence.
- CI is green from a clean checkout.
- New behavior is observable without logging secrets/sensitive payloads.
- Failure behavior and rollback/recovery note are documented.
- Contracts and README status are updated if externally visible behavior changed.

## Public v1 invariant
The project is not called production-ready merely because all phases are coded. `PUBLIC-V1-GO` requires the repository release gate, clean-install proof, security/recovery evidence and signed/verifiable release artifacts.
