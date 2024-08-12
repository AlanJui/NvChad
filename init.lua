-- vscode format i.e json files
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/my_snippets"

local opt = vim.opt
local set = vim.opt -- global options
-- local cmd = vim.cmd -- execute Vim commands
-- local exec = vim.api.nvim_exec -- execute Vimscript

-- -----------------------------------------------
-- options
-- -----------------------------------------------
set.wrap = false -- don't automatically wrap on load
set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line

-- -----------------------------------------------
opt.colorcolumn = "80"
-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
-- Disable swap file
opt.swapfile = false
opt.backup = false
opt.writebackup = false
-- Folding
opt.foldcolumn = "1"
opt.foldlevel = 99 --- Using ufo provider need a large value
opt.foldlevelstart = 99 --- Expand all folds by default
opt.foldenable = true --- Use spaces instead of tabs
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- -----------------------------------------------
-- 啟用／關閉：顯示 Tab 控制字元
-- -----------------------------------------------
-- 初始狀態
vim.g.tab_char_state = 0

-- 切換控制字元設置的函數
function _G.toggle_tab_chars()
  if vim.g.tab_char_state == 0 then
    vim.g.tab_char_state = 1
    vim.opt.list = true
    vim.opt.listchars = "tab:»·,trail:╳"
  elseif vim.g.tab_char_state == 1 then
    vim.g.tab_char_state = 2
    vim.opt.listchars = "eol:↵,tab:»·,trail:╳,extends:»,precedes:«"
  else
    vim.g.tab_char_state = 0
    vim.opt.list = false
    vim.opt.listchars = ""
  end
end

-- 設置快捷鍵
vim.cmd [[
  set list
  command! ToggleTabDisplay lua _G.toggle_tab_chars()
]]
vim.api.nvim_set_keymap("n", "<leader>v", ":ToggleTabDisplay<CR>", { noremap = true, silent = true })

-------------------------------------------------
-- 針對 Markdown 文件的設置
-------------------------------------------------:
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.shiftwidth = 8
    vim.opt.tabstop = 8
    vim.opt.softtabstop = 8
  end,
})

-------------------------------------------------
local home_dir = os.getenv "HOME"
local PYTHON_VERSION = "3.12.1"
-------------------------------------------------
vim.g.loaded_python2_provider = 0
vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = home_dir .. "/.pyenv/versions/" .. PYTHON_VERSION .. "/bin/python"

vim.g.loaded_node_provider = 1
vim.g.node_host_prog = home_dir .. "/n/bin/neovim-node-host"

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-------------------------------------------------
-- 設置剪貼板
-------------------------------------------------
vim.cmd [[
  set clipboard+=unnamedplus
]]

-- vim.g.clipboard = {
--   name = "win32yank-wsl",
--   copy = {
--     ["+"] = "win32yank.exe -i --crlf",
--     ["*"] = "win32yank.exe -i --crlf",
--   },
--   paste = {
--     ["+"] = "win32yank.exe -o --lf",
--     ["*"] = "win32yank.exe -o --lf",
--   },
--   cache_enabled = 0,
-- }
-------------------------------------------------
-- 關掉英文拼字檢查
-------------------------------------------------
-- vim.opt.spell = false
-- vim.cmd [[
--   set spelllang=en_us,cjk
-- ]]
local spell_group = vim.api.nvim_create_augroup("spell_group", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "go", },
  command = "setlocal spell spelllang=en_us,cjk",
  group = spell_group,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "yaml" },
  command = "setlocal nospell",
  group = spell_group,
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*", -- disable spellchecking in the embeded terminal
  command = "setlocal nospell",
  group = spell_group,
})
-------------------------------------------------
-- 避免 Toggle Terminal 被 whcih_key 插入干擾
-------------------------------------------------
vim.cmd [[
  autocmd TermOpen * setlocal nonumber norelativenumber | setlocal signcolumn=no | setlocal winhl=Normal:Normal
  autocmd TermOpen * lua vim.b.which_key_ignore = true
]]
-- 禁用 `toggleterm` 终端中的空格键触发
vim.cmd [[
  autocmd TermOpen term://*toggleterm#* lua vim.b.which_key_ignore = true
]]
