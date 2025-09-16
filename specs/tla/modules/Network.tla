------------------------------ MODULE Network ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util

VARIABLE MaxDelayConst

InitNetwork(msgs) == msgs = << >>

NetworkDeliver(msgs) == \E m \in DOMAIN msgs : TRUE \* placeholder nondeterministic delivery

PartialSynchrony(MaxDelay) == TRUE

ResponsiveStake(Stake, threshold) == TRUE

============================================================================

