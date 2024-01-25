-- enable mason and configure icons
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  -- list of servers for mason to install
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    -- "pyright",
    -- "pylsp", -- "python-lsp-server"
    "ruff_lsp",
    "tsserver",
    "vuels",
    "html",
    "cssls",
    "tailwindcss",
    "emmet_ls",
    "jsonls",
    "lemminx",  -- xml ls
    "yamlls",
    "taplo",    -- toml ls
    "marksman", -- markdown ls
    "dockerls", -- docker ls
    -- "graphql",
    -- "prismals",
    -- "svelte",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

-- Debuggers
require("mason-nvim-dap").setup({
  -- A list of adapters to install if they're not already installed.
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {
    -- Update this to ensure that you have the debuggers for the langs you want
    "python",
    "js",
    "node2",
  },

  -- NOTE: this is left here for future porting in case needed
  -- Whether adapters that are set up (via dap) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Daps are not automatically installed.
  --   - true: All adapters set up via dap are automatically installed.
  --   - { exclude: string[] }: All adapters set up via mason-nvim-dap, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "python", "delve" } }
  automatic_installation = true,

  -- See below on usage
  handlers = nil,
})