local overrides = require("custom.configs.overrides")

local custom_opts = {
  defaults = {
    mappings = {},
  },
  extensions_list = {
    "themes",
    "terms",
    "luasnip",
    "file_browser",
    "ui-select",
    "project",
    "aerial",
    "frecency",
    "live_grep_args",
    "conventional_commits",
    "lazy",
    "yabs",
  },
}

dofile(vim.g.base46_cache .. "telescope")
local telescope = require("telescope")

-- load options and setup
local base_opts = require("plugins.configs.telescope")
local opts = vim.tbl_deep_extend("force", base_opts, custom_opts)
-- print(vim.inspect(opts))
telescope.setup(opts)

-- load extensions
for _, ext in ipairs(opts.extensions_list) do
  telescope.load_extension(ext)
end

-- load keymappings
require("core.utils").load_mappings("telescope")
