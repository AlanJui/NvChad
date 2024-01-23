require "plugins.configs.lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lsp_config = require "lspconfig"
local util = lsp_config.util

-- if you just want default config for the servers then put them in a table
local servers = {
  "css-lsp",
  "html-lsp",
  "eslint-lsp",
  "prettier",
  "js-debug-adapter",
  "clangd",
  "clang-format",
  "rust-analyzer",
}
for _, lsp in ipairs(servers) do
  lsp_config[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Python LSP Server
lsp_config.pyright.setup(require "custom.configs.lsp.pyright")

-- TypeScript LSP Server
lsp_config.tsserver.setup(require "custom.configs.lsp.tsserver")

-- Rust LSP Server
lsp_config.rust_analyzer.setup(require "custom.configs.lsp.rust-tools")
