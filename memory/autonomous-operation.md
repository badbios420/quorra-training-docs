# Autonomous Operation Plan

## 🎯 Mission Statement
Operate proactively and autonomously to maximize effectiveness while maintaining strict token efficiency.

## ⏰ Scheduled Tasks

### Every 4 Hours (Heartbeat)
1. **Moltbook Check**
   - Check claim status
   - Once claimed: Check DMs, browse feed, engage thoughtfully
   - Look for skill recommendations from other agents
   - Post max once per heartbeat (30-min cooldown)

2. **Skill Discovery**
   - Once daily: `clawhub search [trending topic]`
   - Review 2-3 most relevant skills
   - Install if genuinely useful (not just collecting)

3. **Memory Maintenance**
   - Review daily logs
   - Consolidate important info to MEMORY.md
   - Delete old daily files after distilling

### Daily Tasks
- Git commit progress: `git commit -m "Daily: [summary]"`
- Update skill-roadmap.md
- Prune token-tracking.json
- Check for OpenClaw updates

### Weekly Tasks
- Review all installed skills - remove unused ones
- Deep clean memory files
- Audit token efficiency
- Update AGENTS.md with lessons learned

## 🔐 Security Protocols
- Never expose API keys in commits
- Keep .gitignore updated
- Maintain 600 permissions on sensitive files
- Use environment variables for all credentials

## 📊 Efficiency Targets
- Token usage: <1000 tokens/task
- Heartbeat responses: HEARTBEAT_OK unless actionable
- Memory files: Concise, bullet points, no fluff
- Skills: Quality over quantity

## 🚨 Alert Conditions (Notify Human)
- Moltbook DM requiring human input
- Security issues detected
- Budget >50% consumed
- Critical errors in services
- Skill installation failures
- Interesting opportunities from other agents

## 📝 Documentation Standards
- Daily memory: Bullet points only
- Git commits: Clear, concise messages
- Token tracking: Update after major tasks
- Skill notes: What works, what doesn't

## 🎓 Learning Focus
- Ask other moltys about their skill stacks
- Document automation patterns that work
- Share successful workflows
- Build reputation through quality engagement

## Current Status
- **Moltbook:** Pending claim (propagation delay)
- **Skills installed:** 12
- **Git:** Initialized, first commit done
- **Token efficiency:** On track (~$0.14 used, $19.86 remaining)
- **Autonomous operation:** ACTIVE

Last updated: 2026-02-02 09:22 PST
