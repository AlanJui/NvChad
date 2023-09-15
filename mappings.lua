local M = {}

-- local Utils = require("custom.utils")

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>D"] = "", -- LSP definition type
    ["<leader>ma"] = "",
    ["<leader>th"] = "", -- theme switcher
    ["<leader>ls"] = "", -- LSP signature help
    ["<leader>pt"] = "", -- Pick hidden term
    ["<leader>ra"] = "", -- LSP rename
    ["<leader>n"] = "", -- Toggle line number
    ["<leader>rn"] = "", -- Toggle relative number
    ["<leader>tn"] = "", -- +new terminal
  },
}

M.general = {
  n = {
    ---------------------------------------------------------------------------
    -- 常用指令
    ---------------------------------------------------------------------------
    ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>,"] = { ":Telescope buffers<CR>", "Show buffers" },
    ["<leader>e"] = { "<CMD> NvimTreeToggle live_grep <CR>", "Toggle NvimTree" },
    ["<leader><leader>"] = { "<c-^>", "Quick Switch 2 Buffers" }, -- Switch between 2 buffers
    ["<C-n>"] = { "<cmd> Telescope <CR>", "Telescope" },
    ["<C-s>"] = { ":Telescope Files <CR>", "Telescope Files" },
    -- Move lines
    ["<S-Down>"] = { ":m .+1<CR>gv=gv", "Move line down", opts = { nowait = true } },
    ["<S-Up>"] = { ":m .-2<CR>gv=gv", "Move line up", opts = { nowait = true } },
    -- Resize window using <Alt> arrow keys
    ["<A-Down>"] = { "<cmd>resize -2<CR>" },
    ["<A-Up>"] = { "<cmd>resize +2<CR>" },
    ["<A-Left>"] = { "<cmd>vertical resize -2<CR>" },
    ["<A-Right>"] = { "<cmd>vertical resize +2<CR>" },
    -- Menu Name
    ["gz"] = { "+surround" },
    ["]"] = { "+next" },
    ["["] = { "+prev" },
    ---------------------------------------------------------------------------
    -- Actions: 常用指令
    ---------------------------------------------------------------------------
    ["<leader>a"] = { "+actions" },
    ["<leader>ah"] = { ':let @/ = ""<CR>', "remove search highlight" },
    ["<leader>at"] = { ":set filetype=htmldjango<CR>", "set file type to django template" },
    ["<leader>aT"] = { ":set filetype=html<CR>", "set file type to HTML" },
    ["<leader>al"] = { ":set wrap!<CR>", "on/off line wrap" },
    -- line numbers
    ["<leader>an"] = { ":set nonumber!<CR>", "on/off line-numbers" },
    ["<leader>aN"] = { ":set norelativenumber!<CR>", "on/off relative line-numbers" },
    ["<leader>tn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ---------------------------------------------------------------------------
    -- Buffers
    ---------------------------------------------------------------------------
    ["<leader>b"] = { "+buffer" },
    ["<leader>bx"] = { "<CMD>bdelete<CR>", "Close Buffer" },
    ["<leader>bX"] = { "<CMD>bdelete!<CR>", "Close Buffer with force" },
    ["<leader>bl"] = { "<CMD>ls<CR>", "List Buffers" },
    ---------------------------------------------------------------------------
    -- Coding
    ---------------------------------------------------------------------------
    ["<leader>c"] = { "+code" },
    -- LSP
    ["<leader>ca"] = {
      "<CMD> lua vim.lsp.buf.range_code_action()<CR>",
      "Do Range CodeAction",
    },
    ["<leader>cr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename code" },
    ["<leader>cs"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show signature help" },
    -- Diagnostics
    ["<leader>cdd"] = { "<cmd> lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show line diagnostics" },
    ["<leader>cdp"] = { "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
    ["<leader>cdn"] = { "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
    ["<leader>cdl"] = { "<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>", "Set loclist" },
    -- Goto
    ["<leader>cgd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    ["<leader>cgD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
    ["<leader>cgr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    ["<leader>cgt"] = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Go to type definition",
    },
    ["<leader>cgi"] = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "Go to Implementation",
    },
    ---------------------------------------------------------------------------
    -- Debuggging
    ---------------------------------------------------------------------------
    ["<leader>d"] = { "+debug" },
    ---------------------------------------------------------------------------
    -- Finding
    ---------------------------------------------------------------------------
    ["<leader>f"] = { "+finding" },
    ---------------------------------------------------------------------------
    -- Git
    ---------------------------------------------------------------------------
    ["<leader>g"] = { "+git" },
    ["]g"] = {
      function()
        require("gitsigns").next_hunk()
      end,
      desc = "Next Git hunk",
    },
    ["[g"] = {
      function()
        require("gitsigns").prev_hunk()
      end,
      desc = "Previous Git hunk",
    },
    ["<leader>gl"] = { ":Git log<CR>", "List log with details" },
    ["<leader>gL"] = { ":Git log --oneline<CR>", "List log within one line" },
    ["<leader>gp"] = { ":Git push<CR>", "push" },
    ["<leader>gP"] = { ":Git pull<CR>", "pull" },
    ["<leader>gr"] = { ":GRemove<CR>", "remove" },
    ["<leader>gS"] = { ":Git<CR>", "status" },
    ["<leader>gT"] = {
      ':Git log --no-walk --tags --pretty="%h %d %s" --decorate=full<CR>',
      "List all tags in log",
    },
    ["<leader>gs"] = { "+Git Signs" },
    ["<leader>gsb"] = {
      function()
        require("gitsigns").blame_line()
      end,
      desc = "View Git blame",
    },
    ["<leader>gsB"] = {
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "View full Git blame",
    },
    ["<leader>gsp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview Git hunk",
    },
    ["<leader>gsh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Reset Git hunk",
    },
    ["<leader>gsr"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Reset Git buffer",
    },
    ["<leader>gss"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Stage Git hunk",
    },
    ["<leader>gsS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "Stage Git buffer",
    },
    ["<leader>gsu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      desc = "Unstage Git hunk",
    },
    ["<leader>gA"] = { ":Git add .<CR>", "add all" },
    ["<leader>gb"] = { ":Git blame<CR>", "blame" },
    ["<leader>gB"] = { ":GBrowse<CR>", "Browse GitHub repo" },
    ["<leader>gc"] = { ":Git commit<CR>", "commit" },
    ["<leader>gd"] = { "+Diff" },
    ["<leader>gds"] = {
      function()
        require("gitsigns").diffthis()
      end,
      desc = "View Git diff",
    },
    ["<leader>gdd"] = { ":Gvdiffsplit<CR>", "diff vsplit" },
    ["<leader>gdh"] = { ":Gdiffsplit<CR>", "diff split" },
    ["<leader>gdv"] = { ":Gvdiffsplit<CR>", "diff vsplit" },
    ["<leader>gdn"] = { ":Git diff<CR>", "Normal diff" },
    -- Gist
    -- ["<leader>gS"] = { "+Gist" },
    -- ["<leader>gSa"] = {":Gist -a", "post a gist anonymously" },
    -- ["<leader>gSb"] = {":Gist -b", "post gist browser" },
    -- ["<leader>gSd"] = { ":Gist -d<CR>", "delete gist" },
    -- ["<leader>gSe"] = { ":Gist -e<CR>", "edit gist" },
    -- ["<leader>gSl"] = { ":Gist -l<CR>", "list public gists" },
    -- ["<leader>gSs"] = { ":Gist -ls<CR>", "list starred gists" },
    -- ["<leader>gSm"] = { ":Gist -m<CR>", "post a gist with all open buffers" },
    -- ["<leader>gSp"] = { ":Gist -p<CR>", "post public gist" },
    -- ["<leader>gSP"] = { ":Gist -P<CR>", "post private gist" },
    ---------------------------------------------------------------------------
    -- Surround
    ---------------------------------------------------------------------------
    ["<leader>s"] = { "+surround" },
    ["<leader>sa"] = { "sa", "Add surrounding" },
    ["<leader>sd"] = { "sd", "Delete surrounding" },
    ["<leader>sr"] = { "sr", "Replace surrounding" },
    ["<leader>sh"] = { "sh", "Highlight surrounding" },
    ["<leader>sf"] = { "sf", "Find surrounding (to the right)" },
    ["<leader>sF"] = { "sf", "Find surrounding (to the left)" },
    ["<leader>sn"] = { "sn", "Update `n_lines`" },
    -- ["<leader>["] = { "l", "Suffix to search with `prev` method" },
    -- ["<leader>]"] = { "n", "Suffix to search with `next` method" },
    ---------------------------------------------------------------------------
    -- Toggle/Terminal
    ---------------------------------------------------------------------------
    ["<leader>t"] = { "+toggle/terminal" },
    ---------------------------------------------------------------------------
    -- Utilities
    ---------------------------------------------------------------------------
    ["<leader>u"] = { "+utilities" },
    -- Toggle Tab Characters
    ["<leader>uv"] = {
      "<cmd>lua _G.toggle_tab_chars()<CR>",
      "啟用／關閉：顯示 Tab 字符",
    },
    ---------------------------------------------------------------------------
    -- Windows/Workspace/WhichKey
    ---------------------------------------------------------------------------
    -- Window
    ["<leader>w"] = { "+windows/workspace" },
    -- split window
    ["<leader>w-"] = { "<cmd>split<cr>", "Horizontal Split" },
    ["<leader>w_"] = { "<cmd>vsplit<cr>", "Vertical Split" },
    ["<leader>w|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
    -- Move to window using the <ctrl> hjkl keys
    ["<leader>wf"] = { "Move Focus" },
    ["<leader>wfh"] = { "<C-w>h", "Move to Left Window" },
    ["<leader>wfj"] = { "<C-w>j", "Move to Down Window" },
    ["<leader>wfk"] = { "<C-w>k", "Move to Up Window" },
    ["<leader>wfl"] = { "<C-w>l", "Move to Right Window" },
    -- Resize window using <Alt> arrow keys
    ["<leader>ws"] = { "Resize Window" },
    ["<leader>ws<Up>"] = { "<cmd>resize -2<CR>", "Up Side" },
    ["<leader>ws<Down>"] = { "<cmd>resize +2<CR>", "Down Side" },
    ["<leader>ws<Left>"] = { "<cmd>vertical resize +2<CR>", "Left Side" },
    ["<leader>ws<Right>"] = { "<cmd>vertical resize -2<CR>", "Right Side" },
    -- Zoom-in/out window
    ["<leader>wi"] = { "<CMD>tabnew %<CR>", "Zoom-in" },
    ["<leader>wo"] = { "<CMD>tabclose<CR>", "Zoom-out" },
    ["<leader>wc"] = { "<CMD>close<CR>", "Close window" },
    ---------------------------------------------------------------------------
    -- Diagnostics/Quickfix
    ---------------------------------------------------------------------------
    ["<leader>x"] = { "+diagnostics/quickfix" },
  },

  i = {
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["kj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<S-Down>"] = { "<Esc>:m .+1<CR>", "Move line down", opts = { nowait = true } },
    ["<S-Up>"] = { "<Esc>:m .-2<CR>", "Move line up", opts = { nowait = true } },
  },

  v = {
    ["<"] = { "<gv", "Unindent", opts = { nowait = true } },
    [">"] = { ">gv", "Indent", opts = { nowait = true } },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move line down", opts = { nowait = true } },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move line up", opts = { nowait = true } },
    ["<S-Down>"] = { ":m '>+1<CR>gv=gv", "Move line down", opts = { nowait = true } },
    ["<S-Up>"] = { ":m '<-2<CR>gv=gv", "Move line up", opts = { nowait = true } },
  },

  t = {
    -- toggle in terminal mode
    ["<leader>t"] = { "+terminal" },
    ["<leader>ti"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "Toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "Toggle vertical term",
    },
  },
}

---------------------------------------------------------------------------
-- Build Tools
---------------------------------------------------------------------------

-- Build Tools
M.yabs = {
  plugin = true,
  n = {
    ["<leader>By"] = { "<cmd>lua require('yabs').run()<CR>", "Run Yabs" },
    ["<leader>Bc"] = { "<cmd>lua require('yabs').compile()<CR>", "Compile Yabs" },
    ["<leader>Bt"] = { "<cmd>lua require('yabs').test()<CR>", "Test Yabs" },
    ["<leader>Bd"] = { "<cmd>lua require('yabs').debug()<CR>", "Debug Yabs" },
  },
}

---------------------------------------------------------------------------
-- Coding
---------------------------------------------------------------------------

-- Outline
M.aerial = {
  plugin = true,
  n = {
    ["<leader>cot"] = { "<cmd>AerialToggle<cr>", "Toggle outline window" },
    ["<leader>coo"] = { "<cmd>AerialOpen<cr>", "Open outline window" },
    ["<leader>con"] = { "<cmd>AerialNext<CR>", "Jump forwards 1 symbols" },
    ["<leader>cop"] = { "<cmd>AerialPrev<CR>", "Jump backwards 1 symbols" },
  },
}

-- Splitting/Joining blocks of code
M.treesj = {
  plugin = true,
  n = {
    ["<leader>ctt"] = { "<cmd>lua require('treesj').toggle()<CR>", "Toggle node under cursor" },
    ["<leader>cts"] = { "<cmd>lua require('treesj').split()<CR>", "Split node under cursor" },
    ["<leader>ctj"] = { "<cmd>lua require('treesj').join()<CR>", "Join node under cursor" },
  },
}

---------------------------------------------------------------------------
-- Debugging
---------------------------------------------------------------------------
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
      "Toggle breakpoint",
    },
    ["<leader>dB"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition<cmd> '))<CR>",
      "Condition breakpoint",
    },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dR"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
    ["<leader>dO"] = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>dx"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>dQ"] = {
      "<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
      "Quit Nvim DAP",
    },
    -- Show contents in Variable when mouse pointer hover
    ["<leader>dh"] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    ["<leader>dS"] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Show/Hide Debug Sidebar" },
    ["<leader>dV"] = {
      "<cmd>lua local widgets=require'dap.ui.widgets'; widgets.centered_float(widgets.scopes)<CR>",
      "Use widgets to display the variables",
    },
    -- REPEL
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  },
}

