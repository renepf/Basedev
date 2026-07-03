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

# Check if Asana token is set
if [ -z "$ASANA_ACCESS_TOKEN" ]; then
  echo "Error: ASANA_ACCESS_TOKEN not found in .env.local" >&2
  echo "Please ensure ASANA_ACCESS_TOKEN is set in $PROJECT_ROOT/.env.local" >&2
  echo "Get your token from: https://app.asana.com/0/my-apps" >&2
  exit 1
fi

# Export the token so it's available to the MCP server
export ASANA_ACCESS_TOKEN

# If workspace ID is set, export it too
if [ -n "$ASANA_WORKSPACE_ID" ]; then
  export ASANA_WORKSPACE_ID
fi

# Run Asana MCP Server
# Note: Update this command when an official Asana MCP server is available
# Check: https://github.com/modelcontextprotocol/servers for official servers
# Example implementations:
# - npx -y @asana/mcp-server
# - python3 -m asana_mcp_server
# - docker run asana-mcp-server

# Placeholder: Currently no official Asana MCP server found
# This wrapper is ready to be updated when an official server is released
echo "Error: Asana MCP Server implementation not found" >&2
echo "Please check https://github.com/modelcontextprotocol/servers for updates" >&2
echo "Once available, update this wrapper script with the correct command" >&2
exit 1

