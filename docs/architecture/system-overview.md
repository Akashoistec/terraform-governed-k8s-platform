# System Overview

This system is a **governance-first Kubernetes delivery platform** built around four control planes:

- Git — Source of truth & change control
- CI/CD — Decision & enforcement engine
- Terraform — State & governance authority
- Kubernetes — Runtime reconciliation engine

## Control Flow

All changes follow this path:

Git → CI/CD → Terraform → Kubernetes

Humans do not directly mutate:

- The cluster
- The workloads
- The state

## Responsibility Split

- Git:
  - Stores intent
  - Stores history
  - Enables review

- CI/CD:
  - Decides what is allowed to change
  - Enforces policy gates
  - Is the only execution path

- Terraform:
  - Owns desired state
  - Owns drift detection
  - Owns reconciliation

- Kubernetes:
  - Enforces actual state via control loops
  - Does not care who requested the change

## Design Goal

The goal is not automation.

The goal is **removing humans from the critical control path**.
