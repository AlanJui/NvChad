local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lsp_config = require("lspconfig")

-- -- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "clangd" }
--
-- for _, lsp in ipairs(servers) do
--   lsp_config[lsp].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--   })
-- end

-- TypeScript LSP Server

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lsp_config.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
})

-- Python LSP Server
lsp_config.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  -- root_dir = lspconfig.util.root_pattern("project.toml"),
})

-- Lua
lsp_config.lua_ls.setup({
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
})
