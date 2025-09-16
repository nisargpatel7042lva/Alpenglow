------------------------------ MODULE Rotor ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util

\* Erasure-coded block propagation abstraction

VARIABLE RotorSchema

\* Start with empty chain per node (abstract)
InitRotor(chain) == TRUE

\* Nondeterministically extend some node's chain by a new block with slot s
RotorStep(state, chain, msgs, MaxDelay) == 
    \E n \in Nodes, s \in Nat, id \in Nat :
        chain' = [chain EXCEPT ![n] = Append(@, ["slot" |-> s, "id" |-> id])]

ExistsNewFinalizedBlock(chain) == \E n \in Nodes : Head(chain[n]) # Nil

============================================================================

