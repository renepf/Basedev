#!/bin/bash

# Figma MCP Server Wrapper
# Requires: Bun runtime and WebSocket server running

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
FIGMA_MCP_DIR="$PROJECT_ROOT/.cursor/cursor-talk-to-figma-mcp"

# Check if bun is available
if ! command -v bun &> /dev/null; then
  echo "Error: bun is not installed" >&2
  echo "Install bun: curl -fsSL https://bun.sh/install | bash" >&2
  exit 1
fi

# Check if WebSocket server is running
# Note: User needs to start the WebSocket server separately:
# cd $FIGMA_MCP_DIR && bun start

# Run Figma MCP server
# The server connects to Figma via WebSocket
exec bun run "$FIGMA_MCP_DIR/src/talk_to_figma_mcp/server.ts"







