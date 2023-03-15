#!/bin/bash

set -eu

echo "Installing chezmoi ..."
if ! chezmoi="$(command -v chezmoi)"; then
  bin_dir="${HOME}/.local/share"
  chezmoi="${bin_dir}/chezmoi"
  echo "Installing chezmoi to '${chezmoi}'" >&2
  if command -v curl >/dev/null; then
    chezmoi_install_script="$(curl -fsSL https://chezmoi.io/get)"
  elif command -v wget >/dev/null; then
    chezmoi_install_script="$(wget -qO- https://chezmoi.io/get)"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
  sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
  unset chezmoi_install_script bin_dir
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

set -- init --apply --source="${script_dir}"

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
exec "$chezmoi" "$@"


if [ ! -f "$HOME/.config/chezmoi/chezmoi.toml" ]; then
  echo "Applying dotfiles with chezmoi ..."
  # POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
  script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

  set -- init --apply --source="${script_dir}"

  echo "Running 'chezmoi $*'" >&2
  # exec: replace current process with chezmoi
  exec "$chezmoi" "$@"
  chmod 0600 "$HOME/.config/chezmoi/chezmoi.toml"
else
  echo "A chezmoi config already exists. To reinstall first delete '${HOME}'/.config/chezmoi/chezmoi.toml"  
fi

