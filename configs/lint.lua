require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  python = { "pylint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({
  "BufWritePost",
  "BufEnter",
  "InsertLeave",
}, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
  require("lint").try_lint()
end, { desc = "Lint file" })
