#!/bin/bash

# Load environment variables from .env.local
# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Load .env.local if it exists
if [ -f "$PROJECT_ROOT/.env.local" ]; then
  # Source the .env.local file, handling comments and empty lines
  # Use a more robust method that handles all edge cases
  while IFS= read -r line || [ -n "$line" ]; do
    # Skip comments and empty lines
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    [[ -z "${line// }" ]] && continue
    # Export the variable
    export "$line"
  done < "$PROJECT_ROOT/.env.local"
fi

# Check for API key - support both NOTION_API_KEY and NOTION_TOKEN
if [ -z "$NOTION_API_KEY" ] && [ -z "$NOTION_TOKEN" ]; then
  echo "Error: NOTION_API_KEY or NOTION_TOKEN not found in .env.local" >&2
  echo "Please ensure NOTION_API_KEY is set in $PROJECT_ROOT/.env.local" >&2
  exit 1
fi

# Set NOTION_TOKEN (recommended by the Notion MCP server)
# Use NOTION_API_KEY if NOTION_TOKEN is not set (for backward compatibility)
if [ -z "$NOTION_TOKEN" ] && [ -n "$NOTION_API_KEY" ]; then
  export NOTION_TOKEN="$NOTION_API_KEY"
fi

# Also set OPENAPI_MCP_HEADERS as fallback (alternative method)
# This ensures compatibility with different server versions
if [ -n "$NOTION_TOKEN" ]; then
  export OPENAPI_MCP_HEADERS="{\"Authorization\": \"Bearer $NOTION_TOKEN\", \"Notion-Version\": \"2022-06-28\"}"
fi

# Execute the Notion MCP server
# Try global installation first (avoids npm dependency resolution issues)
# Fallback to npx if global installation not available
if command -v notion-mcp-server &> /dev/null; then
  # Use globally installed version (recommended - avoids "Invalid Version" errors)
  exec notion-mcp-server
else
  # Fallback to npx (may have dependency resolution issues)
  # If you see "npm error Invalid Version", install globally: npm install -g @notionhq/notion-mcp-server
  exec npx --yes @notionhq/notion-mcp-server
fi

