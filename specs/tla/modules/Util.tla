------------------------------ MODULE Util ------------------------------
EXTENDS Naturals, FiniteSets, TLC

\* Common helper definitions/types

Nodes == 1..N

TypeInvariant(state, chain, certs, msgs) == TRUE

Conflicts(b1, b2) == b1 # b2 /\ b1 # Nil /\ b2 # Nil

Nil == CHOOSE x : x = x /\ x # x \* impossible, used as placeholder

============================================================================

