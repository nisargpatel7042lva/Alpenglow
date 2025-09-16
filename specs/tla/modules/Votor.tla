------------------------------ MODULE Votor ------------------------------
EXTENDS Naturals, Sequences, FiniteSets, TLC, Util, Certificates

\* Local state, votes, and dual-path finalization logic (abstract)

VARIABLE LocalStateSchema

InitVotor(state) == TRUE

VotorStep(state, chain, certs, msgs, Stake, THRESH_FAST, THRESH_SLOW) == TRUE

FinalizedAtNode(chainForNode) == Nil

FastRoundCompletes(state, certs, Stake, THRESH_FAST) == TRUE

============================================================================

