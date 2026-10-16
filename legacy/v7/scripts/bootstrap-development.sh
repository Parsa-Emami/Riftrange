#!/usr/bin/env bash
set -euo pipefail

# Run from the repository root after verifying the GitHub owner/module namespace.
# This script intentionally performs source bootstrap only; infrastructure credentials are never generated.

composer create-project laravel/laravel:^13.0 apps/control-plane
mkdir -p services/orchestrator services/agent
(cd services/orchestrator && go mod init github.com/Parsa-Emami/riftrange/orchestrator)
(cd services/agent && go mod init github.com/Parsa-Emami/riftrange/agent)

printf "\nBootstrap command sequence completed. Review generated files, pin/lock dependencies, then run repository validation before commit.\n"
