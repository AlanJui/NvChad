require "plugins.configs.lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lsp_config = require "lspconfig"
local util = lsp_config.util

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd" }
for _, lsp in ipairs(servers) do
  lsp_config[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Lua LSP Server
lsp_config.lua_ls.setup(require "custom.configs.lsp.lua_ls")

-- Python LSP Server
lsp_config.pyright.setup(require "custom.configs.lsp.pyright")

-- TypeScript LSP Server
lsp_config.tsserver.setup(require "custom.configs.lsp.tsserver")

-- Rust LSP Server
lsp_config.rust_analyzer.setup(require "custom.configs.lsp.rust-tools")

-- lsp_config.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "lua" },
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim", "hs" },
--         disable = {
--           "lowercase-global",
--           "unused-local",
--           "missing-fields",
--           "undefined-doc-name",
--           "assign-type-mismatch",
--         },
--       },
--     },
--   },
-- }
--
-- lsp_config.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
--   root_dir = lsp_config.util.root_pattern "pyproject.toml",
-- }
--
-- local function organize_imports()
--   local params = {
--     command = "_typescript.organizeImports",
--     arguments = { vim.api.nvim_buf_get_name(0) },
--   }
--   vim.lsp.buf.execute_command(params)
-- end
--
-- lsp_config.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
--   init_options = {
--     preferences = {
--       disableSuggestions = true,
--     },
--   },
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports",
--     },
--   },
-- }
