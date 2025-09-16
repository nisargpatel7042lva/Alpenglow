Alpenglow Formal Verification Report (Draft)

Executive Summary

We present an abstract TLA+ model of Alpenglow's Votor and Rotor sub-protocols with stake-weighted certification and dual-path finalization (≥80% fast path, ≥60% two-round slow path). We include machine-checkable safety invariants and liveness assumptions suitable for TLC exploration in small configurations, with a roadmap for TLAPS proofs.

Results Snapshot

- Model compiles; TLC runs with N=4 baseline config.
- Safety invariants encoded: no conflicting finalization in same slot; certificate uniqueness.
- Liveness obligations formalized under partial synchrony and responsiveness assumptions.

Citations

- Anza blog: Alpenglow overview and claims [link](https://www.anza.xyz/blog/alpenglow-a-new-consensus-for-solana).
- Helius deep-dive [link](https://www.helius.dev/blog/alpenglow).
- Alpenglow slides (ETH Zurich) [link](https://disco.ethz.ch/members/wroger/AlpenglowPresentation.pdf).
- Whitepaper (Drive) [link](https://drive.google.com/file/d/1Rlr3PdHsBmPahOInP6-Pl0bMzdayltdV/view).
- Reference implementation [link](https://github.com/qkniep/alpenglow/tree/main).
- Stateright book [link](https://www.stateright.rs/title-page.html).
- Learn TLA+ [link](https://learntla.com/core/index.html).

Proof Obligations (Planned)

- Safety: Non-equivocation and single-slot finality uniqueness.
- Safety: Chain consistency with ≤20% Byzantine stake.
- Liveness: Progress under partial synchrony with >60% responsive stake.
- Liveness: Fast path within one round with >80% responsive stake.
- Resilience: Recovery after partition and ≤20% non-responsive stake.

Modeling Notes

- Blocks modeled by records with fields `slot`, `id`; conflicts if same `slot` and different `id`.
- Certificates are records with `blk`, `round`, `weight`; uniqueness over `(slot, round)`.
- Rotor nondeterministically extends chains abstractly to capture propagation and availability thresholds.
- Votor nondeterministically emits slow/fast path certificates meeting thresholds.

Next Steps

- Refine `VotorStep` to model 1- and 2-round interactions and timeout/skip logic.
- Add stake distribution and honest/byzantine partitions, with equivocation modeling.
- Encode fairness/partial synchrony window and network delivery constraints.
- Expand TLC configs for N ∈ {4,6,8,10} and run statistical scenarios.
- Begin TLAPS drafts for type and safety lemmas.


