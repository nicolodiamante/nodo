#!/bin/zsh

#
# Install Nodo.
#

# Determines the current user's shell, if not `zsh` then exit.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue." >&2
  exit 1
fi

# Defines the PATHs.
SCRIPT_DIR="$(dirname "$0")"
SCRIPT="${SCRIPT_DIR}/script"

# Defines the PATH for the .zshrc.
ZSHRC="${XDG_CONFIG_HOME:-$HOME}/.zshrc"

# Check for SCRIPT directory.
if [[ ! -d "$SCRIPT" ]]; then
  echo 'zsh: Nodo script directory not found!' >&2
  exit 1
fi

# Backup .zshrc before updating.
if [[ -f "$ZSHRC" ]]; then
  BACKUP="${ZSHRC}.bak_$(date +%F-%H%M%S)"
  if ! cp "${ZSHRC}" "${BACKUP}"; then
    echo "Failed to backup .zshrc." >&2
    exit 1
  fi
elif [[ ! -f "$ZSHRC" ]]; then
  echo "# Creating a new .zshrc file" > "${ZSHRC}"
  echo "New .zshrc file created."
fi

# Update .zshrc with Nodo path if not already present.
if ! grep -q "fpath=(${HOME}/nodo/script" "${ZSHRC}"; then
  cat << EOF >> "${ZSHRC}"

# Nodo path.
fpath=(${HOME}/nodo/script \$fpath)
autoload -Uz nodo
EOF
  echo "Appended Nodo's necessary lines to .zshrc"
else
  echo "Nodo's lines are already present in .zshrc" >&2
fi

# Reminder for the user.
echo "Please reload your zsh shell or open a new terminal session to apply changes."
