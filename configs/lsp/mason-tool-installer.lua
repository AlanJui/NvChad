-- Linters and Formatters
require("mason-tool-installer").setup({
  ensure_installed = {
    -- lua stuff
    "stylua",
    -- web dev stuff
    "prettier",     -- Formatter
    "eslint_d",     -- JavaScript Linter
    -- c/cpp stuff
    "clang-format", -- Formatter
    -- Python
    "isort",        -- Formatter
    "black",        -- Formatter
    "pylint",       -- Linter
    "ruff",         -- Linter
    "mypy",         -- Type checker
  },
})
