#!/bin/bash

set -e

echo "Installing or updating chezmoi ..."
brew bundle --file=- <<EOF
    brew 'chezmoi'
EOF
if [ ! -f "$HOME/.config/chezmoi/chezmoi.toml" ]; then
  echo "Applying dotfiles with chezmoi ..."
  chezmoi init --apply --verbose https://github.com/einer/dotfiles.git
  chmod 0600 "$HOME/.config/chezmoi/chezmoi.toml"
fi

