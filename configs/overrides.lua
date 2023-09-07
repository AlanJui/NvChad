local M = {}

M.treesitter = {
  ensure_installed = {
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
    -- "deno",
    "typescript-language-server",
    "css-lsp",
    "html-lsp",
    "eslint-lsp",
    "prettier",
    "js-debug-adapter",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -------------------------------------------------------------------
    -- Python
    -------------------------------------------------------------------
    "pyright", -- LSP Server
    "debugpy", -- Debugger
    "black", -- Formatter
    "mypy", -- Type checker
    "ruff", -- Linter
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
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
