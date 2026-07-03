# WhatsApp MCP Server

WhatsApp integration through the Model Context Protocol, allowing AI assistants to search messages, contacts, and send WhatsApp messages.

## Prerequisites

- **Go** installed (`brew install go` or see [Go docs](https://go.dev/doc/install))
- **Python 3.6+** installed
- **uv package manager** installed
- **WhatsApp mobile app** for QR code authentication

## Setup

### 1. Start WhatsApp Bridge (Go Application)

The Go bridge connects to WhatsApp and stores messages in SQLite:

```bash
cd .cursor/whatsapp-mcp/whatsapp-bridge
go run main.go
```

**First time setup**:
- A QR code will be displayed
- Scan it with your WhatsApp mobile app
- After ~20 days, you may need to re-authenticate

**Keep this terminal running** - it maintains the WhatsApp connection.

### 2. Configure MCP Server

The wrapper script runs the Python MCP server which connects to the Go bridge.

## Usage

Once both the Go bridge and MCP server are running:
- Search your WhatsApp messages
- Search contacts
- List chats
- Get message context
- Send messages through WhatsApp

## Tools Available

- `search_contacts` - Search contacts by name or phone
- `list_messages` - Retrieve messages with filters
- `list_chats` - List available chats
- `get_chat` - Get chat information
- `get_direct_chat_by_contact` - Find direct chat with contact
- `get_contact_chats` - List chats with specific contact
- `get_last_interaction` - Get most recent message with contact
- `get_message_context` - Get context around message
- `send_message` - Send WhatsApp message

## Configuration

No API keys required. Uses WhatsApp Web multidevice API.

## Data Storage

- Messages stored in SQLite: `.cursor/whatsapp-mcp/whatsapp-bridge/store/`
- Database files: `messages.db` and `whatsapp.db`
- All data is stored locally

## Troubleshooting

- **QR code not displaying**: Restart the Go bridge
- **Authentication expired**: Re-scan QR code (after ~20 days)
- **Device limit reached**: Remove devices from WhatsApp Settings > Linked Devices
- **Messages not loading**: Wait a few minutes for initial sync
- **Out of sync**: Delete database files and restart bridge

## Security

- All messages stored locally in SQLite
- Only sent to LLM when accessed through tools
- Direct connection to WhatsApp (no third-party services)

## Documentation

See `.cursor/whatsapp-mcp/README.md` for complete documentation.







