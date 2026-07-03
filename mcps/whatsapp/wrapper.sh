#!/bin/bash

# WhatsApp MCP Server Wrapper
# Requires: Go bridge running and Python/uv

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
WHATSAPP_MCP_DIR="$PROJECT_ROOT/.cursor/whatsapp-mcp"
WHATSAPP_SERVER_DIR="$WHATSAPP_MCP_DIR/whatsapp-mcp-server"

# Check if uv is available
if ! command -v uv &> /dev/null; then
  echo "Error: uv is not installed" >&2
  echo "Install uv: curl -LsSf https://astral.sh/uv/install.sh | sh" >&2
  exit 1
fi

# Check if Go bridge is running
# Note: User needs to start the Go bridge separately:
# cd $WHATSAPP_MCP_DIR/whatsapp-bridge && go run main.go
# First time requires QR code scan for WhatsApp authentication

# Check if WhatsApp server directory exists
if [ ! -d "$WHATSAPP_SERVER_DIR" ]; then
  echo "Error: WhatsApp MCP server directory not found at $WHATSAPP_SERVER_DIR" >&2
  exit 1
fi

# Run WhatsApp MCP server via uv
exec uv --directory "$WHATSAPP_SERVER_DIR" run main.py







