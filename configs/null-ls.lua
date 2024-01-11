local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  -- Python
  formatting.black,
  diagnostics.ruff,
  diagnostics.mypy,
  -- diagnostics.mypy.with({
  --   extra_args = { "--config-file", "mypy.ini" },
  -- }),
  -- diagnostics.mypy.with({
  --   extra_args = { "--config-file", "pyproject.toml" },
  -- }),

  -- webdev stuff
  -- formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  diagnostics.eslint,
  formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- prettier works only on these filetypes

  -- Lua
  formatting.stylua,

  -- cpp
  formatting.clang_format,
}

------------------------------------------------------------------------------
-- Avoiding LSP formatting conflicts
-- The recommended approach is to use the new vim.lsp.buf.format API, which
-- makes it easy to select which server you want to use for formatting.
------------------------------------------------------------------------------
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

local opts = {
  sources = sources,
  on_attach = on_attach,
}

return opts
