#!/bin/bash

# Blender MCP Server Wrapper
# Requires: uv package manager and Blender with the addon installed

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
BLENDER_MCP_DIR="$PROJECT_ROOT/.cursor/blender-mcp"

# Check if uv is available
if ! command -v uvx &> /dev/null; then
  echo "Error: uvx is not installed" >&2
  echo "Install uv: curl -LsSf https://astral.sh/uv/install.sh | sh" >&2
  echo "Or on Mac: brew install uv" >&2
  exit 1
fi

# Check if Blender addon is installed
# Note: User needs to manually install the addon in Blender
# Instructions: Edit > Preferences > Add-ons > Install addon.py

# Run Blender MCP server via uvx
# The server connects to Blender via socket (default port 9876)
exec uvx blender-mcp







