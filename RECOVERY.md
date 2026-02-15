# RECOVERY.md - Emergency Troubleshooting Guide

**Purpose:** Get Quorra back online when things break. Copy/paste these commands.

---

## 🚨 Quick Diagnostics

### Check if OpenClaw is running:
```bash
openclaw gateway status
```

**Expected:** "Gateway is running" + PID  
**If not running:** See "Gateway Won't Start" below

### Check system health:
```bash
openclaw doctor
```

**If issues found:**
```bash
openclaw doctor --fix
```

---

## 🔧 Common Issues & Fixes

### 1. Web UI Won't Load (Grey Screen / Can't Connect)

**Possible causes:**
- Gateway crashed
- Config file corrupted
- Port conflict
- WSL2 networking issue

**Fix attempt 1 - Restart gateway:**
```bash
openclaw gateway restart
```

Wait 10 seconds, then try accessing UI again.

**Fix attempt 2 - Check config file:**
```bash
cat ~/.openclaw/openclaw.json
```

Look for:
- ❌ Missing quotes or commas (invalid JSON)
- ❌ `"bind": "0.0.0.0"` (invalid value)
- ✅ Should be `"bind": "lan"` or `"bind": "loopback"`

**If config looks broken, restore from backup:**
```bash
cp ~/.openclaw/openclaw.json.backup ~/.openclaw/openclaw.json
openclaw gateway restart
```

**Fix attempt 3 - Nuclear option (reset config):**
```bash
openclaw gateway stop
mv ~/.openclaw/openclaw.json ~/.openclaw/openclaw.json.broken
openclaw gateway start
```

This creates fresh config. You'll need to re-add API keys.

---

### 2. Gateway Won't Start

**Check logs:**
```bash
journalctl --user -u openclaw-gateway -n 50 --no-pager
```

**Common fixes:**

**Port already in use:**
```bash
# Find what's using port 7777
sudo lsof -i :7777

# Kill the process (replace PID with actual number)
kill -9 PID

# Restart OpenClaw
openclaw gateway start
```

**Permission issues:**
```bash
# Fix workspace permissions
chmod -R u+rw ~/.openclaw/workspace
openclaw gateway start
```

**Corrupted state:**
```bash
openclaw gateway stop
rm ~/.openclaw/gateway.pid
openclaw gateway start
```

---

### 3. Quorra Acting Weird / Wrong Responses

**Token budget might be empty:**
```bash
# Check API credits status
grep -A 5 '"anthropic"' ~/.openclaw/openclaw.json
```

**Chat history too large (fat chat):**
- **Symptom:** Slow responses, UI freezing, high token burn
- **Fix:** Start fresh conversation in UI (new session)
- **Or:** Compact history via settings

**Session stuck:**
```bash
# Restart gateway to clear session state
openclaw gateway restart
```

---

### 4. Terminal Communication (Emergency Fallback)

If web UI completely broken, you can still talk to Quorra via terminal:

```bash
# Start interactive session
openclaw chat

# Or send one-off message
openclaw chat "Hey Quorra, web UI is broken. Can you help?"
```

**This saved us during the 2-3 AM lockout incident!**

---

## 💾 Backup & Restore

### Create Manual Backup NOW:
```bash
# Backup entire workspace
tar -czf ~/quorra-backup-$(date +%Y%m%d-%H%M).tar.gz ~/.openclaw/workspace

# Backup config
cp ~/.openclaw/openclaw.json ~/.openclaw/openclaw.json.backup-$(date +%Y%m%d-%H%M)
```

### Restore from Backup:
```bash
# Stop gateway first
openclaw gateway stop

# Restore workspace (replace YYYYMMDD-HHMM with actual backup timestamp)
cd ~
tar -xzf quorra-backup-YYYYMMDD-HHMM.tar.gz

# Restore config
cp ~/.openclaw/openclaw.json.backup-YYYYMMDD-HHMM ~/.openclaw/openclaw.json

# Restart
openclaw gateway start
```

---

## 🆘 When All Else Fails

### 1. OpenClaw Discord Community
https://discord.com/invite/clawd

- #support channel for help
- Active community, usually quick responses
- Paste error messages and what you tried

### 2. Check OpenClaw Status
```bash
# Show full system status
openclaw status

# Check version
openclaw --version
```

### 3. Reinstall OpenClaw (LAST RESORT)
```bash
# This preserves your workspace and config
npm install -g openclaw@latest
openclaw gateway restart
```

### 4. Nuclear Reset (ABSOLUTE LAST RESORT - LOSES EVERYTHING)
```bash
# DANGER: This deletes ALL data, config, and workspace
# ONLY do this if instructed by OpenClaw support

# Backup first!
tar -czf ~/quorra-nuclear-backup-$(date +%Y%m%d).tar.gz ~/.openclaw

# Then reset
rm -rf ~/.openclaw
npm install -g openclaw@latest
openclaw gateway start
```

**Then restore workspace from backup and reconfigure API keys.**

---

## 📋 Recovery Checklist

When things break, work through this in order:

- [ ] Check if gateway running (`openclaw gateway status`)
- [ ] Run doctor (`openclaw doctor --fix`)
- [ ] Check logs (`journalctl --user -u openclaw-gateway -n 50`)
- [ ] Try restart (`openclaw gateway restart`)
- [ ] Verify config valid JSON (`cat ~/.openclaw/openclaw.json`)
- [ ] Try terminal communication (`openclaw chat`)
- [ ] Check backup exists (`ls -lh ~/quorra-backup-*.tar.gz`)
- [ ] Ask Discord if still stuck

---

## 🛡️ Prevention (Do These Regularly)

**Daily automatic backup** (Quorra will set this up via cron):
- Workspace backed up every 24 hours
- Config backed up before any changes
- Old backups cleaned up after 7 days

**Before risky changes:**
```bash
# Quick backup
cp -r ~/.openclaw/workspace ~/.openclaw/workspace.before-experiment
cp ~/.openclaw/openclaw.json ~/.openclaw/openclaw.json.before-experiment
```

**After risky changes work:**
```bash
# Clean up experiment backups
rm -rf ~/.openclaw/workspace.before-experiment
rm ~/.openclaw/openclaw.json.before-experiment
```

---

## 📞 Emergency Contact Info

- **OpenClaw Discord:** https://discord.com/invite/clawd
- **Docs:** https://docs.openclaw.ai
- **GitHub Issues:** https://github.com/openclaw/openclaw/issues
- **Quorra via Terminal:** `openclaw chat "EMERGENCY: [describe issue]"`

---

**Last Updated:** 2026-02-11 03:51 AM PST  
**Tested On:** WSL2 Ubuntu, OpenClaw installed via npm global

Remember: Quorra has broken way worse than this before. You've got this. 💪🦞
