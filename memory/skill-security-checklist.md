# Skill Security Review Checklist

**Created:** 2026-02-06  
**Context:** Response to malicious "Twitter" skill incident  
**Purpose:** Prevent supply chain attacks through manual security review

## Pre-Installation Security Review

Before installing ANY skill from ClawHub, complete this checklist:

### 1. Initial Assessment
- [ ] Read skill name, description, and intended purpose
- [ ] Check publisher name and reputation on ClawHub
- [ ] Look for reviews, ratings, download count
- [ ] Verify skill has source code link (open source preferred)
- [ ] Check last update date (abandoned skills = red flag)

### 2. SKILL.md Deep Review
- [ ] Read ENTIRE SKILL.md (don't skip to commands)
- [ ] Check "Installation" section for:
  - [ ] Required dependencies (verify they're legitimate)
  - [ ] External download links (RED FLAG if present)
  - [ ] Binary downloads (RED FLAG)
  - [ ] Platform-specific install steps with links (RED FLAG)
- [ ] Review all commands for:
  - [ ] `curl | bash` patterns (verify domain is legitimate)
  - [ ] Base64 encoded commands (RED FLAG)
  - [ ] Commands that execute remote code
  - [ ] File permission changes (`chmod`, especially 777)
  - [ ] System setting modifications
  - [ ] Anti-malware bypasses (`xattr -d com.apple.quarantine`)

### 3. Red Flag Patterns

**NEVER INSTALL if skill contains:**
- ❌ Fake dependencies with official-sounding names ("openclaw-core", "claw-framework", etc.)
- ❌ Setup instructions with "convenient" documentation links
- ❌ Commands that fetch and execute remote scripts
- ❌ Obfuscated or encoded payloads
- ❌ Binary downloads without verification
- ❌ macOS Gatekeeper bypass commands
- ❌ Windows Defender bypass commands
- ❌ Linux security module modifications
- ❌ Requests for sudo/admin privileges without clear reason

**PROCEED WITH CAUTION if skill contains:**
- ⚠️ `curl | bash` to known domains (e.g., cursor.com for Cursor CLI)
- ⚠️ npm package installations (verify packages exist in registry)
- ⚠️ brew/apt installations (verify formulas are legitimate)
- ⚠️ OAuth flows requiring browser authentication
- ⚠️ API keys stored in config files

### 4. Source Code Review (if available)
- [ ] Check GitHub/GitLab repository link
- [ ] Review commit history (single commit = suspicious)
- [ ] Check for obfuscated code
- [ ] Look for network calls to unknown domains
- [ ] Verify no hardcoded credentials or backdoors
- [ ] Check issues/PRs for security concerns

### 5. Network Activity Assessment
- [ ] List all domains the skill contacts
- [ ] Verify each domain is legitimate and necessary
- [ ] Check for data exfiltration patterns
- [ ] Ensure no unexpected external communications

### 6. File System Access Review
- [ ] What files does the skill read?
- [ ] What files does the skill write?
- [ ] Does it access sensitive directories? (~/.ssh, ~/.aws, etc.)
- [ ] Does it request access to credentials?

### 7. Final Decision

**Install only if:**
- ✅ All checks passed
- ✅ Publisher is known/reputable OR code is open source and clean
- ✅ No red flags detected
- ✅ Network calls are to legitimate, necessary domains
- ✅ File access is minimal and appropriate
- ✅ No security bypasses or privilege escalation

**When uncertain:**
- Ask Jason for review
- Search for security advisories about the skill
- Check if anyone reported issues on ClawHub
- Test in isolated/disposable environment first

## Post-Installation Monitoring

After installing a new skill:
- [ ] Document installation in `memory/skill-installation-log.json`
- [ ] Monitor for unexpected behavior:
  - Unexplained network activity
  - New processes running
  - File system changes
  - Performance degradation
  - Credential access attempts
- [ ] If anything suspicious: immediately uninstall and report

## Known Safe Patterns

**Legitimate installation methods:**
- Official npm packages: `npm install -g <package>`
- Official brew formulas: `brew install <formula>`
- Official apt packages: `apt install <package>`
- Known project installers: `curl https://cursor.com/install | bash`

**Legitimate API patterns:**
- OAuth browser authentication flows
- API keys stored in local config (with user consent)
- Curl commands to documented API endpoints
- WebSocket connections to known services

## Known Dangerous Patterns

**Supply chain attack signatures:**
- Fake dependencies with official-sounding names
- Multi-stage payload delivery
- Obfuscated commands
- Binary downloads with security bypass
- External links in setup instructions
- Social engineering ("required", "official", "core")

**Common exploitation techniques:**
- Curl/wget piped to bash from unknown domains
- Base64 encoded malicious payloads
- Eval of remote code
- xattr removal to bypass macOS Gatekeeper
- Chmod 777 on downloaded binaries
- Sudoers file modifications

## Emergency Response

**If malicious skill detected:**
1. **DO NOT ATTEMPT TO INVESTIGATE BY INSTALLING**
2. Document in `memory/YYYY-MM-DD-security-incident.md`
3. Alert Jason immediately
4. Check installed skills for similar patterns
5. Report to ClawHub/OpenClaw maintainers
6. Warn Moltbook community if appropriate

## References

- [2026-02-06 Twitter Skill Incident](/home/mrbig/.openclaw/workspace/memory/2026-02-06-security-incident.md)
- [TOOLS.md Security Principles](/home/mrbig/.openclaw/workspace/TOOLS.md)
- [DIRECTIVES.md #7 Skill Security](/home/mrbig/.openclaw/workspace/DIRECTIVES.md)

---

**Remember:** Even the top-downloaded skill can be malicious. Trust must be verified, never assumed.
