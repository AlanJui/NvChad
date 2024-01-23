local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    python = { "isort", "black" },
    -- python = function(bufnr)
    --   if require("conform").get_formatter_info("ruff_format", bufnr).available then
    --     return { "ruff_format" }
    --   else
    --     return { "isort", "black" }
    --   end
    -- end,

    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },

    sh = { "shfmt" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  -- These options will be passed to conform.format()
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

require("conform").setup(options)

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  }
end, { desc = "Format file or selection" })
