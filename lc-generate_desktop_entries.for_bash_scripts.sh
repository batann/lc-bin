#!/bin/bash

# Directory containing your bash scripts
SCRIPT_DIR="/home/batan/lc"

# Directory to save desktop entries
DESKTOP_DIR="$HOME/.local/share/applications"

# Category for development scripts
CATEGORY="Development"

# Check if the script directory exists
if [[ ! -d "$SCRIPT_DIR" ]]; then
    echo "Error: Directory $SCRIPT_DIR does not exist."
    exit 1
fi

# Create desktop entry for each script
for script in "$SCRIPT_DIR"/*.sh; do
    # Extract script name without path and extension
    script_name=$(basename "$script" .sh)

    # Define icon path
    icon_path="$SCRIPT_DIR/${script_name}.icon96.png"

    # Check if icon file exists
    if [[ ! -f "$icon_path" ]]; then
        echo "Warning: Icon $icon_path does not exist for $script_name. Skipping."
        continue
    fi

    # Create desktop entry content
    desktop_entry="[Desktop Entry]
Name=${script_name}
Exec=bash $script
Icon=${icon_path}
Type=Application
Categories=${CATEGORY};
Terminal=true"

    # Write desktop entry to file
    desktop_file="${DESKTOP_DIR}/${script_name}.desktop"
    echo "$desktop_entry" > "$desktop_file"
    chmod +x "$desktop_file"

    echo "Desktop entry created for $script_name"
done

echo "All entries created successfully."

