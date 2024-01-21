#!/bin/zsh

#
# Install Nodo.
#

# Ensures the script is run with zsh.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

# Define the .zshrc PATH.
ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"

# Update .zshrc with Nodo.
if [[ -f "$ZSHRC" ]]; then
  echo "\nNodo: Starting the installation process..."

  # Ask the user if they want to create a backup.
  read -q "REPLY?Found an existing .zshrc in ${ZSHRC}. Do you want to create a backup? [y/N] "
  echo ""
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    # Backup existing file
    ZSHRC_BACKUP="${ZSHRC}_$(date "+%Y%m%d%H%M%S").bak"
    echo "Creating backup of .zshrc as ${ZSHRC_BACKUP}..."

    if cp "${ZSHRC}" "${ZSHRC_BACKUP}"; then
      echo "Nodo: Backup successful."
    else
      echo "\nNodo: Failed to backup .zshrc. Aborting operation." >&2
      exit 1
    fi
  else
    # If the response is not 'yes', proceed without creating a backup.
    echo "\nNodo: Proceeding without creating a backup."
  fi

  # Updates .zshrc with Nodo configurations.
  echo "\nNodo: Updating .zshrc..."
  NODO_PATH_LINE="fpath=($HOME/nodo/script $fpath)"
  AUTOLOAD_LINE="autoload -Uz nodo"
  if ! grep -Fxq "${NODO_PATH_LINE}" "${ZSHRC}" && ! grep -Fxq "${AUTOLOAD_LINE}" "${ZSHRC}"; then
    echo "" >> "${ZSHRC}"
    echo "# Nodo PATH." >> "${ZSHRC}"
    echo "${NODO_PATH_LINE}" >> "${ZSHRC}"
    echo "${AUTOLOAD_LINE}" >> "${ZSHRC}"
    echo "Nodo: Appended PATH to ${ZSHRC}"
  else
    echo "Nodo: PATH is already present in ${ZSHRC}"
  fi
else
  # Creates a new .zshrc file if it doesn't exist.
  echo "\nNodo: .zshrc not found. Creating a new one..."
  if echo "" > "${ZSHRC}"; then
    echo "\nNodo: Adding PATH to a new .zshrc..."
    echo "# Nodo PATH." >> "${ZSHRC}"
    echo "${NODO_PATH_LINE}" >> "${ZSHRC}"
    echo "${AUTOLOAD_LINE}" >> "${ZSHRC}"
    echo "Nodo: PATH was added to a new .zshrc."
  else
    echo "Nodo: Failed to create a new .zshrc." >&2
    exit 1
  fi
fi

# Attempts to reload .zshrc to apply changes
if ! source "${ZSHRC}" &>/dev/null; then
  echo "\nNodo: Failed to reload .zshrc. Please reload manually to apply changes." >&2
fi

# Prints a success message.
echo "\nNodo: Setup complete."
