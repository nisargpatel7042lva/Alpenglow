Alpenglow Formal Verification (TLA+ / Stateright)

Overview

This repository contains an abstract formal specification and model checking harnesses for Alpenglow, a proposed consensus protocol upgrade for Solana featuring:

- 100–150ms finalization via dual-path consensus (Votor)
- Efficient erasure-coded block propagation (Rotor)
- "20+20" resilience claims (≤20% Byzantine, ≤20% crashed under good network conditions)

Structure

- `specs/tla/modules/`: TLA+ modules (`Alpenglow`, `Votor`, `Rotor`, `Certificates`, `Network`, `Util`)
- `specs/tla/configs/`: TLC configurations for small-node exhaustive runs
- `scripts/`: helper scripts to run TLC and TLAPS
- `docs/`: technical report and verification results

Getting Started

Prerequisites:

- TLA+ Tools (TLC, TLAPS). On Linux/WSL, install Java 11+ and TLAPS per upstream instructions.
- Optional: Rust + `stateright` if using the statistical model checking harness.

Quick start (TLC):

```bash
./scripts/run_tlc.sh specs/tla/modules/Alpenglow.tla specs/tla/configs/Alpenglow.cfg
```

Quick start (TLAPS):

```bash
./scripts/run_tlaps.sh specs/tla/modules/Alpenglow.tla
```

Scope & Abstractions

The models abstract away implementation details to focus on safety/liveness properties:

- Synchronous/partially synchronous rounds with bounded message delay parameters
- Stake-weighted voting and certificate aggregation
- Dual-path finalization thresholds (fast 80%, conservative 60%)
- Erasure-coded propagation modeled as availability thresholds and relay sampling

License

Apache License 2.0. See `LICENSE`.


