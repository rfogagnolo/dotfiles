#!/bin/bash
# Dotfiles installer — cria symlinks para os configs

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Instalando dotfiles de: $DOTFILES_DIR"

# tmux
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "  tmux .......... OK"

# ghostty
GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_DIR"
ln -sf "$DOTFILES_DIR/ghostty/config" "$GHOSTTY_DIR/config"
echo "  ghostty ....... OK"

echo ""
echo "Dotfiles instalados com sucesso!"
