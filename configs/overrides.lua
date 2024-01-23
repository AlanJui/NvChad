local M = {}

M.treesitter = {
  ensure_installed = {
    "python",
    "lua",
    "html",
    "http",
    "css",
    "javascript",
    "jsdoc",
    "json",
    "scss",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "toml",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- web dev stuff
    "typescript-language-server",
    "css-lsp",
    "html-lsp",
    "eslint-lsp",
    "prettier",
    "js-debug-adapter",
    "eslint_d", -- Linter
    -- c/cpp stuff
    "clangd",
    "clang-format",
    -- rust
    "rust-analyzer",
    -- Python
    "pyright", -- LSP Server
    "debugpy", -- Debugger
    "black", -- Formatter
    "mypy", -- Type checker
    "ruff", -- Linter
  },
}

-- git support in nvimtree
local icons = require "custom.icons"
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "<C-r>", api.tree.change_root_to_parent, opts "Up")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "l", api.node.open.preview, opts "Open Preview")
  -- vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
end

M.nvimtree = {
  on_attach = my_on_attach,
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore", ".env" },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    -- enable = false,
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-]>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<M-\\>",
    },
  },
  panel = {
    -- enable = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
}

return M
