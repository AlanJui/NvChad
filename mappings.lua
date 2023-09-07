local M = {}

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

return M
