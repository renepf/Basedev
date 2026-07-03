# Notion MCP Server

Notion API integration for database and page management.

## Prerequisites

- **Node.js** installed
- **Notion MCP Server** installed globally (recommended):
  ```bash
  npm install -g @notionhq/notion-mcp-server
  ```

## Configuration

API key is loaded from `.env.local`:
```env
NOTION_API_KEY=your_notion_api_key_here
```

The wrapper script automatically:
- Loads the API key from `.env.local` (supports both `NOTION_API_KEY` and `NOTION_TOKEN`)
- Sets the `NOTION_TOKEN` environment variable (recommended method)
- Also sets `OPENAPI_MCP_HEADERS` as a fallback for compatibility
- Uses the globally installed Notion MCP server (recommended)
- Falls back to npx if global installation not available

## Wrapper Script

The `wrapper.sh` script:
- Loads environment variables from `.env.local`
- Validates the Notion API key (supports `NOTION_API_KEY` or `NOTION_TOKEN`)
- Sets `NOTION_TOKEN` for the MCP server (recommended by the server)
- Executes the Notion MCP server (prefers global installation)

## Usage

Configured in `.cursor/mcp.json`:
```json
{
  "notionApi": {
    "command": "/Users/pfist/Basedev/mcps/notion/wrapper.sh",
    "args": []
  }
}
```

## Troubleshooting

### "npm error Invalid Version"
If you see this error, install the Notion MCP server globally:
```bash
npm install -g @notionhq/notion-mcp-server
```

The wrapper script will automatically use the global installation, which avoids npm dependency resolution issues.

### API Key Issues
- Verify `NOTION_API_KEY` (or `NOTION_TOKEN`) is set in `.env.local`
- The wrapper automatically converts `NOTION_API_KEY` to `NOTION_TOKEN` if needed
- Check that the key is valid and has proper permissions
- Ensure the key doesn't have quotes or extra spaces
- Share your Notion databases with the integration

### Connection Issues / Timeout Errors
- **Restart Cursor** after updating the wrapper script (required for MCP changes)
- Check MCP logs in Cursor for detailed error messages
- Verify the API key format is correct (should start with `ntn_`)
- The wrapper now uses `NOTION_TOKEN` which is the recommended method by the server
- If you see timeout errors, ensure the Notion MCP server is installed globally: `npm install -g @notionhq/notion-mcp-server`

## Documentation

See `../../agent_docs/README_NOTION_API.md` for complete documentation.







