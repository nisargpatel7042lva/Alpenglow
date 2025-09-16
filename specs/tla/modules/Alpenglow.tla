------------------------------ MODULE Alpenglow ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util, Network, Certificates, Votor, Rotor

CONSTANTS 
    N \* number of nodes
,
    Stake \* function: Node -> Nat, total stake = STAKE_TOTAL
,
    STAKE_TOTAL
,
    THRESH_FAST \* 80% of stake
,
    THRESH_SLOW \* 60% of stake
,
    MaxDelay \* network delay bound for partially synchronous analysis

ASSUME THRESH_SLOW < THRESH_FAST /\ THRESH_FAST \leq STAKE_TOTAL

VARIABLES
    state \* mapping of Node -> LocalState
,
    chain \* mapping of Node -> sequence of Blocks
,
    certs \* set of Certificates
,
    msgs  \* Network message multiset

Init == 
    /\ InitNetwork(msgs)
    /\ InitCertificates(certs)
    /\ InitVotor(state)
    /\ InitRotor(chain)

Next ==
    \/ VotorStep(state, chain, certs, msgs, Stake, THRESH_FAST, THRESH_SLOW)
    \/ RotorStep(state, chain, msgs, MaxDelay)
    \/ NetworkDeliver(msgs)

\* Safety: no two conflicting blocks finalized in the same slot
Safety_NoConflictingFinalization ==
    \A n1, n2 \in Nodes :
        LET b1 == FinalizedAtNode(chain[n1]) IN
        LET b2 == FinalizedAtNode(chain[n2]) IN
        b1 = b2 \/ ~Conflicts(b1, b2)

\* Certificate uniqueness and non-equivocation
Safety_CertUniq == CertificateUniqueness(certs)

\* Liveness: progress under partial synchrony with >60% honest stake
Liveness_Progress == []<>(ExistsNewFinalizedBlock(chain))

\* Fast path completion within one round with >80% responsive stake
Liveness_FastPath == []<>(FastRoundCompletes(state, certs, Stake, THRESH_FAST))

\* Resilience assumptions encapsulated in Network module predicates

Spec == Init /\ [][Next]_<<state, chain, certs, msgs>>

THEOREM TypeOK == Spec => []TypeInvariant(state, chain, certs, msgs)

THEOREM Safety_NoDoubleFinalization == Spec => []Safety_NoConflictingFinalization

THEOREM Safety_CertUniqHolds == Spec => []Safety_CertUniq

\* Liveness theorems require fairness/partial synchrony assumptions
THEOREM Liveness_ProgressUnderAssumptions == Spec /\ PartialSynchrony(MaxDelay) => Liveness_Progress

THEOREM Liveness_FastPathUnder80 == Spec /\ ResponsiveStake(Stake, THRESH_FAST) => Liveness_FastPath

=============================================================================

