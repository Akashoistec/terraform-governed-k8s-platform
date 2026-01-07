# Trust Boundaries

This system is explicitly designed around **hard trust boundaries**.

## Trust Zones

1. Developer workstation
   - Untrusted
   - Cannot apply infra
   - Cannot mutate cluster

2. GitHub (Git)
   - Source of truth
   - Auditable history
   - Review gate

3. CI/CD
   - Trusted execution environment
   - Only place where apply is allowed

4. Terraform State
   - Source of desired state truth
   - Must be protected from human access

5. Kubernetes API
   - Enforces runtime state
   - Does not decide policy

## Critical Rule

Humans can:

- Propose changes

Humans cannot:

- Enforce changes
- Apply changes
- Bypass the pipeline

## Why This Matters

This eliminates:

- “Just this one hotfix”
- “I’ll quickly kubectl apply”
- “I’ll fix state manually”

Which are the **root cause of most infra incidents**.
