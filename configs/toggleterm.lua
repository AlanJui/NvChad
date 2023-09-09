require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  ---@diagnostic disable-next-line: unused-local
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  ---@diagnostic disable-next-line: unused-local
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _G.lazygit_toggle()
  lazygit:toggle()
end

vim.cmd([[
      " set
      autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

      " By applying the mappings this way you can pass a count to your
      " mapping to open a specific window.
      " For example: 2<C-t> will open terminal 2
      nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
      inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
      ]])

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
