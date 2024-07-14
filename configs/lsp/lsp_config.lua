local utils = require "core.utils"

local on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  -- if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
  --   client.server_capabilities.semanticTokensProvider = nil
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "cssls", -- css-lsp
  "tailwindcss", -- tailwindcss-lsp
  "eslint", -- eslint-lsp
  "taplo", -- toml-lsp
  "dockerls", -- docker-lsp
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig["lua_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig["clangd"].setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
}

-- configure python ls
lspconfig["pylsp"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    pylsp = {
      pycodestyle = {
        ignore = { "W391" },
        maxLineLength = 100,
      },
    },
  },
}

-- configure typescript server with plugin
lspconfig["tsserver"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure vue server with plugin
lspconfig["vuels"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure emmet language server
lspconfig["emmet_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "html",
    "htmldjango",
    "typescriptreact",
    "javascriptreact",
    "vue",
    "css",
    "sass",
    "scss",
    "less",
    "svelte",
  },
}

-- configure html server
lspconfig["html"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "html",
    "htmldjango",
  },
}

-- configure json server
lspconfig["jsonls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "json",
    "jsonc",
  },
}

-- configure xml server
lspconfig["lemminx"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
}

-- -- configure yaml server
-- lspconfig["yamlls"].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = {
--     "yaml",
--     "yaml.docker-compose",
--   },
--   settings = {
--     yaml = {
--       schemas = {
--         ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
--         -- ["../path/relative/to/file.yml"] = "/.github/workflows/*",
--         -- ["/path/from/root/of/project"] = "/.github/workflows/*",
--       },
--     },
--   },
-- }
--
-- configure toml server
lspconfig["taplo"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure docker server
lspconfig["dockerls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure markdown server
lspconfig["marksman"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "markdown",
    "markdown.mdx",
  },
}

-- configure lua server (with special settings)
-- lspconfig["lua_ls"].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = { -- custom settings for lua
--     Lua = {
--       -- make the language server recognize "vim" global
--       diagnostics = {
--         globals = { "vim", "hs" },
--       },
--       workspace = {
--         -- make language server aware of runtime files
--         library = {
--           [vim.fn.expand "$VIMRUNTIME/lua"] = true,
--           [vim.fn.stdpath "config" .. "/lua"] = true,
--         },
--       },
--     },
--   },
-- }

-- configure python ls
-- lspconfig["ruff_lsp"].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {},
--     },
--   },
-- }

-- configure rust server with plugin
-- lspconfig["rust_analyzer"].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     ["rust-analyzer"] = {
--       diagnostics = {
--         enable = false,
--       },
--     },
--   },
-- }

-- configure python server
-- lspconfig["pyright"].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- }
