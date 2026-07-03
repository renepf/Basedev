#!/bin/bash

# Strands Agents MCP Server Wrapper
# Provides documentation about Strands Agents SDK

# Check if uvx is available
if ! command -v uvx &> /dev/null; then
  echo "Error: uvx is not installed" >&2
  echo "Install uv: curl -LsSf https://astral.sh/uv/install.sh | sh" >&2
  echo "Or on Mac: brew install uv" >&2
  exit 1
fi

# Run Strands Agents MCP server via uvx
exec uvx strands-agents-mcp-server







