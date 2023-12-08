# 安裝指引

## 安裝 NvChad

```
git clone https://github.com/NvChad/NvChad ~/.config/nvchad --depth 1 && nvim
```

## 安裝個人 Neovim Configuration

```
git clone git@github.com:AlanJui/NvChad.git ~/.config/nvchad/lua/custom
```

## 設定執行檔

```sh
mkdir -p ~/.local/bin
touch ~/.local/bin/nvchad
chmod u+x ~/.local/bin/nvchad
```

`~/.local/bin/nvchad`

```sh
#!/bin/sh
# export DEBUG=true

export NVIM_APPNAME="nvchad"
NVIM_APPNAME="$NVIM_APPNAME" nvim "$@"
```
