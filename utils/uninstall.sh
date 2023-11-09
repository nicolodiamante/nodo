#!/bin/zsh

# Uninstall Nodo

echo "Starting the uninstallation process of Nodo..."

# Defines the PATHs.
SCRIPT_DIR="$(dirname "$0")"
SCRIPT="${SCRIPT_DIR}/script"

# Defines the PATH for the .zshrc.
ZSHRC="${XDG_CONFIG_HOME:-$HOME}/.zshrc"
ZSHRC_BACKUP_GLOB="${ZSHRC}.bak_*"

# Check for SCRIPT directory.
if [[ ! -d "$SCRIPT" ]]; then
  echo 'zsh: Nodo script directory not found!' >&2
  exit 1
fi

# Check for .zshrc and back it up before making changes.
if [[ -f "$ZSHRC" ]]; then
  echo "Found .zshrc at ${ZSHRC}."

  # Check for existing backups.
  existing_backups=( $ZSHRC_BACKUP_GLOB )
  if (( ${#existing_backups[@]} > 0 )); then
    # Sort backups by date, descending.
    sorted_backups=($(echo "${existing_backups[@]}" | tr ' ' '\n' | sort -r))
    latest_backup=${sorted_backups[0]}
    echo "Latest backup found at ${latest_backup}."
    read -q "REPLY?Do you want to restore the latest backup instead of creating a new one? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      # Restore the latest backup.
      if cp "$latest_backup" "$ZSHRC"; then
        echo "Restored .zshrc from the latest backup."
      else
        echo "Failed to restore .zshrc from the latest backup." >&2
        exit 1
      fi
    fi
  fi

  if [[ "$REPLY" =~ ^[Nn]$ ]] || [[ -z "$REPLY" ]]; then
    # If user chooses not to use the latest backup, create a new one.
    BACKUP="${ZSHRC}.bak_$(date +%F-%H%M%S)"
    cp "$ZSHRC" "${BACKUP}" && echo "Backup saved as ${BACKUP}."
  fi

  # Prompt the user before removing Nodo configurations.
  read -q "REPLY?Do you want to remove Nodo configurations from .zshrc? [y/N] "
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Use 'sed' to remove lines related to Nodo.
    # Check if we are on macOS or Linux and adjust the 'sed' command accordingly.
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # macOS requires an empty string as an argument to -i
      sed -i '' '/# Nodo path./d' "$ZSHRC"
      sed -i '' "/fpath=(${HOME//\//\\/}\/nodo\/script \$fpath)/d" "$ZSHRC"
      sed -i '' '/autoload -Uz nodo/d' "$ZSHRC"
    else
      # Linux does not require an empty string as an argument to -i
      sed -i '/# Nodo path./d' "$ZSHRC"
      sed -i "/fpath=(${HOME//\//\\/}\/nodo\/script \$fpath)/d" "$ZSHRC"
      sed -i '/autoload -Uz nodo/d' "$ZSHRC"
    fi
    echo "Nodo configurations have been removed from .zshrc."
  else
    echo "No changes made to .zshrc."
  fi
else
  echo ".zshrc file not found. No cleanup needed."
fi

echo "Uninstallation of Nodo is complete."
