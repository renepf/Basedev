# GitHub MCP Server

GitHub API integration for repository, issue, and PR management.

## Configuration

API key is loaded from `.env.local`:
```env
GITHUB_PERSONAL_ACCESS_TOKEN=your_github_token_here
```

## Prerequisites

- Docker must be installed and running
- GitHub Personal Access Token with appropriate scopes

## Wrapper Script

The `wrapper.sh` script:
- Loads environment variables from `.env.local` (robust parsing method)
- Validates the GitHub token is set
- Checks Docker availability
- Executes the GitHub MCP server via Docker
- Passes the token securely to the Docker container

## Usage

Configured in `.cursor/mcp.json`:
```json
{
  "github": {
    "command": "/Users/pfist/Basedev/mcps/github/wrapper.sh",
    "args": []
  }
}
```

## Troubleshooting

### "GITHUB_PERSONAL_ACCESS_TOKEN not found"
- Verify the token is set in `.env.local` (no quotes, no spaces around `=`)
- Check the token format: `GITHUB_PERSONAL_ACCESS_TOKEN=ghp_...`
- Ensure the token doesn't have trailing spaces
- Restart Cursor after updating `.env.local`

### Docker Issues
- Ensure Docker is running: `docker ps`
- Check Docker permissions
- Pull the image manually: `docker pull ghcr.io/github/github-mcp-server`

### Connection Issues
- Restart Cursor after configuration changes
- Check MCP logs in Cursor for detailed errors
- Verify token has required scopes (repo, read:org, read:user)

## Documentation

See `../../agent_docs/README_GITHUB_MCP.md` for complete documentation.


