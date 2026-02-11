# Quick Reference: Git & WordPress Commands

**Last Updated:** 2026-02-10  
**Status:** Production-ready ✅

---

## WordPress REST API (Big House Real Estate)

### Authentication
```bash
USER="quorra"
PASS="ZntFCxEB6u5VlZ3jV4FSP2x2"
SITE="https://bighouserealestate.com"
```

### Test Connection
```bash
curl --user "$USER:$PASS" "$SITE/wp-json/wp/v2/users/me"
```

### Get All Pages
```bash
curl --user "$USER:$PASS" "$SITE/wp-json/wp/v2/pages?per_page=100"
```

### Create New Page
```bash
curl --user "$USER:$PASS" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Page Title",
    "content": "<p>Page content here</p>",
    "slug": "page-slug",
    "status": "publish",
    "meta": {
      "_yoast_wpseo_metadesc": "Meta description (158-160 chars)",
      "_yoast_wpseo_focuskw": "focus keyword"
    }
  }' \
  "$SITE/wp-json/wp/v2/pages"
```

### Update Existing Page
```bash
PAGE_ID=1041979
curl --user "$USER:$PASS" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Updated Title",
    "content": "<p>Updated content</p>"
  }' \
  "$SITE/wp-json/wp/v2/pages/$PAGE_ID"
```

### Update Only Meta Description
```bash
PAGE_ID=1041979
curl --user "$USER:$PASS" \
  -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "meta": {
      "_yoast_wpseo_metadesc": "New meta description"
    }
  }' \
  "$SITE/wp-json/wp/v2/pages/$PAGE_ID"
```

---

## Git/GitHub Commands

### Test GitHub Connection
```bash
ssh -T git@github.com
# Expected: "Hi badbios420! You've successfully authenticated"
```

### Clone Repository (SSH)
```bash
git clone git@github.com:username/repo.git
```

### Clone Repository (HTTPS)
```bash
git clone https://github.com/username/repo.git
```

### Create New Local Repository
```bash
mkdir project-name
cd project-name
git init
echo "# Project Title" > README.md
git add .
git commit -m "Initial commit"
```

### Add Remote & Push
```bash
git remote add origin git@github.com:badbios420/repo-name.git
git push -u origin main
```

### Standard Workflow
```bash
# Make changes to files
git status                    # Check what changed
git add .                     # Stage all changes (or specify files)
git commit -m "Commit message"  # Commit with message
git push                      # Push to GitHub
```

### Pull Latest Changes
```bash
git pull
```

### Check Git Status
```bash
git status
git log --oneline            # View commit history
```

### View Remote Info
```bash
git remote -v
```

---

## Community Projects Locations

**OpenClaw Main Repo:**
```bash
cd ~/.openclaw/workspace/community-projects/openclaw/
ls skills/  # 40+ built-in skills
```

**Dances with Claws (Logan - Security):**
```bash
cd ~/.openclaw/workspace/community-projects/dancesWithClaws/
cat README.md | head -100
ls security/  # Security hardening files
```

**Awesome OpenClaw Skills (2,999 curated):**
```bash
cd ~/.openclaw/workspace/community-projects/awesome-openclaw-skills/
grep -A 5 "category-name" README.md  # Search by category
```

---

## Useful Patterns

### Create WordPress Page from Markdown File
```bash
# Convert markdown to HTML (manual or via tool)
# Create JSON payload
cat > /tmp/page.json << 'EOF'
{
  "title": "Page Title",
  "content": "<h2>Heading</h2><p>Content...</p>",
  "slug": "page-slug",
  "status": "publish"
}
EOF

# Publish
curl --user "quorra:ZntFCxEB6u5VlZ3jV4FSP2x2" \
  -X POST \
  -H "Content-Type: application/json" \
  -d @/tmp/page.json \
  https://bighouserealestate.com/wp-json/wp/v2/pages
```

### Clone & Explore New OpenClaw Skill
```bash
cd ~/.openclaw/workspace/community-projects
git clone https://github.com/username/skill-name.git
cd skill-name
cat SKILL.md  # Read the skill documentation
```

### Install Skill via ClawHub
```bash
npx clawhub@latest install skill-name
```

---

## Troubleshooting

### WordPress "Authentication failed"
- Verify username/password are correct
- Check application password wasn't revoked
- Test with: `curl --user "quorra:PASS" https://bighouserealestate.com/wp-json/wp/v2/users/me`

### Git "Permission denied (publickey)"
- Verify SSH key exists: `ls ~/.ssh/id_ed25519`
- Check key is added to GitHub: https://github.com/settings/keys
- Test connection: `ssh -T git@github.com`

### Git "Repository not found"
- Check repository URL is correct
- Verify you have access (public repo or collaborator)
- Try HTTPS instead of SSH: `git clone https://github.com/...`

---

**For detailed training documentation, see:** `git-wordpress-training-summary.md`
