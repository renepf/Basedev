# n8n MCP Server

n8n workflow automation integration through the Model Context Protocol.

## Prerequisites

- **n8n instance** running (self-hosted or cloud)
- **n8n API credentials**

## Setup

### 1. Get n8n API Key

1. Go to your n8n instance
2. Navigate to **Settings → API**
3. Create a new API key
4. Copy the key

### 2. Configure Environment Variables

Add to `.env.local`:
```env
N8N_API_KEY=your_n8n_api_key_here
N8N_BASE_URL=https://your-n8n-instance.com
```

### 3. Update Wrapper Script

The wrapper script template needs to be updated with the actual n8n MCP server command once available.

## Usage

Once configured, you can:
- Trigger n8n workflows
- Monitor workflow executions
- Manage n8n automations

## Configuration

Required environment variables:
- `N8N_API_KEY` - Your n8n API key
- `N8N_BASE_URL` - Your n8n instance URL

## Documentation

See `.cursor/mcp-n8n-cursor/README.md` for project information.







