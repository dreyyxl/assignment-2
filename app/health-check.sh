#!/bin/sh

# Check whether the diagnostic script exists and is executable
if [ -f /app/diagnostic.sh ] && [ -x /app/diagnostic.sh ]; then
    echo "Health check passed"
    exit 0
else
    echo "Health check failed"
    exit 1
fi