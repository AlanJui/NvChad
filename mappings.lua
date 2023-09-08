local M = {}

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
    ["<leader>fl"] = { "<CMD> Telescope live_grep <CR>", "Live Grep" },
    ["<leader>fd"] = { "<CMD> Telescope diagnostics <CR>", "Diagnostics" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
    -- theme switcher
    ["<leader>ut"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
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
    ["<leader>tn"] = { "+new terminal" },
    ["<leader>tnh"] = {
      function()
        require("nvterm.terminal").new("horizontal")
      end,
      "New horizontal term",
    },
    ["<leader>tnv"] = {
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
