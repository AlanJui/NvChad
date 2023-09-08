local dap = require("dap")
if not dap then
  print("dap is not loaded!")
  return
end

-----------------------------------------------------------
local icons = require("custom.icons")
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

-----------------------------------------------------------
-- Setup JS/TS Debugging
-----------------------------------------------------------
-- -- setup adapter
-- require("dap-vscode-js").setup({
--   debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
--   -- debugger_cmd = { "js-debug-adapter" },
--   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
--   -- log_file_path = os.getenv("HOME") .. "/.cache/dap_vscode_js.log", -- Path for file logging
--   -- log_file_level = true, -- Logging level for output to file. Set to false to disable file logging.
--   -- log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
-- })
--
-- for _, language in ipairs({ "typescript", "javascript" }) do
--   dap.configurations[language] = {
--     -- attach to a node process that has been started with
--     -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
--     -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
--     {
--       -- use nvim-dap-vscode-js's pwa-node debug adapter
--       type = "pwa-node",
--       -- attach to an already running node process with --inspect flag
--       -- default port: 9222
--       request = "attach",
--       -- allows us to pick the process using a picker
--       processId = require("dap.utils").pick_process,
--       -- name of the debug action you have to select for this config
--       name = "Attach debugger to existing `node --inspect` process",
--       -- for compiled languages like TypeScript or Svelte.js
--       sourceMaps = true,
--       -- resolve source maps in nested locations while ignoring node_modules
--       resolveSourceMapLocations = {
--         "${workspaceFolder}/**",
--         "!**/node_modules/**",
--       },
--       -- path to src in vite based projects (and most other projects as well)
--       cwd = "${workspaceFolder}/src",
--       -- we don't want to debug code inside node_modules, so skip it!
--       skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
--     },
--     {
--       type = "pwa-chrome",
--       name = "Launch Chrome to debug client",
--       request = "launch",
--       url = "http://localhost:5173",
--       sourceMaps = true,
--       protocol = "inspector",
--       port = 9222,
--       webRoot = "${workspaceFolder}/src",
--       -- skip files from vite's hmr
--       skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
--     },
--     -- only if language is javascript, offer this debug action
--     language == "javascript"
--         and {
--           -- use nvim-dap-vscode-js's pwa-node debug adapter
--           type = "pwa-node",
--           -- launch a new process to attach the debugger to
--           request = "launch",
--           -- name of the debug action you have to select for this config
--           name = "Launch file in new node process",
--           -- launch current file
--           program = "${file}",
--           cwd = "${workspaceFolder}",
--         }
--       or nil,
--   }
-- end
