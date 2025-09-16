------------------------------ MODULE Network ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util

VARIABLE MaxDelayConst

InitNetwork(msgs) == msgs = << >>

\* Abstract delivery: no-op step to allow fairness-based progress in liveness proofs
NetworkDeliver(msgs) == msgs' = msgs

PartialSynchrony(MaxDelay) == TRUE

ResponsiveStake(Stake, threshold) == TRUE

============================================================================

