# 安裝指引

## 將 NvChad 當作預設的 Neovim

### 安裝 NvChad

```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

### 安裝個人 Neovim Configuration

```
git clone git@github.com:AlanJui/NvChad.git ~/.config/nvim/lua/custom
```


## 令 NvChad 擁有獨立的 Neovim 作業環境

### 安裝 NvChad

```
git clone https://github.com/NvChad/NvChad ~/.config/nvchad --depth 1 
```

### 安裝個人 Neovim Configuration

```
git clone git@github.com:AlanJui/NvChad.git ~/.config/nvchad/lua/custom
```

### 設定執行檔

```sh
sudo touch /usr/local/bin/nvchad
sudo chmod 775 /usr/local/bin/nvchad
```

`sudo nano /usr/local/bin/nvchad`

```sh
#!/bin/sh
# export DEBUG=true

export NVIM_APPNAME="nvchad"
NVIM_APPNAME="$NVIM_APPNAME" nvim "$@"
```
