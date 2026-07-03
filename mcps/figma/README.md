# Figma MCP Server

Figma integration through the Model Context Protocol, allowing AI assistants to read and modify Figma designs.

## Prerequisites

- **Bun runtime** installed (`curl -fsSL https://bun.sh/install | bash`)
- **Figma Desktop** or Figma web app
- **Figma Plugin** installed (see setup below)

## Setup

### 1. Install Dependencies

```bash
cd .cursor/cursor-talk-to-figma-mcp
bun install
```

### 2. Start WebSocket Server

The WebSocket server must be running for the MCP server to communicate with Figma:

```bash
cd .cursor/cursor-talk-to-figma-mcp
bun start
```

Keep this terminal running.

### 3. Install Figma Plugin

1. In Figma, go to **Plugins > Development > New Plugin**
2. Choose **"Link existing plugin"**
3. Select `src/cursor_mcp_plugin/manifest.json` from `.cursor/cursor-talk-to-figma-mcp/`
4. The plugin should now be available in your Figma development plugins

### 4. Connect Plugin to Server

1. Open Figma and run the **Cursor MCP Plugin**
2. Use `join_channel` tool to connect to the WebSocket server
3. The plugin will connect to the server

## Usage

Once configured:
1. WebSocket server is running
2. MCP server is configured in Cursor
3. Figma plugin is connected

You can now use AI assistants to:
- Read Figma documents and selections
- Create rectangles, frames, and text
- Modify styling (colors, strokes, corner radius)
- Export nodes as images
- Execute Figma code

## Tools Available

### Document & Selection
- `get_document_info` - Get document information
- `get_selection` - Get current selection
- `get_node_info` - Get detailed node information

### Creating Elements
- `create_rectangle` - Create rectangles
- `create_frame` - Create frames
- `create_text` - Create text nodes

### Styling
- `set_fill_color` - Set fill colors (RGBA)
- `set_stroke_color` - Set stroke colors and weight
- `set_corner_radius` - Set corner radius

### Layout & Organization
- `move_node` - Move nodes
- `resize_node` - Resize nodes
- `delete_node` - Delete nodes

### Components & Styles
- `get_styles` - Get local styles
- `get_local_components` - Get local components
- `get_team_components` - Get team components
- `create_component_instance` - Create component instances

### Export & Advanced
- `export_node_as_image` - Export as image (PNG, JPG, SVG, PDF)
- `execute_figma_code` - Execute JavaScript in Figma

### Connection
- `join_channel` - Join WebSocket channel

## Configuration

No API keys required. Uses WebSocket for communication.

## Troubleshooting

- **WebSocket not connecting**: Ensure WebSocket server is running
- **Plugin not found**: Check plugin installation in Figma
- **bun not found**: Install Bun runtime

## Documentation

See `.cursor/cursor-talk-to-figma-mcp/readme.md` for complete documentation.







