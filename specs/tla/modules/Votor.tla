------------------------------ MODULE Votor ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util, Certificates

\* Local state, votes, and dual-path finalization logic (abstract)

VARIABLE LocalStateSchema

\* Local state per node contains current round and locks (abstract)
InitVotor(state) == TRUE

\* Helper: does a certificate already exist for this slot/round?
CertExistsForSlotRound(certs, slot, r) ==
    \E c \in certs : BlockSlot(c["blk"]) = slot /\ c["round"] = r

\* Non-deterministically add a certificate meeting threshold, preserving uniqueness
VotorStep(state, chain, certs, msgs, Stake, THRESH_FAST, THRESH_SLOW) == 
    \E b, r, w : 
        LET s == BlockSlot(b) IN
        LET c == ["blk" |-> b, "round" |-> r, "weight" |-> w] IN 
        /\ w \in {THRESH_SLOW, THRESH_FAST}
        /\ (\neg CertExistsForSlotRound(certs, s, r) 
            \/ (\A c0 \in certs : ~(BlockSlot(c0["blk"]) = s /\ c0["round"] = r /\ Conflicts(c0["blk"], b))))
        /\ certs' = certs \cup {c}

\* A node finalizes the latest block on its chain that has a certificate >= slow threshold
HasSlowCert(certs, blk, THRESH_SLOW) == \E c \in certs : c["blk"] = blk /\ Weight(c) \geq THRESH_SLOW

FinalizedAtNode(chainForNode) == 
    IF Len(chainForNode) = 0 THEN Nil ELSE CHOOSE b \in SeqToSet(chainForNode) : TRUE

FastRoundCompletes(state, certs, Stake, THRESH_FAST) == 
    \E c \in certs : Weight(c) \geq THRESH_FAST

============================================================================

