# Threat Model

This platform is designed to defend primarily against:

## 1. Human Risk

- Accidental misconfiguration
- Bypassing review
- Emergency changes
- Drift introduction

## 2. Privilege Abuse

- Overpowered ServiceAccounts
- Cluster-admin usage
- Shared credentials

## 3. Supply Chain & Change Injection

- Malicious or accidental code changes
- Unreviewed infra changes
- State tampering

## 4. Blast Radius

- Compromise of one workload should not:
  - Affect the cluster
  - Affect other namespaces
  - Escalate to node

## Non-Goals (For This Project)

- Defending against:
  - Cloud provider compromise
  - Kubernetes zero-days
  - Physical host compromise

Those are **out of scope by design**.
