------------------------------ MODULE Certificates ------------------------------
EXTENDS Naturals, FiniteSets, TLC, Util

\* Abstract certificate and voting definitions

VARIABLE certificateSchema

InitCertificates(certs) == certs = {}

CertificateUniqueness(certs) == TRUE

============================================================================

