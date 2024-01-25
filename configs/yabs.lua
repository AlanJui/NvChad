local yabs = require "yabs"
-- local telescope = require "telescope"

local lua_config = {
  tasks = {
    run = {
      command = "lua %",
      type = "shell",
      output = "terminal",
    },
  },
}

local python_config = {
  default_task = "run",
  tasks = {
    build = { command = "python %", output = "terminal" },
    run = { command = "python %", output = "terminal" },
    lint = { command = "pylint %", output = "terminal" },
  },
}

yabs:setup {
  languages = {
    lua = lua_config,
    python = python_config,
  },
  tasks = {
    build = { command = "echo building project...", output = "terminal" },
    run = { command = "echo running project...", output = "echo" },
    optional = {
      command = "echo runs on condition",
      condition = require("yabs.conditions").file_exists "filename.txt",
    },
  },
  opts = {
    output_types = { quickfix = { open_on_run = "always" } },
  },
}

-- telescope.load_extension("yabs")
