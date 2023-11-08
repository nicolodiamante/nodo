#!/bin/zsh

#
# Install Nodo
#

# Determines the current user's shell, if not `zsh` then exit.
if [[ "$(basename -- "$SHELL")" != "zsh" ]]; then
  echo "Please switch to zsh shell to continue."
  exit 1
fi

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

# Backup .zshrc before updating.
if [[ -f "$ZSHRC" ]]; then
  BACKUP="${ZSHRC}.bak_$(date +%F-%H%M%S)"
  cp "${ZSHRC}" "${BACKUP}" || { echo "Failed to backup .zshrc."; exit 1; }
fi

# Update .zshrc.
if ! grep -q "fpath=(${HOME}/nodo/script" "${ZSHRC}"; then
  if [[ -f "$ZSHRC" ]]; then
    cat << EOF >> "${ZSHRC}"

# Nodo path.
fpath=(${HOME}/nodo/script \$fpath)
autoload -Uz nodo
EOF
    echo "Appended Nodo's necessary lines to .zshrc"
  else
    echo 'Error: .zshrc not found!'
    exit 1
  fi
else
  echo "Nodo's lines are already present in .zshrc"
fi

# Reminder for the user.
echo "Please reload your zsh shell or open a new terminal session to apply changes."
