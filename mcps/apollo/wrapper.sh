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

# Check if Apollo IO API key is set
if [ -z "$APOLLO_IO_API_KEY" ]; then
  echo "Error: APOLLO_IO_API_KEY not found in .env.local" >&2
  echo "Please ensure APOLLO_IO_API_KEY is set in $PROJECT_ROOT/.env.local" >&2
  exit 1
fi

# Check if npx is available
if ! command -v npx &> /dev/null; then
  echo "Error: npx is not installed or not in PATH" >&2
  echo "Please install Node.js: https://nodejs.org/" >&2
  exit 1
fi

# Export the API key so it's available to the MCP server
export APOLLO_IO_API_KEY

# Run Apollo IO MCP Server via npx
# The API key is passed as an environment variable
exec npx -y github:lkm1developer/apollo-io-mcp-server


