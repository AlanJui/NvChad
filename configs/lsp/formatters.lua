local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    lua = { "stylua" },

    -- python = { "isort", "black", "djlint" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,

    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    sh = { "shfmt" },

    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  -- These options will be passed to conform.format()
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
}

require("conform").setup(options)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format {
    lsp_fallback = true,
    timeout_ms = 500,
  }
end, { desc = "Format file or selection" })
