# Apollo IO MCP Server

Apollo IO API integration for sales intelligence, contact discovery, and lead enrichment.

## Configuration

API key is loaded from `.env.local`:
```env
APOLLO_IO_API_KEY=your_apollo_io_api_key_here
```

## Prerequisites

- Node.js and npx must be installed
- Apollo IO API key

## Setup

1. **Get your Apollo IO API key:**
   - Visit: https://app.apollo.io/#/settings/integrations/api
   - Navigate to API Settings
   - Generate or copy your API key
   - Note: You need an Apollo IO account with API access

2. **Add to `.env.local`:**
   ```env
   APOLLO_IO_API_KEY=your_api_key_here
   ```
   - Remove the `#` comment marker if present
   - Replace `your_api_key_here` with your actual API key
   - No quotes needed, no spaces around `=`

## Wrapper Script

The `wrapper.sh` script:
- Loads environment variables from `.env.local` (robust parsing method)
- Validates the Apollo IO API key is set
- Checks npx availability
- Executes the Apollo IO MCP server via npx
- Passes the API key as an environment variable

## Usage

Configured in `.cursor/mcp.json`:
```json
{
  "apollo": {
    "command": "/Users/pfist/Basedev/mcps/apollo/wrapper.sh",
    "args": []
  }
}
```

## Features

The Apollo IO MCP server provides access to:
- Contact discovery and enrichment
- Company search and data
- Email verification
- Lead generation
- Sales intelligence data

## Troubleshooting

### "APOLLO_IO_API_KEY not found"
- Verify the API key is set in `.env.local` (no quotes, no spaces around `=`)
- Check the key format: `APOLLO_IO_API_KEY=your_key_here`
- Ensure the key doesn't have trailing spaces
- Remove the `#` comment marker if present
- Restart Cursor after updating `.env.local`

### npx Issues
- Verify Node.js is installed: `node --version` and `npx --version`
- Clear npx cache if needed: `npx clear-npx-cache`
- Check internet connection for package download

### Connection Issues
- Restart Cursor after configuration changes
- Check MCP logs in Cursor for detailed errors
- Verify API key is valid at https://app.apollo.io/#/settings/integrations/api
- Ensure your Apollo IO account has API access enabled

### API Rate Limits
- Apollo IO has rate limits on API calls
- Check your plan's rate limits in the Apollo IO dashboard
- The MCP server will respect rate limits automatically

## API Documentation

- Apollo IO API: https://apolloio.github.io/apollo-api-docs/
- Authentication: https://apolloio.github.io/apollo-api-docs/#authentication
- Rate Limits: https://apolloio.github.io/apollo-api-docs/#rate-limits

## Repository

- GitHub: https://github.com/lkm1developer/apollo-io-mcp-server
- MCP Server: Uses npx to run from GitHub repository

## Documentation

For complete documentation, see the Apollo IO MCP server repository:
https://github.com/lkm1developer/apollo-io-mcp-server


