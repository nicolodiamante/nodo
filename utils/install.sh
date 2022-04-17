#!/bin/sh

#
# Install nodo
#

# Determines the current user's shell, if `zsh` then installs.
[[ "$(basename -- "$SHELL")" == "zsh" ]] || exit 1

# Defines the PATHs.
SCRIPT="${HOME}/nodo/script"
ZSHRC="${ZDOTDIR:-${XDG_CONFIG_HOME/zsh:-$HOME}}/.zshrc"

if [[ -d "$SCRIPT" && -f "$ZSHRC" ]]; then
  # Appends to `zshrc`.
  cat << EOF >> ${ZSHRC}
# nodo
fpath=(~/nodo/script \$fpath)
autoload -Uz nodo
EOF
  echo 'zsh: appended nodo to zshrc.'

  # Reloads shell.
  source "${ZSHRC}"
else
  echo 'zsh: zshrc not found!'
fi
