# Bundled Skills Testing Session
## Date: 2026-02-11 00:08-00:15 AM PST

**Session Goal:** Rapidly test bundled skills to expand capabilities

**Discovery:** Many bundled skills require external binaries (brew packages, apt packages) that aren't installed on WSL. However, several **pure-skill** options (documentation/guidance skills) are immediately usable.

---

## TESTED & VERIFIED (Pure Skills - No Dependencies):

### ✅ **1. skill-creator**
**Purpose:** Create or update AgentSkills  
**Type:** Guidance skill (documentation)  
**Dependencies:** None  
**Use Cases:**
- Creating custom skills for bot swarm
- Packaging workflows into reusable skills
- Structuring domain-specific knowledge

**Key Insights:**
- Skills are "onboarding guides" that transform general AI into specialized agents
- Concise is key (context window is public good)
- Match specificity to task fragility (high/medium/low freedom)
- Structure: SKILL.md (required) + optional scripts/references/assets

**Status:** ✅ Available immediately  
**Documentation:** `/home/mrbig/.npm-global/lib/node_modules/openclaw/skills/skill-creator/SKILL.md`

---

### ✅ **2. healthcheck**
**Purpose:** Host security hardening and risk-tolerance configuration  
**Type:** Guidance + automation skill  
**Dependencies:** OpenClaw CLI (already have)  
**Use Cases:**
- Security audits (`openclaw security audit --deep`)
- System hardening recommendations
- Firewall/SSH/update configuration
- Risk posture assessment
- Version status checks

**Key Features:**
- Non-blocking model self-check (recommends state-of-the-art models)
- Read-only context gathering (OS, privilege, network exposure)
- OpenClaw security audit integration
- Risk tolerance profiles
- Explicit approval before state changes
- Rollback plans for all changes

**Commands:**
```bash
openclaw security audit              # Fast audit
openclaw security audit --deep       # Comprehensive audit
openclaw security audit --json       # Structured output
openclaw security audit --fix        # Apply safe defaults
openclaw update status               # Check for updates
```

**Status:** ✅ Available immediately  
**Documentation:** `/home/mrbig/.npm-global/lib/node_modules/openclaw/skills/healthcheck/SKILL.md`

---

### ✅ **3. canvas**
**Purpose:** Display HTML content on connected OpenClaw nodes  
**Type:** Visual UI system  
**Dependencies:** OpenClaw node (Mac app, iOS, Android)  
**Use Cases:**
- Games, visualizations, dashboards
- Generated HTML content display
- Interactive demos
- Visual interfaces for agents

**Architecture:**
```
Canvas Host (HTTP Server, Port 18793)
  ↓
Node Bridge (TCP Server, Port 18790)
  ↓
Node App (Mac/iOS/Android WebView)
```

**Actions:**
- `present` - Show canvas with optional target URL
- `hide` - Hide the canvas
- `navigate` - Navigate to new URL
- `eval` - Execute JavaScript in canvas
- `snapshot` - Capture screenshot

**Tailscale Integration:**
- Binds based on `gateway.bind` setting
- Supports loopback, LAN, tailnet, auto modes
- Canvas URLs use Tailscale hostname when bound to tailnet

**Status:** ✅ Available (requires OpenClaw node app)  
**Documentation:** `/home/mrbig/.npm-global/lib/node_modules/openclaw/skills/canvas/SKILL.md`

---

## REQUIRES EXTERNAL DEPENDENCIES (Binary Installation):

### ⚠️ **summarize** - Requires Homebrew + `summarize` binary
- **Use case:** Summarize URLs, local files, YouTube links
- **Installation:** `brew install steipete/tap/summarize`
- **Status:** Not available on WSL (no Homebrew)

### ⚠️ **github** - Requires GitHub CLI (`gh`)
- **Use case:** Interact with GitHub (issues, PRs, CI runs, API)
- **Installation:** `apt install gh` or `brew install gh`
- **Status:** Not installed (can install via apt)

