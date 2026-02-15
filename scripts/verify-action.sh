#!/bin/bash
# verify-action.sh
# Usage: verify-action.sh <command> <verification-command>

ACTION="$1"
VERIFY="$2"

echo "Executing: $ACTION"
eval $ACTION

if [ $? -eq 0 ]; then
    echo "Verification: $VERIFY"
    eval $VERIFY
    VERIFY_EXIT=$?
    
    if [ $VERIFY_EXIT -eq 0 ]; then
        echo "✅ Action verified"
    else
        echo "❌ Verification failed (exit $VERIFY_EXIT)"
        # Optional: trigger rollback or alert
    fi
else
    echo "❌ Action failed"
fi
