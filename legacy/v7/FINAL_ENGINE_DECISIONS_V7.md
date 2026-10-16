# RiftRange — Final Engine Decisions v7

These are accepted v1 decisions, not open blockers. Alternatives require a future ADR and must preserve public/domain contracts.

1. Reference local sandbox provider is rootless Podman. Host networking and privileged containers are prohibited.
2. High-assurance RuntimeProvider is Firecracker-capable and remains adapter-isolated; it does not change domain contracts.
3. Lab network egress is deny-by-default. Explicit allowlists are per lab and audited. Arbitrary Internet targeting is outside the OSS product boundary.
4. Agent enrollment uses one-time tokens and short-lived mTLS identity from an AgentIdentityProvider; OpenBao PKI is the reference production provider.
5. Remote agent/content updates use TUF-style update metadata; content packs are immutable, hash-addressed, schema-versioned bundles.
6. Scenario actions are declarative safe-simulation capabilities. No arbitrary shell/payload primitive is part of the public v1 ABI.
7. PostgreSQL owns lab/scenario/run state. Runtime state is reconciled, never treated as authority.
