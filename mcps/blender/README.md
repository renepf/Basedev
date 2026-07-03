# Blender MCP Server

Blender integration through the Model Context Protocol, allowing AI assistants to control Blender for 3D modeling and scene creation.

## Prerequisites

- **Blender 3.0+** installed
- **uv package manager** installed (`brew install uv` or see [uv docs](https://docs.astral.sh/uv/getting-started/installation/))
- **Blender Addon** installed in Blender

## Setup

### 1. Install Blender Addon

1. Open Blender
2. Go to **Edit > Preferences > Add-ons**
3. Click **"Install..."** and select `addon.py` from `.cursor/blender-mcp/`
4. Enable the addon by checking the box next to **"Interface: Blender MCP"**

### 2. Start Blender MCP Server

1. In Blender, go to the 3D View sidebar (press N if not visible)
2. Find the **"BlenderMCP"** tab
3. Set the port number (default: 9876)
4. Click **"Start MCP Server"**

### 3. Configure MCP Client

The wrapper script uses `uvx blender-mcp` to run the server.

## Usage

Once configured, you can use AI assistants to:
- Create 3D objects and primitives
- Modify object properties
- Apply materials and colors
- Get scene information
- Execute Python code in Blender

## Tools Available

- `get_scene_info` - Get scene information
- `get_object_info` - Get detailed object information
- `create_primitive` - Create basic primitive objects
- `set_object_property` - Set object properties
- `create_object` - Create objects with detailed parameters
- `modify_object` - Modify existing objects
- `delete_object` - Remove objects from scene
- `set_material` - Apply or create materials
- `execute_blender_code` - Run Python code in Blender

## Configuration

No API keys required. The server connects to Blender via TCP socket (default port 9876).

## Troubleshooting

- **Connection issues**: Ensure Blender addon server is running
- **uvx not found**: Install uv package manager
- **Port conflicts**: Change port in Blender addon settings

## Documentation

See `.cursor/blender-mcp/README.md` for complete documentation.







