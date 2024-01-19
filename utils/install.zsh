#!/bin/zsh

#
# Install Nodo.
#

# Ensures the script is run with zsh.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Define the zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

# Update .zshrc with Nodo.
if [[ -f "$ZSHRC" ]]; then
  echo "\nNodo: Starting the installation process..."

  # Ask the user if they want to create a backup.
  read -q "REPLY?Found an existing .zshrc in ${ZSHRC}. Do you want to create a backup? [y/N] "
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Count the number of existing 'nodo' backups.
    backup_count=$(ls ${ZSHRC}_nodo_backup*.bak 2>/dev/null | wc -l | tr -d ' ')
    BACKUP="${ZSHRC}_nodo_backup${backup_count}.bak"

    echo "\nNodo: Backing up zshrc as: ${BACKUP}..."
    if cp "${ZSHRC}" "${BACKUP}"; then
      echo "Nodo: Backup successful."
    else
      echo "Nodo: Failed to backup .zshrc. Aborting operation." >&2
      exit 1
    fi
  fi

  # Updates .zshrc with Nodo configurations.
  echo "\nNodo: Updating .zshrc..."
  NODO_PATH_LINE="fpath=($HOME/nodo/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz nodo"
  if ! grep -Fxq "${NODO_PATH_LINE}" "${ZSHRC}" && ! grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    echo "" >> "${ZSHRC}"
    echo "# Nodo PATH." >> "${ZSHRC}"
    echo "fpath=($HOME/nodo/script $fpath)" >> "${ZSHRC}"
    echo "autoload -Uz nodo" >> "${ZSHRC}"
    echo "Nodo: Appended PATH to ${ZSHRC}"
  else
    echo "Nodo: PATH is already present in: ${ZSHRC}"
  fi
else
  # Creates a new .zshrc file if it doesn't exist.
  echo "\nNodo: .zshrc not found. Creating a new one..."
  if ! touch "${ZSHRC}"; then
    echo "Nodo: Failed to create a new .zshrc." >&2
    exit 1
  fi
  echo "\nNodo: Adding PATH to a new .zshrc..."
  echo "" >> "${ZSHRC}"
  echo "# Nodo PATH." >> "${ZSHRC}"
  echo "fpath=($HOME/nodo/script $fpath)" >> "${ZSHRC}"
  echo "autoload -Uz nodo" >> "${ZSHRC}"
  echo "Nodo: PATH was added to a new .zshrc."
fi

# Attempts to reload .zshrc to apply changes
if ! source "${ZSHRC}" &>/dev/null; then
  echo "\nNodo: Failed to reload .zshrc. Please reload manually to apply changes." >&2
fi

echo "\nNodo: Setup complete."
