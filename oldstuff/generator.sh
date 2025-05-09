#!/bin/bash

# Base project directory
PROJECT_ROOT="."
CONFIG_DIR="$PROJECT_ROOT/config"
MEDIA_DIR="$PROJECT_ROOT/media"

# Define service config subfolders and names
declare -A CONFIG_SERVICES=(
  ["adguard/work"]="AdGuard"
  ["adguard/conf"]="AdGuard"
  ["bazarr"]="Bazarr"
  ["jellyfin"]="Jellyfin"
  ["portainer"]="Portainer"
  ["prowlarr"]="Prowlarr"
  ["qbittorrent"]="qBittorrent"
  ["radarr"]="Radarr"
  ["sonarr"]="Sonarr"
  ["watchtower"]="Watchtower"
  ["wireguard"]="WireGuard"
)

# Define media folders
MEDIA_SUBFOLDERS=("downloads" "movies" "tv")

# Create base directories
mkdir -p "$CONFIG_DIR"
mkdir -p "$MEDIA_DIR"

# Create config folders with templated README.md
for folder in "${!CONFIG_SERVICES[@]}"; do
  service_name="${CONFIG_SERVICES[$folder]}"
  full_path="$CONFIG_DIR/$folder"
  mkdir -p "$full_path"

  cat > "$full_path/README.md" <<EOF
# ${service_name} Configuration

This folder contains persistent configuration files for the **${service_name}** container.

## ✔️ Tracked Files (safe to version control)

- Non-sensitive config files (e.g., \`settings.json\`, \`config.xml\`)
- UI preferences or layout configs
- Metadata related to the service's function
- This \`README.md\` file

## ❌ Ignored Files (DO NOT commit)

- API keys or tokens (e.g., \`secrets.json\`, \`.env\`, \`auth.json\`)
- TLS/SSL private keys (e.g., \`*.key\`, \`*.pem\`)
- Password or credential files (e.g., \`passwd\`, \`users.conf\`)
- Cache, database, or runtime logs

## Notes

- Mounted in the container at: \`/config\`
- Configuration changes in the container UI will persist here.

> 📌 Reminder: Check \`.gitignore\` to prevent committing secrets accidentally.
EOF
done

# Create media folders with placeholder README.md
for folder in "${MEDIA_SUBFOLDERS[@]}"; do
  full_path="$MEDIA_DIR/$folder"
  mkdir -p "$full_path"
  echo "# $folder media folder" > "$full_path/README.md"
done

echo "✅ Folder structure and README.md files created with content."
