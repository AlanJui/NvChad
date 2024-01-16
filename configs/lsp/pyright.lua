local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  root_dir = require("lspconfig").util.root_pattern "pyproject.toml",
}

return options
