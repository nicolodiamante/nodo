#!/bin/zsh

# Uninstall Nodo

echo "Starting the uninstallation process of Nodo..."

# Defines the PATHs.
SCRIPT_DIR="$(dirname "$0")"
SCRIPT="${SCRIPT_DIR}/script"

# Defines the PATH for the .zshrc.
ZSHRC="${XDG_CONFIG_HOME:-$HOME}/.zshrc"

# Check for SCRIPT directory.
if [[ ! -d "$SCRIPT" ]]; then
  echo 'zsh: Nodo script directory not found!'
  exit 1
fi

# Check for .zshrc and back it up before making changes.
if [[ -f "$ZSHRC" ]]; then
  echo "Found .zshrc at ${ZSHRC}."
  echo "Backing up .zshrc..."
  BACKUP="${ZSHRC}.bak_$(date +%F-%H%M%S)"
  cp "$ZSHRC" "${BACKUP}" && echo "Backup saved as ${BACKUP}."

  # Prompt the user before removing Nodo configurations.
  read -q "REPLY?Do you want to remove Nodo configurations from .zshrc? [y/N] ";
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Use 'sed' to remove lines related to Nodo.
    sed -i '' '/# Nodo path./d' "$ZSHRC"
    sed -i '' "/fpath=(${HOME//\//\\/}\/nodo\/script \$fpath)/d" "$ZSHRC"
    sed -i '' '/autoload -Uz nodo/d' "$ZSHRC"
    echo "Nodo configurations have been removed from .zshrc."
  else
    echo "No changes made to .zshrc."
  fi
else
  echo ".zshrc file not found. No cleanup needed."
fi

echo "Uninstallation of Nodo is complete."
