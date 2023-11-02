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
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME/zsh:-$HOME}}/.zshrc"

# Check for SCRIPT directory.
if [[ ! -d "$SCRIPT" ]]; then
  echo 'zsh: Nodo script directory not found!'
  exit 1
fi

# Check for ZSHRC file.
if [[ ! -f "$ZSHRC" ]]; then
  echo 'zsh: zshrc not found!'
  exit 1
fi

# Append the necessary lines to zshrc.
cat << EOF >> ${ZSHRC}
# nodo
fpath=(${SCRIPT} \$fpath)
autoload -Uz nodo
EOF
echo "zsh: appended Nodo's necessary lines to .zshrc"

# Advise user to reload shell or open a new terminal session.
echo "Please reload your zsh shell or open a new terminal session to apply changes."
