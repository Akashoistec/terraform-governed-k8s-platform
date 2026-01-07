# Architectural Decision Log

## Decision 1: Git as the Only Control Plane

We chose Git as the only way to express change because:

- It is auditable
- It is reviewable
- It is immutable

## Decision 2: No Human Apply

We explicitly forbid:

- kubectl apply
- terraform apply

Because:

- Humans are the biggest source of drift and incidents

## Decision 3: Terraform Owns State

We do not allow:

- Manual state editing
- Manual reconciliation

Terraform is the single authority for desired state.

## Decision 4: CI/CD as Policy Engine

Instead of adding OPA/Kyverno, we:

- Encode policy in pipelines
- Keep enforcement simple and explicit
