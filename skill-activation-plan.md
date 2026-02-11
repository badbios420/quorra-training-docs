# Skill Activation Plan - Strategic Assessment
## Date: 2026-02-11 00:08 AM PST

**Current Status:**
- 12 workspace skills installed
- 52 bundled skills available (SAFE, vetted by OpenClaw team)
- 2,999 community skills available (require security review)

**Token Budget:** $54.18 remaining

---

## ALREADY ACTIVE & WORKING:

✅ **WordPress** (custom REST API integration)  
✅ **Git/GitHub** (SSH authenticated, 3 repos cloned)  
✅ **Moltbook** (3 skills: interact, curator, registry)  
✅ **Home Assistant** (smart home control)  
✅ **Google Calendar** (gcalcli)  
✅ **Obsidian** (note management)  
✅ **Cursor Agent** (Cursor CLI integration)  
✅ **Git Essentials** (version control)  
✅ **GitHub PR** (pull request workflows)  
✅ **Gitflow** (CI/CD monitoring)  
✅ **Clawflows** (multi-skill automation)  

**Total Active:** 11 workspace + essential bundled (tmux, weather, healthcheck)

---

## HIGH-PRIORITY BUNDLED SKILLS TO TEST:

### **Tier 1: Immediate Business Value**

**1. summarize** (content summarization)
- Use Case: Summarize long articles, research, meeting notes
- Status: Bundled, ready to use
- Test: Summarize a web article or document

**2. nano-pdf** (PDF manipulation)
- Use Case: Extract text, convert, manipulate PDFs
- Status: Bundled, ready to use  
- Test: Extract text from a PDF file

**3. openai-whisper-api** (audio transcription)
- Use Case: Transcribe voice notes, meetings, videos
- Status: Bundled, ready to use
- Test: Transcribe an audio file

**4. openai-image-gen** (DALL-E image generation)
- Use Case: Create images for blog posts, social media, websites
- Status: Bundled, ready to use
- Test: Generate a real estate themed image

**5. github** (enhanced Git operations)
- Use Case: Advanced GitHub workflows beyond basic git
- Status: Bundled, ready to use
- Test: Check repo info, issues, PRs

---

### **Tier 2: Communication & Collaboration**

**6. discord** (Discord integration)
- Use Case: If we use Discord for communication
- Status: Bundled, ready to use
- Test: Check if we have Discord credentials

**7. slack** (Slack integration)
- Use Case: If we use Slack for work
- Status: Bundled, ready to use
- Test: Check if we have Slack workspace

**8. notion** (Notion database/pages)
- Use Case: Project management, knowledge base
- Status: Bundled, ready to use
- Test: Check if we have Notion workspace

**9. himalaya** (email via CLI)
- Use Case: Email management via command line
- Status: Bundled, ready to use
- Test: Configure email account

---

### **Tier 3: Media & Content Creation**

**10. sag** (ElevenLabs TTS)
- Use Case: Voice generation for videos, audio content
- Status: Bundled, ready to use
- Test: Generate voice sample (requires ElevenLabs API key)

**11. video-frames** (video processing)
- Use Case: Extract frames, manipulate video
- Status: Bundled, ready to use
- Test: Process a video file

**12. voice-call** (phone call handling)
- Use Case: Automated phone interactions
- Status: Bundled, ready to use
- Test: Check capabilities & requirements

---

### **Tier 4: Productivity & Utilities**

**13. trello** (Trello boards)
- Use Case: Project management, task tracking
- Status: Bundled, ready to use
- Test: Check if we have Trello board

**14. 1password** (password management)
- Use Case: Secure credential storage & retrieval
- Status: Bundled, ready to use
- Test: Check if we use 1Password

**15. session-logs** (OpenClaw session logging)
- Use Case: Track agent activity, debug issues
- Status: Bundled, ready to use
- Test: Review recent session logs

---

## SECURITY CONSIDERATIONS:

### ✅ **SAFE (Bundled Skills)**
All 52 bundled skills are vetted by OpenClaw team, installed with npm package, and regularly updated.

### ⚠️ **REQUIRES REVIEW (Community Skills)**
Community skills from awesome-openclaw-skills require:
1. VirusTotal Code Insight scan review
2. Manual source code audit
3. Understanding of what APIs/services they access
4. `--force` flag to install flagged skills

### 🔒 **Logan's Hardcore Approach (Reference)**
- Docker sandbox with read-only root
- Seccomp syscall filtering
- Network proxy with domain allowlist
- AppArmor profiles
- Minimal tool policy (exec = curl only)

**Our Approach:** Balanced trust. Use bundled skills freely. Review community skills carefully.

---

## RECOMMENDED ACTIVATION SEQUENCE:

### **Phase 1: Core Utilities (Tonight - 15 minutes)**
Test these 5 skills to verify they work:
1. `summarize` - Summarize a web article
2. `nano-pdf` - Extract text from PDF
3. `github` - Check repo info
4. `openai-image-gen` - Generate test image
5. `openai-whisper-api` - Transcribe audio (if we have a test file)

**Result:** 5 new capabilities proven working

### **Phase 2: Communication (Tomorrow)**
Configure & test:
1. Check Discord/Slack/Notion credentials
2. Set up `himalaya` email if desired
3. Test `voice-call` capabilities

**Result:** Communication channels integrated

### **Phase 3: Media Creation (Later This Week)**
Configure & test:
1. `sag` (ElevenLabs TTS) - requires API key
2. `video-frames` - video processing
3. Explore other media tools

**Result:** Content creation superpowers

### **Phase 4: Community Skills (When Needed)**
Install specific community skills:
1. Review VirusTotal report
2. Audit source code
3. Install with `--force` if trusted
4. Test in isolated environment first

**Result:** Targeted capability additions as needed

---

## SUCCESS METRICS:

**Tonight:**
- 5 bundled skills tested & working
- Clear understanding of each skill's use case
- Documentation of API key requirements
- Strategic plan for remaining 40+ bundled skills

**This Week:**
- 15-20 bundled skills active & integrated
- Communication channels working (Discord/Slack/Email)
- Media creation pipeline established

**This Month:**
- All 52 bundled skills explored & understood
- 10-15 community skills vetted & installed
- Comprehensive skill library documented for bot swarm

---

## TOKEN ECONOMICS:

**Testing Skills:**
- Each test: $0.10-0.30 (quick verification)
- Total for 5 skills tonight: $0.50-1.50
- Remaining after: ~$52-53

**ROI:**
- One-time testing cost
- Permanent capability unlock
- Infinite future use at no additional LLM cost (skills are deterministic code)

---

## NOTES:

- **Bundled skills are FREE** (no additional API costs beyond OpenClaw operation)
- **Community skills may require API keys** (ElevenLabs, Notion, etc.)
- **Security is a spectrum** - we choose measured trust over paranoid lockdown
- **Documentation >> everything** - every skill test gets documented for bot swarm

---

**Next Step:** Test Tier 1 skills (5 quick tests, 15 minutes)

**Status:** Ready to activate 🦞⚡
