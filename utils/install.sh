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
SCRIPT="${HOME}/nodo/script"
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME/zsh:-$HOME}}/.zshrc"

if [[ -d "$SCRIPT" && -f "$ZSHRC" ]]; then
# Append the necessary lines to zshrc.
cat << EOF >> ${ZSHRC}
# nodo
fpath=(~/nodo/script \$fpath)
autoload -Uz nodo
EOF
  echo 'zsh: appended Nodo's necessary lines to .zshrc'

  # Reloads shell.
  source "${ZSHRC}"
else
  echo 'zsh: zshrc not found!'
fi
