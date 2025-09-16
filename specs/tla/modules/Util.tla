EXTENDS Naturals, FiniteSets, TLC, Sequences

CONSTANT N

\* Common helper definitions/types

Nodes == 1..N

\* Abstract block model: two blocks conflict if same slot but different id
IsBlock(b) == \A f \in {"slot", "id"} : f \in DOMAIN b

Conflicts(b1, b2) == 
    IsBlock(b1) /\ IsBlock(b2) /\ b1["slot"] = b2["slot"] /\ b1["id"] # b2["id"]

BlockSlot(b) == b["slot"]

\* Chain helpers
Head(chainSeq) == IF Len(chainSeq) = 0 THEN Nil ELSE chainSeq[Len(chainSeq)]

TypeInvariant(state, chain, certs, msgs) == TRUE


Nil == CHOOSE x : x = x /\ x # x \* impossible, used as placeholder

============================================================================

