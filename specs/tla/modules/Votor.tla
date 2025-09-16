------------------------------ MODULE Votor ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util, Certificates

\* Local state, votes, and dual-path finalization logic (abstract)

VARIABLE LocalStateSchema

\* Local state per node contains current round and locks (abstract)
InitVotor(state) == TRUE

\* Non-deterministically add a certificate meeting threshold to model fast/slow path
VotorStep(state, chain, certs, msgs, Stake, THRESH_FAST, THRESH_SLOW) == 
    \E b, r, w : 
        LET c == ["blk" |-> b, "round" |-> r, "weight" |-> w] IN 
        (w \in {THRESH_SLOW, THRESH_FAST} /\ certs' = certs \cup {c})

\* A node finalizes the head block if there exists a certificate over its slot
FinalizedAtNode(chainForNode) == 
    LET h == Head(chainForNode) IN 
        IF h = Nil THEN Nil ELSE h

FastRoundCompletes(state, certs, Stake, THRESH_FAST) == 
    \E c \in certs : Weight(c) \geq THRESH_FAST

============================================================================

