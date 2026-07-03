#!/bin/bash

# n8n MCP Server Wrapper
# Requires: n8n instance and API credentials

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Load .env.local if it exists
if [ -f "$PROJECT_ROOT/.env.local" ]; then
  set -a
  source <(grep -v '^#' "$PROJECT_ROOT/.env.local" | grep -v '^$' | sed 's/^/export /')
  set +a
fi

# Check if n8n API key is set
if [ -z "$N8N_API_KEY" ]; then
  echo "Error: N8N_API_KEY not found in .env.local" >&2
  echo "Please ensure N8N_API_KEY and N8N_BASE_URL are set in $PROJECT_ROOT/.env.local" >&2
  exit 1
fi

# Check if n8n base URL is set
if [ -z "$N8N_BASE_URL" ]; then
  echo "Error: N8N_BASE_URL not found in .env.local" >&2
  echo "Please set N8N_BASE_URL in $PROJECT_ROOT/.env.local" >&2
  exit 1
fi

# Export environment variables
export N8N_API_KEY
export N8N_BASE_URL

# Note: Update this path based on actual n8n MCP server implementation
# This is a template - the actual n8n MCP server command may vary
echo "n8n MCP Server - Update with actual server command" >&2
echo "N8N_API_KEY and N8N_BASE_URL are set" >&2
exit 1







