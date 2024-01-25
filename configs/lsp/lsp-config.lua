require "plugins.configs.lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = lspconfig.util

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
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim", "hs" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}

-- configure rust server with plugin
lspconfig["rust_analyzer"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
}

-- configure python server with plugin
lspconfig["ruff_lsp"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    },
  },
}

-- configure python server
-- lspconfig["pyright"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- configure python server with plugin
-- lspconfig["pylsp"].setup({
--   settings = {
--     pylsp = {
--       pycodestyle = {
--         ignore = { "W391" },
--         maxLineLength = 100,
--       },
--     },
--   },
-- })

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

-- configure css server
lspconfig["cssls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure tailwindcss server
lspconfig["tailwindcss"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
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

-- configure yaml server
lspconfig["yamlls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "yaml",
    "yaml.docker-compose",
  },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        -- ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        -- ["/path/from/root/of/project"] = "/.github/workflows/*",
      },
    },
  },
}

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
