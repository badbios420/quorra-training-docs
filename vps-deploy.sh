#!/bin/bash
# VPS Deployment Script for Quorra Backup Instance
# Created: 2026-02-17 17:49 PST
# Server: 74.208.111.23 (IONOS VPS - United States)

set -e

VPS_HOST="74.208.111.23"
VPS_USER="root"

echo "🚀 Deploying Quorra to IONOS VPS..."
echo ""
echo "Server: $VPS_HOST"
echo "Location: United States"
echo "Specs: 8GB RAM, 4 vCores, 240GB NVMe SSD"
echo ""

# Test connection
echo "📡 Testing SSH connection..."
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=10 $VPS_USER@$VPS_HOST "echo '✅ Connected successfully!'"

echo ""
echo "🔧 Phase 1: System Setup & Security..."
ssh $VPS_USER@$VPS_HOST << 'ENDSSH'
# Update system
echo "Updating system packages..."
apt-get update -qq
apt-get upgrade -y -qq

# Install essential packages
echo "Installing essential packages..."
apt-get install -y -qq curl wget git build-essential ufw fail2ban

# Configure firewall
echo "Configuring firewall..."
ufw --force enable
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

echo "✅ System setup complete!"
ENDSSH

echo ""
echo "🔧 Phase 2: Node.js & OpenClaw..."
ssh $VPS_USER@$VPS_HOST << 'ENDSSH'
# Install NVM
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js 22
echo "Installing Node.js 22..."
nvm install 22
nvm use 22
nvm alias default 22

# Install OpenClaw
echo "Installing OpenClaw..."
npm install -g openclaw

echo "✅ OpenClaw installed!"
node --version
npm --version
openclaw --version
ENDSSH

echo ""
echo "🔧 Phase 3: Copying Quorra's Brain..."
echo "Syncing workspace files..."

# Create workspace directory on VPS
ssh $VPS_USER@$VPS_HOST "mkdir -p /root/.openclaw/workspace"

# Sync all critical files
rsync -avz --progress \
  --exclude 'node_modules' \
  --exclude '.git' \
  ~/.openclaw/workspace/ \
  $VPS_USER@$VPS_HOST:/root/.openclaw/workspace/

echo ""
echo "🔧 Phase 4: Copying Git Repository..."
ssh $VPS_USER@$VPS_HOST << 'ENDSSH'
cd /root/.openclaw/workspace
git init
git remote add origin git@github.com:badbios420/quorra-training-docs.git
echo "Git repository configured!"
ENDSSH

echo ""
echo "✅ Deployment Complete!"
echo ""
echo "🎉 Quorra is now backed up on VPS!"
echo ""
echo "Server Details:"
echo "  IP: $VPS_HOST"
echo "  Location: United States"
echo "  Specs: 8GB RAM, 4 vCores, 240GB NVMe"
echo ""
echo "Next Steps:"
echo "  1. Test OpenClaw startup on VPS"
echo "  2. Configure automated daily sync"
echo "  3. Test full restoration scenario"
echo ""
