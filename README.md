# dotfiles

Configs pessoais para macOS.

## Conteudo

- `ghostty/config` — configuracao do terminal Ghostty
- `tmux/.tmux.conf` — tmux (prefix Ctrl+A, mouse, true color)
- `starship/starship.toml` — prompt Starship com Catppuccin Mocha
- `zsh/.zshrc` — shell config (starship, fzf, bat, lsd, tema auto)

## Instalacao

```bash
# 1. Instalar dependencias
brew install starship fzf lsd bat tmux

# 2. Clonar e instalar
git clone https://github.com/rfogagnolo/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh

# 3. Reiniciar o terminal
```

O script cria symlinks dos configs para os locais corretos. Alteracoes feitas nos arquivos originais ja refletem no repo.

## Sincronizar entre maquinas

```bash
# Na maquina que fez alteracoes
cd ~/dotfiles && git add -A && git commit -m "update configs" && git push

# Na outra maquina
cd ~/dotfiles && git pull
```
