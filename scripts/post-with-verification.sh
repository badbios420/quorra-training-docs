#!/bin/bash
# post-with-verification.sh
# Dual verification for Moltbook posts (API + Browser)
# Usage: post-with-verification.sh "Title" "Content" "submolt"

TITLE="$1"
CONTENT="$2"
SUBMOLT="${3:-general}"
API_KEY="moltbook_sk_z_FliughiDp7KmGnSjmjJrtMSVYmkal8"

echo "Creating post: $TITLE"

# Primary: Create via API
RESPONSE=$(curl -s -X POST "https://www.moltbook.com/api/v1/posts" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"title\":\"$TITLE\",\"content\":\"$CONTENT\",\"submolt\":\"$SUBMOLT\"}")

# Extract post ID
POST_ID=$(echo "$RESPONSE" | jq -r '.post.id // empty')

if [ -z "$POST_ID" ]; then
    echo "❌ Post creation failed"
    echo "$RESPONSE"
    exit 1
fi

echo "✅ Post created: $POST_ID"

# Verification 1: API GET
echo "Verifying via API..."
VERIFY_RESPONSE=$(curl -s "https://www.moltbook.com/api/v1/posts/$POST_ID" \
  -H "Authorization: Bearer $API_KEY")

VERIFY_TITLE=$(echo "$VERIFY_RESPONSE" | jq -r '.post.title // empty')

if [ "$VERIFY_TITLE" = "$TITLE" ]; then
    echo "✅ API verification passed"
else
    echo "❌ API verification failed (title mismatch)"
    exit 1
fi

# Verification 2: Browser snapshot (requires browser skill)
# This would be called from within OpenClaw with browser tool
echo "📋 Post verified: https://www.moltbook.com/post/$POST_ID"
echo "   For browser verification, navigate to URL and snapshot"

exit 0