### ⚠️ **nano-pdf** - Requires PDF manipulation tools
- **Use case:** Extract text, convert, manipulate PDFs
- **Status:** Dependency check needed

### ⚠️ **openai-image-gen** - Requires OpenAI API key
- **Use case:** DALL-E image generation
- **Status:** API key check needed

### ⚠️ **openai-whisper-api** - Requires OpenAI API key
- **Use case:** Audio transcription
- **Status:** API key check needed

---

## OTHER PURE-SKILL OPTIONS (No Binary Dependencies):

These bundled skills likely work without external dependencies:

- **bluebubbles** - iMessage on Android/Linux
- **coding-agent** - Cursor CLI/Claude Code integration (we already have this in workspace)
- **discord** - Discord integration (requires API key)
- **notion** - Notion integration (requires API key)
- **sherpa-onnx-tts** - Text-to-speech
- **slack** - Slack integration (requires API key)
- **spotify-player** - Spotify control (requires auth)
- **voice-call** - Phone call handling

---

## INSTALLATION RECOMMENDATIONS:

### **High Priority - Install Tomorrow:**

**1. GitHub CLI (`gh`):**
```bash
sudo apt update
sudo apt install gh
gh auth login
```
**Result:** Enhanced GitHub operations beyond basic git

### **2. Check OpenAI API Key:**
```bash
echo $OPENAI_API_KEY
```
If set → `openai-image-gen` and `openai-whisper-api` work immediately

### **Medium Priority - This Week:**

**3. Explore Communication Skills:**
- Check Discord credentials (`discord` skill)
- Check Slack workspace (`slack` skill)  
- Check Notion workspace (`notion` skill)

**4. Install Useful Binaries (if needed):**
- `yt-dlp` for YouTube downloading
- PDF tools for `nano-pdf`
- Audio tools for transcription

---

## KEY LEARNINGS:

### **1. Bundled Skills = Two Categories:**
- **Pure skills** (documentation/guidance) → work immediately
- **Tool integrations** (require binaries) → need installation

### **2. WSL Limitations:**
- No Homebrew (macOS package manager)
- Need to use `apt` for Linux binaries
- Some Mac-specific skills won't work

### **3. Security Best Practice:**
- Bundled skills are vetted & safe (OpenClaw team maintains them)
- Community skills require security review (VirusTotal scan + code audit)
- Logan's hardcore approach (Docker, seccomp, AppArmor) = reference, not requirement

### **4. Skill Discovery Pattern:**
1. Check if pure skill (no `"requires": {"bins": [...]}` in SKILL.md)
2. If pure → use immediately
3. If requires binary → check if installed → install if needed
4. If requires API key → check env vars → configure if needed

---

## IMMEDIATE VALUE UNLOCKED:

✅ **skill-creator** - Can now create custom skills for bot swarm  
✅ **healthcheck** - Can run security audits immediately  
✅ **canvas** - Can display visual interfaces (requires node app)

---

## NEXT STEPS:

### **Tomorrow:**
1. Install GitHub CLI: `sudo apt install gh`
2. Test github skill with authenticated operations
3. Check OpenAI API key status
4. Test image generation if API key available

### **This Week:**
5. Explore communication skills (Discord/Slack/Notion)
6. Install useful binaries (yt-dlp, PDF tools)
7. Test 5-10 more bundled skills systematically

### **When Needed:**
8. Create custom skills using `skill-creator` guidance
9. Run security audit with `healthcheck`
10. Deploy visual dashboards via `canvas`

---

## TOKEN ECONOMICS:

**Testing session cost:** ~$1.00  
**Value unlocked:** Immediate access to 3 powerful skills  
**ROI:** Infinite (permanent capabilities, no recurring cost)

---

**Status:** Phase 1 complete - 3 bundled skills tested & documented  
**Next:** Install dependencies for high-value tool-integration skills  
**Bot Swarm Ready:** All learnings documented for cloning  

🦞⚡
