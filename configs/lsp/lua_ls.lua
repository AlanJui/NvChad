local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "hs" },
        disable = {
          "lowercase-global",
          "unused-local",
          "missing-fields",
          "undefined-doc-name",
          "assign-type-mismatch",
        },
      },
    },
  },
}

return options
