#!/bin/zsh

#
# Uninstall Nodo.
#

echo "Starting the uninstallation process of Nodo..."

# Define the .zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"
ZSHRC_BACKUP_GLOB="${ZSHRC}_nodo_backup*.bak"

# Function to remove Nodo configurations.
remove_nodo_config() {
  echo "\nNodo: Checking for existing configuration in .zshrc..."

  local NODO_PATH_LINE="fpath=($HOME/nodo/script $fpath)"
  local AUTOLOAD_LINE="autoload -Uz nodo"

  if grep -Fxq "${NODO_PATH_LINE}" "${ZSHRC}" || grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    read -q "REPLY?Nodo configurations found. Do you want to remove them from .zshrc? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' '/# Nodo PATH./d' "${ZSHRC}"
        sed -i '' "/fpath=($HOME\/nodo\/script $fpath)/d" "${ZSHRC}"
        sed -i '' '/autoload -Uz nodo/d' "${ZSHRC}"
      else
        sed -i '/# Nodo PATH./d' "${ZSHRC}"
        sed -i "/fpath=($HOME\/nodo\/script $fpath)/d" "${ZSHRC}"
        sed -i '/autoload -Uz nodo/d' "${ZSHRC}"
      fi
      echo "Nodo: Configurations have been removed from .zshrc."
    else
      echo "Nodo: No changes made to .zshrc."
    fi
  else
    echo "Nodo: No configurations found in .zshrc."
  fi
}

# Check for .zshrc and back it up before making changes.
if [[ -f "$ZSHRC" ]]; then
  # Look for the most recent backup.
  backups=($(ls -t $ZSHRC_BACKUP_GLOB 2>/dev/null))
  if [[ ${#backups[@]} -gt 0 ]]; then
    latest_backup="${backups[0]}"
    echo "\nNodo: Latest backup found at ${latest_backup}."
    read -q "REPLY?Do you want to restore from the latest backup? [y/N] "
    echo ""
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      # Restore the latest backup.
      if cp "${latest_backup}" "${ZSHRC}"; then
        echo "Nodo: Restored .zshrc from the latest backup."
        exit 0
      else
        echo "\nNodo: Failed to restore .zshrc from the latest backup." >&2
        exit 1
      fi
    else
      remove_nodo_config
    fi
  else
    remove_nodo_config
  fi
else
  echo "\nNodo: .zshrc not found. No cleanup needed."
fi

echo "\nNodo: Uninstall complete."
