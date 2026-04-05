#!/usr/bin/env bash
set -e

## ── Detect OS ────────────────────────────────
OS="$(uname -s)"

install_packages() {
  if [[ "$OS" == "Darwin" ]]; then
    if ! command -v brew &>/dev/null; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install neovim git ripgrep fd node stow tmux
  elif [[ "$OS" == "Linux" ]]; then
    sudo apt update
    sudo apt install -y neovim git ripgrep fd-find nodejs npm stow tmux
  fi
}

setup_dotfiles() {
  local DOTFILES="$HOME/dotfiles"
  if [[ ! -d "$DOTFILES" ]]; then
    git clone git@github.com:phuquocchamp/dotfiles.git "$DOTFILES"
  fi

  for pkg in nvim tmux; do
    if [[ -d "$DOTFILES/$pkg" ]]; then
      echo "Stowing $pkg..."
      stow --dir="$DOTFILES" --restow "$pkg"
    fi
  done
}

## ── Run ──────────────────────────────────────
echo "Installing dependencies..."
install_packages

echo "Setting up dotfiles..."
setup_dotfiles

echo "Done! Run 'nvim' to start."
echo "lazy.nvim will auto-install plugins on first launch."
