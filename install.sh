#!/bin/bash
# Dotfiles installer — cria symlinks para os configs

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Instalando dotfiles de: $DOTFILES_DIR"
echo ""

# tmux
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "  tmux ........... OK"

# ghostty
GHOSTTY_DIR="$HOME/.config/ghostty"
mkdir -p "$GHOSTTY_DIR"
ln -sf "$DOTFILES_DIR/ghostty/config" "$GHOSTTY_DIR/config"
echo "  ghostty ........ OK"

# starship
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
echo "  starship ....... OK"

# zshrc
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
echo "  zshrc .......... OK"

echo ""
echo "Dotfiles instalados com sucesso!"
echo ""
echo "Dependencias necessarias (instale com brew):"
echo "  brew install starship fzf lsd bat tmux"
echo ""
echo "Reinicie o terminal para aplicar tudo."
