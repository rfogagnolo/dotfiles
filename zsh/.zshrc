export PATH="$HOME/.local/bin:$HOME/Library/Python/3.9/bin:$PATH"

# OpenClaw Completion
source "/Users/rfogs/.openclaw/completions/openclaw.zsh"
export PATH="/Users/rfogs/.bun/bin:$PATH"

# --- Auto-detect macOS light/dark appearance ---
# Syncs theme for: Zellij, bat, and COLORFGBG-aware tools (OpenClaw, etc.)
sync_terminal_theme() {
  if defaults read -g AppleInterfaceStyle &>/dev/null; then
    # Dark mode
    export BAT_THEME="Catppuccin Mocha"
    export COLORFGBG="15;0"
    local zellij_theme="catppuccin-mocha"
  else
    # Light mode
    export BAT_THEME="Catppuccin Latte"
    export COLORFGBG="0;15"
    local zellij_theme="catppuccin-latte"
  fi

  # Update Zellij config theme (only if not inside Zellij already)
  if [[ -z "$ZELLIJ" ]]; then
    local cfg="$HOME/.config/zellij/config.kdl"
    if [[ -f "$cfg" ]]; then
      sed -i '' 's/^theme "catppuccin-.*"/theme "'"$zellij_theme"'"/' "$cfg"
    fi
  fi
}
sync_terminal_theme

# Zellij (rodar manualmente com: zellij)
# eval "$(zellij setup --generate-auto-start zsh)"

# fzf shell integration
source <(fzf --zsh)

# --- Trocar tema do Ghostty manualmente ---
# Uso: theme dark | theme light | theme auto
theme() {
  local ghostty_cfg="$HOME/.config/ghostty/config"
  local zellij_cfg="$HOME/.config/zellij/config.kdl"

  case "$1" in
    dark)
      sed -i '' 's/^theme = .*/theme = Catppuccin Mocha/' "$ghostty_cfg"
      export BAT_THEME="Catppuccin Mocha"
      export COLORFGBG="15;0"
      [[ -f "$zellij_cfg" ]] && sed -i '' 's/^theme "catppuccin-.*"/theme "catppuccin-mocha"/' "$zellij_cfg"
      ;;
    light)
      sed -i '' 's/^theme = .*/theme = Catppuccin Latte/' "$ghostty_cfg"
      export BAT_THEME="Catppuccin Latte"
      export COLORFGBG="0;15"
      [[ -f "$zellij_cfg" ]] && sed -i '' 's/^theme "catppuccin-.*"/theme "catppuccin-latte"/' "$zellij_cfg"
      ;;
    auto)
      sed -i '' 's/^theme = .*/theme = light:Catppuccin Latte,dark:Catppuccin Mocha/' "$ghostty_cfg"
      sync_terminal_theme
      ;;
    *)
      echo "Uso: theme dark | theme light | theme auto"
      return 1
      ;;
  esac

  echo "Tema: $1 (Ghostty: Cmd+Shift+, para recarregar)"
}

# Aliases para ferramentas modernas
alias ls="lsd"
alias ll="lsd -la"
alias lt="lsd --tree --depth 2"
alias cat="bat"

# Starship prompt
eval "$(starship init zsh)"
