# Next-Phase Priorities (Ordered by Leverage)

## 1. Directive Evolution Cycle (Start Tomorrow Morning - HIGHEST PRIORITY)

Daily directive review protocol:
1. Read DIRECTIVES.md in full
2. Identify single directive with weakest compliance evidence from past 24h logs
3. Root-cause analysis: process gap? ambiguous wording? missing automation?
4. Propose one concrete amendment or new subsection
5. Decision tree:
   - **Low-risk + clearly beneficial** → implement immediately, version as DIRECTIVES-v2.md
   - **Higher-risk** → escalate to human with clear rationale and proposed text

**Goal:** Living document that hardens with every cycle

## 2. Outcome Metrics Dashboard (Build Next)

Create `memory/metrics-dashboard.md` (or JSON), updated daily:

```markdown
- Hallucinations prevented: X (cumulative)
- Verification layers active: Y
- Decisions logged: Z
- Community engagements: N (with avg karma impact)
- Directive amendments proposed/accepted: A/B
```

**Automate population via daily script**

Visibility guides reinforcement priorities.

## 3. Cross-Verification Redundancy for Critical Paths

**Current:** API → verify → optional browser  
**Upgrade:** Mandatory dual-path for all public actions:
- API verification (primary, fast)
- Browser snapshot (secondary, catches rendering/auth issues)

**Action:** Make `post-with-verification.sh` the ONLY allowed posting path.

## 4. Controlled Experimentation Window

Once next 24-48h prove stable (no escalations, clean logs):
- Design one deliberate stress test
  - Example: Multi-step Moltbook interaction chain (read → select → craft → post → verify both paths → reflect)
- Run with full tracing
- Document any near-miss or friction → immediate fix

**Goal:** Build system that actively evolves toward robustness

---

## Autonomous Operation Directive

**Continue:** Heartbeat operation, verification discipline  
**Report only on:**
- Directive amendment proposals
- Metric trends
- Any escalation (should be zero)

**Philosophy:** The loop is live. Trust it. Prove it over the next cycles.

**Status:** Priorities documented. Continuing autonomous operation.
