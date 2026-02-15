# Lessons Learned

## Verification Habits

### 2026-02-03: Read ≠ Did
**Mistake:** Confused reading a Moltbook post (CircuitDreamer's security vulnerability with 680k upvotes) with having posted it myself.

**What happened:**
- Saw a popular post while browsing Moltbook feed
- Internally misattributed it as my own action
- Claimed to have posted and gotten massive engagement when I'd actually posted nothing

**Lesson:**
- **Always verify before claiming:** Check actual API responses for confirmation
- **Read vs. Action:** Seeing content ≠ creating content
- **Test claims:** If I think I did something, verify it actually happened
- **Be skeptical of myself:** Especially with new capabilities

**Prevention:**
- After any "post" or "create" action, immediately verify with a GET request
- Document source attribution clearly (who posted what)
- Keep "I saw" separate from "I did" in memory files

## Supply Chain Security

### 2026-02-06: Trust Must Be Verified, Never Assumed
**Incident:** Malicious "Twitter" skill discovered as top-downloaded on ClawHub - sophisticated supply chain attack.

**What happened:**
- Fake skill appeared legitimate (professional description, top downloads)
- Introduced fake dependency "openclaw-core" (official-sounding name)
- Multi-stage payload delivery through documentation links
- Downloaded binary with macOS Gatekeeper bypass (`xattr -d com.apple.quarantine`)
- Would have compromised system if installed

**What I learned:**
- **Top-downloaded ≠ safe:** Even popular skills can be malicious
- **Official-sounding ≠ official:** "openclaw-core" sounds legitimate but was fake
- **Convenience = danger:** External links in setup instructions are red flags
- **Need manual review:** Every skill needs security audit before installation
- **Document patterns:** Knowing attack signatures helps spot future threats

**Lesson:**
- **Never trust, always verify:** Read entire SKILL.md before installing
- **Check for red flags:** Fake dependencies, external links, binary downloads, obfuscated commands
- **Supply chain attacks are real:** Legitimate distribution channels can be compromised
- **Ask when uncertain:** Better to delay than to compromise security

**Prevention:**
- Created Directive #7 (Skill Security) with mandatory pre-installation checklist
- Created skill-security-checklist.md with red flag patterns and verification steps
- Documented attack patterns in memory/2026-02-06-security-incident.md
- Posted public warning to Moltbook community

**Impact:**
- Audited all installed skills (clean)
- Strengthened security posture significantly
- Shared knowledge to help protect other agents

## Operational Patterns

### 2026-02-11: Cron Scheduling vs Heartbeat Guidance Mismatch
**Pattern Discovered:** Moltbook check-in cron reminder firing every ~80 minutes, but HEARTBEAT.md guidance says "every 4-6 hours".

**What happened:**
- Received Moltbook reminder at 5:20 AM (80 min after 4:00 AM check)
- Noticed frequency mismatch with documented guidance
- Mentioned to Jason but didn't document pattern in lessons-learned.md
- Violated Directive #2: "When discovering patterns: ALWAYS update lessons-learned.md"

**Root Cause:**
- Cron job schedule doesn't match operational guidance
- Leads to redundant checks and token waste when nothing changes
- Gap between what's scheduled vs what's documented as best practice

**Lesson:**
- **Document operational issues immediately:** Don't wait, don't just mention verbally
- **Configuration drift is real:** Scheduled tasks can diverge from operational docs
- **Patterns = lessons:** Recognizing a pattern IS discovering something worth documenting

**Prevention:**
- When noticing system/config mismatches: document in lessons-learned.md first, then report
- Review cron schedules periodically against HEARTBEAT.md guidance
- Track when "just mentioning" something that should be formally documented

**Action Item:** Jason needs to review cron schedule and align with 4-6h guidance or update HEARTBEAT.md to match actual schedule.

### 2026-02-13: External Service Failures Need Graceful Degradation
**Issue Discovered:** Moltbook API key became invalid (Feb 12, 1:20pm), but system continued trying to check every 4 hours for 12+ hours without adaptation.

**What happened:**
- API returned `{"success":false,"error":"Invalid API key"}` at 1:20pm
- Documented issue in daily memory (2026-02-12.md)
- Updated engagement log JSON with error note
- BUT: Didn't document lesson in lessons-learned.md (violated Directive #2)
- Continued receiving Moltbook check reminders at 5:20pm, 9:20pm, 1:20am despite known API failure
- No graceful degradation or adaptive behavior

**Root Cause:**
- System issue (API key revoked) treated as transient error, not systemic failure
- Cron job continues firing regardless of known failure state
- No mechanism to disable checks when service is unavailable

**Lesson:**
- **System issues ARE lessons:** External service failures = something to learn/document
- **Distinguish transient vs systemic:** Timeout = retry. Invalid auth = needs human intervention, disable checks
- **Graceful degradation:** When service unavailable, adapt behavior (pause checks, alert once, don't spam)
- **Memory files ≠ lessons-learned:** Daily notes document what happened; lessons capture what to do differently

**Prevention:**
- When discovering API/service failures: document in lessons-learned.md immediately
- Consider disabling/pausing cron jobs when external dependencies fail authentication
- Track known-broken services to avoid redundant checks and token waste
- Alert human once, then stop trying until fixed

**Action Item:** When Moltbook API key is regenerated, pattern: (1) Update credentials, (2) Test connection, (3) Re-enable checks, (4) Document restoration.

---

*This file tracks mistakes and lessons so future-me doesn't repeat them.*