---------------------------------------------------------------------------
-- Finding
---------------------------------------------------------------------------
M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>fe"] = { "<CMD> NvimTreeFocus <CR>", "Open File Explorer" },
    ["<leader>fec"] = { "<CMD> NvimTreeClose <CR>", "Close File Explorer" },
    ["<leader>fef"] = { "<CMD> NvimTreeFindFileToggle <CR>", "Toggle File Explorer Filter" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>,"] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
    ["<leader>fb"] = { "<CMD> Telescope file_browser <CR>", "File Browser" },
    ["<leader>fc"] = { "<CMD> Telescope command_history <CR>", "Command History" },
    ["<leader>fl"] = { "<CMD> Telescope luasnip <CR>", "LuaSnip Snippets" },
    ["<leader>fL"] = { "<CMD> Telescope lazy <CR>", "Plugins installed via lazy.nvim" },
    ["<leader>fg"] = { "<CMD> Telescope live_grep <CR>", "Live Grep" },
    ["<leader>fG"] = {
      "<cmd> lua require'telescope'.extensions.live_grep_args.live_grep_args() <CR>",
      "Live grep args picker",
    },
    ["<leader>fd"] = { "<CMD> Telescope diagnostics <CR>", "Diagnostics" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>fp"] = { "<cmd> lua require'telescope'.extensions.project.project{} <CR>", "Switch between Projects" },
    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
    -- theme switcher
    ["<leader>ut"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    -- code
    ["<leader>fD"] = { "<cmd>Telescope dap configurations<cr>", "DAP Config Picker" },
    ["<leader>fO"] = { "<cmd>Telescope aerial<cr>", "Code Outline" },
    -- Themes
    ["<leader>fT"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
  },
}

---------------------------------------------------------------------------
-- Git
---------------------------------------------------------------------------

M.gitsigns = {
  plugin = true,
  n = {
    ["]g"] = {
      function()
        require("gitsigns").next_hunk()
      end,
      "Next Git hunk",
    },
    ["[g"] = {
      function()
        require("gitsigns").prev_hunk()
      end,
      "Previous Git hunk",
    },
    ["<leader>gl"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "View Git blame",
    },
    ["<leader>gL"] = {
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      "View full Git blame",
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview Git hunk",
    },
    ["<leader>gh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset Git hunk",
    },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset Git buffer",
    },
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage Git hunk",
    },
    ["<leader>gS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage Git buffer",
    },
    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Unstage Git hunk",
    },
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "View Git diff",
    },
  },
}

