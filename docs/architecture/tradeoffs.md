# Trade-offs and Limitations

This project makes **intentional simplifications**:

## 1. kind + kindnet

- NetworkPolicy is intent-only
- No real enforcement
- Acceptable because this is an architecture demo

## 2. No Cloud IAM

- All identities are local
- No workload identity
- Simplifies trust model for learning

## 3. No Policy Engine

- No OPA / Kyverno
- Policy is enforced in CI/CD only

## 4. Single Cluster, Single Node

- No real multi-tenancy
- No node isolation

## 5. Local Terraform State

- No remote backend
- No state locking server

## Why This Is Acceptable

The goal is to demonstrate:

- Control flow
- Governance model
- Architectural thinking

Not production completeness.
