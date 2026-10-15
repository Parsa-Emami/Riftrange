# RiftRange

> v7.0 status: **ARCHITECTURE-GO / BOOTSTRAP-GO / SOURCE-NOT-IMPLEMENTED**

This directory is a standalone GitHub repository starting point for RiftRange. It contains the frozen architecture/specification, valid HTTP/event/configuration contracts, GitHub governance/security controls, and project-specific source bootstrap commands.

## Runtime boundary
- Laravel 13 control plane
- Go 1.27 orchestrator
- Go 1.27 lab agent
- PostgreSQL 18.6
- Valkey
- S3-compatible object storage
- rootless Podman
- OpenTelemetry

## First executable proof
Immutable lab template → rootless Podman node → enrolled agent → heartbeat → orchestrator restart/reconcile → deterministic teardown.

## Start
```bash
make validate
# verify the GitHub owner/module namespace first
make bootstrap
```

Read `ROADMAP_V7.md`, `PROJECT_START_CHECKLIST_V7.md`, `ACCEPTANCE_GATES_V7.md`, and `GITHUB_REPOSITORY_SETUP_V7.md` before the first code commit.

## Evidence rule
Architecture readiness is not production readiness. “S-tier”, “secure”, “resilient”, or performance claims require executable test/observability/failure/recovery/benchmark/release evidence.

## v7 portfolio position
Recommended implementation order: **5 / 10**. Strong systems/security signal, but privileged runtime orchestration and isolation make it a poor first repository.
