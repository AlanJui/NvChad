-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = {
    fg = "green",
    bold = true,
  },
  LspReferenceWrite = {
     underline = true,
     bg = "green",
  },
  LspReferenceRead = {
     underline = true,
     bg = "green",
  },
  LspReferenceText = {
     underline = true,
     bg = "green",
  },
  -- Fix comment too dark and hard to read
  Comment = { fg = "#999999" },
}

return M
