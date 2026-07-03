# Asana MCP Server

Asana API integration for project and task management.

## Configuration

API key is loaded from `.env.local`:
```env
ASANA_ACCESS_TOKEN=your_asana_access_token_here
# Optional: Workspace ID
ASANA_WORKSPACE_ID=your_workspace_id_here
```

## Prerequisites

- Asana Personal Access Token
- (Optional) Asana Workspace ID for workspace-specific operations

## Setup

1. **Get your Asana Personal Access Token:**
   - Visit: https://app.asana.com/0/my-apps
   - Click "Create new token"
   - Give it a name (e.g., "MCP Integration")
   - Copy the generated token

2. **Add to `.env.local`:**
   ```env
   ASANA_ACCESS_TOKEN=your_token_here
   ```
   - Remove the `#` comment marker
   - Replace `your_token_here` with your actual token
   - No quotes needed, no spaces around `=`

3. **Optional - Workspace ID:**
   - If you want to scope operations to a specific workspace
   - Find your workspace ID in the Asana URL: `https://app.asana.com/0/{workspace_id}/...`
   - Add to `.env.local`: `ASANA_WORKSPACE_ID=your_workspace_id`

## Wrapper Script

The `wrapper.sh` script:
- Loads environment variables from `.env.local` (robust parsing method)
- Validates the Asana token is set
- Exports the token and optional workspace ID
- Executes the Asana MCP server (when available)

## Usage

Configured in `.cursor/mcp.json`:
```json
{
  "asana": {
    "command": "/Users/pfist/Basedev/mcps/asana/wrapper.sh",
    "args": []
  }
}
```

## Status

⚠️ **Note:** Currently, there is no official Asana MCP server available. This wrapper is set up and ready to use once an official server is released.

**To check for updates:**
- Official MCP Servers: https://github.com/modelcontextprotocol/servers
- Community servers: Search GitHub for "asana mcp server"

**When an official server is available:**
1. Update the `wrapper.sh` script with the correct command
2. Follow the server's installation instructions
3. Test the connection

## Troubleshooting

### "ASANA_ACCESS_TOKEN not found"
- Verify the token is set in `.env.local` (no quotes, no spaces around `=`)
- Check the token format: `ASANA_ACCESS_TOKEN=1/...`
- Ensure the token doesn't have trailing spaces
- Remove the `#` comment marker if present
- Restart Cursor after updating `.env.local`

### Token Format
- Asana tokens typically start with `1/` followed by alphanumeric characters
- Make sure there are no extra spaces or line breaks in the token

### Connection Issues
- Restart Cursor after configuration changes
- Check MCP logs in Cursor for detailed errors
- Verify token is valid at https://app.asana.com/0/my-apps
- Ensure token has not expired

### Server Not Available
- This is expected until an official Asana MCP server is released
- The wrapper script will exit with an informative error message
- Check back periodically for updates

## API Documentation

- Asana API: https://developers.asana.com/reference
- Authentication: https://developers.asana.com/guides/auth
- Personal Access Tokens: https://developers.asana.com/docs/personal-access-token

## Documentation

See `../../agent_docs/README_ASANA_MCP.md` for complete documentation (when available).






