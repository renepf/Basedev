# Gemini MCP Server

Google Gemini AI integration for text generation, image analysis, and embeddings.

## Configuration

API key is loaded from `.env.local`:
```env
GEMINI_API_KEY=your_gemini_api_key_here
```

## Prerequisites

- Node.js and npx must be installed

## Wrapper Script

The `wrapper.sh` script:
- Loads environment variables from `.env.local` (robust parsing method)
- Validates the Gemini API key is set
- Checks npx availability
- Executes the Gemini MCP server via npx
- Passes the API key as an environment variable

## Usage

Configured in `.cursor/mcp.json`:
```json
{
  "gemini": {
    "command": "/Users/pfist/Basedev/mcps/gemini/wrapper.sh",
    "args": []
  }
}
```

## Troubleshooting

### "GEMINI_API_KEY not found"
- Verify the API key is set in `.env.local` (no quotes, no spaces around `=`)
- Check the key format: `GEMINI_API_KEY=AIzaSy...`
- Ensure the key doesn't have trailing spaces
- Restart Cursor after updating `.env.local`

### npx Issues
- Verify Node.js is installed: `node --version` and `npx --version`
- Clear npx cache if needed: `npx clear-npx-cache`
- Check internet connection for package download

### Connection Issues
- Restart Cursor after configuration changes
- Check MCP logs in Cursor for detailed errors
- Verify API key is valid at https://aistudio.google.com/app/apikey

## Documentation

See `../../agent_docs/README_GEMINI_MCP.md` for complete documentation.


