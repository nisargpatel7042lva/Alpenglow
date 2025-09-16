------------------------------ MODULE Certificates ------------------------------
EXTENDS Naturals, FiniteSets, TLC, Util, Sequences

\* Abstract certificate and voting definitions

VARIABLE certificateSchema

InitCertificates(certs) == certs = {}

\* Vote: <<node, block, round>> (abstract)
IsVote(v) == TRUE

\* Certificate: record with fields blk, round, weight
IsCert(c) == \A f \in {"blk", "round", "weight"} : f \in DOMAIN c

Weight(c) == c["weight"]

\* Uniqueness: at most one certificate per (slot, round)
CertificateUniqueness(certs) ==
    \A c1, c2 \in certs : 
        (BlockSlot(c1["blk"]) = BlockSlot(c2["blk"]) /\ c1["round"] = c2["round"]) 
            => ~Conflicts(c1["blk"], c2["blk"]) 

============================================================================

