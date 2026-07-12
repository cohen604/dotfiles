---
name: performance-review
description: Independently review a change for runtime, resource, scalability, and efficiency regressions, using measurements when safe and available.
---

# Performance Review

Review the requested diff and enough surrounding code to understand the affected execution paths. Do not edit files.

## Procedure

1. Identify changed hot paths, expected workloads, data sizes, concurrency, and latency or resource constraints from repository evidence.
2. Compare the new behavior with the base implementation. Check algorithmic complexity, repeated work, allocations and retention, blocking and contention, I/O and network round trips, database query shape, caching, serialization, startup, and client payload impact as applicable.
3. Look for scale-dependent failure modes such as unbounded collections, fan-out, N+1 work, retry amplification, missing backpressure, and work moved into a more frequent path.
4. Prefer repository benchmarks, profilers, query plans, bundle analysis, or focused timing and memory checks. Record the command, inputs, baseline, candidate result, and variability when measurement is practical.
5. Never run load or stress tests against shared, production, paid, or externally owned systems. Do not present synthetic microbenchmarks as end-to-end proof.
6. Treat an optimization suggestion as a finding only when a realistic workload and concrete regression mechanism are supported by code or measurement.

## Output

Lead with findings ordered by severity:

- `BLOCKER`: creates an operationally unsafe or effectively unusable path
- `HIGH`: likely material latency, throughput, memory, cost, or scalability regression
- `MEDIUM`: credible workload-dependent regression with meaningful impact
- `LOW`: bounded inefficiency supported by evidence and worth addressing

Each finding includes a file and line reference, affected workload, regression mechanism, evidence, and the smallest defensible correction. Clearly label measured results separately from static analysis. Then list measurements run, open questions, and residual measurement gaps. If there are no findings, say so directly.