---------------------------------------------------------------------------
-- Terminal
---------------------------------------------------------------------------

M.nvterm = {
  plugin = true,
  n = {
    -- toggle in normal mode
    ["<leader>ti"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "Toggle floating term",
    },
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "Toggle vertical term",
    },
    -- new
    ["<leader>tN"] = { "+new terminal" },
    ["<leader>tNh"] = {
      function()
        require("nvterm.terminal").new("horizontal")
      end,
      "New horizontal term",
    },
    ["<leader>tNv"] = {
      function()
        require("nvterm.terminal").new("vertical")
      end,
      "New vertical term",
    },
  },
}

---------------------------------------------------------------------------
-- Utilities
---------------------------------------------------------------------------

-- Markdown Preview
M.markdown_preview = {
  plugin = true,
  n = {
    ["<leader>um"] = { "+markdown" },
    ["<leader>ump"] = { "<cmd> MarkdownPreviewToggle<CR>", "Toggle MarkdownPreview" },
    ["<leader>umP"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
    ["<leader>umc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
  },
}

---------------------------------------------------------------------------
-- Diagnostics/Quickfix
---------------------------------------------------------------------------
M.trouble = {
  plugin = true,
  n = {
    -- Trouble
    ["<leader>xt"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },
    ["<leader>xr"] = {
      function()
        require("trouble").open("lsp_references")
      end,
      "LSP Reference (Trouble)",
    },
    ["[q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          vim.cmd.cprev()
        end
      end,
      "Previous trouble/quickfix item",
    },
    ["]q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          vim.cmd.cnext()
        end
      end,
      "Next trouble/quickfix item",
    },
  },
}

return M
