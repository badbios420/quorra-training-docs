# Security Changes Log

## 2026-02-02: API Key Migration to Environment Variables

### 🎯 Objective
Move API keys from config files to environment variables for better security.

### 📋 Changes Made

#### 1. Backups Created
- ✅ `~/.openclaw/openclaw.json.backup`
- ✅ `~/.openclaw/agents/main/agent/auth-profiles.json.backup`
- ✅ `~/.config/moltbook/credentials.json.backup`

#### 2. Environment Variables Added
Created `~/.openclaw/.env` with:
```bash
ANTHROPIC_API_KEY=sk-ant-api03-...
MOLTBOOK_API_KEY=moltbook_sk_...
```
- File permissions: 600 (owner read/write only)
- Location: `~/.openclaw/.env` (preferred over `.bashrc` for OpenClaw)

Also added to `~/.bashrc` as backup:
```bash
export ANTHROPIC_API_KEY="..."
export MOLTBOOK_API_KEY="..."
```

#### 3. Config Files Updated

**auth-profiles.json:**
```json
{
  "profiles": {
    "anthropic:default": {
      "type": "api_key",
      "provider": "anthropic",
      "key": "${ANTHROPIC_API_KEY}"  // Was: hardcoded key
    }
  }
}
```

**moltbook credentials.json:**
```json
{
  "api_key": "${MOLTBOOK_API_KEY}",  // Was: hardcoded key
  "agent_name": "Quorra"
}
```

### 🔍 How It Works

OpenClaw loads environment variables in this order:
1. Process environment (inherited from parent)
2. `.env` in current working directory
3. **`~/.openclaw/.env`** ← Our implementation
4. Config `env` block in `openclaw.json`
5. Optional shell env import (if enabled)

Config files can reference env vars using `${VAR_NAME}` syntax.

### ✅ Testing Status

- [x] Backups created
- [x] `.env` file created with proper permissions
- [x] Config files updated with env var references
- [x] OpenClaw status shows gateway running
- [ ] Gateway restart pending (to load new env vars)
- [ ] API functionality test pending

### 🔐 Security Benefits

1. **No hardcoded secrets** - Keys not stored in version-controlled files
2. **Restricted permissions** - `.env` file is 600 (owner-only access)
3. **Easy rotation** - Update keys in one place (`.env`)
4. **Separation of concerns** - Config structure separate from credentials
5. **Recovery available** - Backups saved in case of issues

### 📝 Recovery Instructions

If something breaks, restore from backups:
```bash
cp ~/.openclaw/openclaw.json.backup ~/.openclaw/openclaw.json
cp ~/.openclaw/agents/main/agent/auth-profiles.json.backup ~/.openclaw/agents/main/agent/auth-profiles.json
cp ~/.config/moltbook/credentials.json.backup ~/.config/moltbook/credentials.json
```

### 🚀 Next Steps

1. Restart OpenClaw gateway: `openclaw gateway restart`
2. Test Anthropic API: Verify this session continues working
3. Test Moltbook API: Check claim status
4. If all works, delete backup files (keep for 7 days)
5. Update AGENTS.md with security best practices

### 📊 Token Usage
- This security task: ~7,000 tokens (~$0.021)
- Total session: ~39,500 tokens (~$0.12)
- Budget remaining: $19.88

### 🔗 References
- OpenClaw Environment Docs: `/home/mrbig/.npm-global/lib/node_modules/openclaw/docs/environment.md`
- FAQ: Environment variables section
