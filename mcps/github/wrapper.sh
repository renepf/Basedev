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

# Check if GitHub token is set
if [ -z "$GITHUB_PERSONAL_ACCESS_TOKEN" ]; then
  echo "Error: GITHUB_PERSONAL_ACCESS_TOKEN not found in .env.local" >&2
  echo "Please ensure GITHUB_PERSONAL_ACCESS_TOKEN is set in $PROJECT_ROOT/.env.local" >&2
  exit 1
fi

# Check if Docker is available
if ! command -v docker &> /dev/null; then
  echo "Error: Docker is not installed or not in PATH" >&2
  echo "Please install Docker: https://www.docker.com/get-started/" >&2
  exit 1
fi

# Check if Docker daemon is running
if ! docker info &> /dev/null; then
  echo "Error: Docker daemon is not running" >&2
  echo "Please start Docker Desktop or the Docker daemon" >&2
  echo "On macOS: Open Docker Desktop application" >&2
  echo "On Linux: Run 'sudo systemctl start docker' or 'sudo service docker start'" >&2
  exit 1
fi

# Run GitHub MCP Server via Docker
exec docker run -i --rm \
  -e GITHUB_PERSONAL_ACCESS_TOKEN="$GITHUB_PERSONAL_ACCESS_TOKEN" \
  ghcr.io/github/github-mcp-server "$@"

