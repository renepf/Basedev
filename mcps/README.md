# MCP Servers Directory

This directory contains all Model Context Protocol (MCP) server integrations, organized by service.

## Structure

```
mcps/
├── README.md           # This file
├── notion/             # Notion API MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── github/             # GitHub MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── gemini/             # Gemini AI MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── blender/            # Blender 3D MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── figma/              # Figma MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── whatsapp/           # WhatsApp MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── strands/            # Strands Agents MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── n8n/                # n8n MCP Server
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── asana/              # Asana MCP Server (template)
│   ├── wrapper.sh      # Wrapper script
│   └── README.md       # Documentation
├── adk/                # ADK MCP (learning)
│   └── README.md       # Documentation
└── fastapi-mcp/        # FastAPI MCP examples (learning)
    └── README.md       # Documentation
```

## Active MCP Servers

### ✅ Configured and Active

- **notion** - Notion API integration
- **github** - GitHub API integration
- **gemini** - Google Gemini AI integration
- **blender** - Blender 3D modeling integration
- **figma** - Figma design tool integration
- **whatsapp** - WhatsApp messaging integration
- **strands** - Strands Agents SDK documentation
- **n8n** - n8n workflow automation (template)

### 📋 Learning/Development

- **asana** - Asana project management (template ready)
- **adk** - Agent Development Kit (learning)
- **fastapi-mcp** - FastAPI MCP examples (learning)

## Adding a New MCP Server

1. **Create directory**:
   ```bash
   mkdir -p mcps/new-service
   ```

2. **Create wrapper script** (`mcps/new-service/wrapper.sh`):
   ```bash
   #!/bin/bash
   SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
   PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
   
   # Load .env.local
   if [ -f "$PROJECT_ROOT/.env.local" ]; then
     set -a
     source <(grep -v '^#' "$PROJECT_ROOT/.env.local" | grep -v '^$' | sed 's/^/export /')
     set +a
   fi
   
   # Validate API key
   if [ -z "$NEW_SERVICE_API_KEY" ]; then
     echo "Error: NEW_SERVICE_API_KEY not found" >&2
     exit 1
   fi
   
   # Execute MCP server
   exec your-mcp-server-command "$@"
   ```

3. **Make executable**:
   ```bash
   chmod +x mcps/new-service/wrapper.sh
   ```

4. **Add to `.env.local`**:
   ```env
   NEW_SERVICE_API_KEY=your_api_key_here
   ```

5. **Update `.cursor/mcp.json`**:
   ```json
   {
     "mcpServers": {
       "newService": {
         "command": "/Users/pfist/Basedev/mcps/new-service/wrapper.sh",
         "args": []
       }
     }
   }
   ```

6. **Create README** (`mcps/new-service/README.md`):
   - Document the service
   - Explain configuration
   - Provide usage examples

## Wrapper Script Pattern

All wrapper scripts follow this pattern:

1. **Load environment variables** from `.env.local`
2. **Validate required API keys**
3. **Check prerequisites** (Docker, Node.js, etc.)
4. **Execute the MCP server** with proper environment

## Configuration

All API keys are stored in `.env.local` at the project root. Each MCP server loads its required keys from this file.

## Documentation

- Main integration guide: `../README_MCP_INTEGRATION.md`
- Individual service docs: See each service's `README.md`

## Security

- All wrapper scripts are executable
- API keys are loaded from `.env.local` (gitignored)
- No sensitive data is hardcoded
- Each service is isolated in its own directory

