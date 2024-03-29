local icons = require "custom.icons"
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

for name, sign in pairs(icons.dap) do
  sign = type(sign) == "table" and sign or { sign }
  vim.fn.sign_define("Dap" .. name, {
    text = sign[1],
    texthl = sign[2] or "DiagnosticInfo",
    linehl = sign[3],
    numhl = sign[3],
  })
end
