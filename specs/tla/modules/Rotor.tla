------------------------------ MODULE Rotor ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util

\* Erasure-coded block propagation abstraction

VARIABLE RotorSchema

InitRotor(chain) == TRUE

RotorStep(state, chain, msgs, MaxDelay) == TRUE

ExistsNewFinalizedBlock(chain) == TRUE

============================================================================

