# dotfiles

Configs pessoais para macOS.

## Conteudo

- `ghostty/config` — configuracao do terminal Ghostty
- `tmux/.tmux.conf` — configuracao do tmux (prefix Ctrl+A, mouse, true color)

## Instalacao

```bash
git clone git@github.com:rfogagnolo/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

O script cria symlinks dos configs para os locais corretos. Alteracoes feitas nos arquivos originais ja refletem no repo.

## Sincronizar entre maquinas

```bash
# Na maquina que fez alteracoes
cd ~/dotfiles && git add -A && git commit -m "update configs" && git push

# Na outra maquina
cd ~/dotfiles && git pull
```
