local overrides = require("custom.configs.overrides")
local Util = require("custom.utils")

-- Config IndentBlanklineIndent
vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
vim.o.spell = true

local plugins = {
  ----------------------------------------------------------------------------
  -- Core
  ----------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "aaronhallaert/advanced-git-search.nvim",
      "ahmedkhalf/project.nvim",
      "benfowler/telescope-luasnip.nvim",
      "cljoly/telescope-repo.nvim",
      "olacin/telescope-cc.nvim",
      "stevearc/aerial.nvim",
      "tsakirist/telescope-lazy.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
        config = function()
          require("telescope").load_extension("frecency")
        end,
      },
    },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings("telescope")
    end,
    config = function()
      require("custom.configs.telescope")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    config = function()
      require("core.utils").load_mappings("trouble")
    end,
  },
  ----------------------------------------------------------------------------
  -- LSP
  ----------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "js-debug-adapter",
        "prettier",
        "typescript-language-server",
        "lua_ls",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.formatter"
  --   end,
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function()
  --     require "custom.configs.lint"
  --   end,
  -- },
  ----------------------------------------------------------------------------
  -- Auto-completion
  ----------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = overrides.copilot,
  },
  ----------------------------------------------------------------------------
  -- Editting
  ----------------------------------------------------------------------------
  -- Surround
  { "echasnovski/mini.nvim", version = false },
  {
    "echasnovski/mini.surround",
    version = false,
    lazy = false,
    config = function()
      require("mini.surround").setup({
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method       mappings = {
      })
    end,
  },
  -- A code outline window for skimming and quick navigation
  {
    "stevearc/aerial.nvim",
    keys = {
      --stylua: ignore
      { "<leader>o", "<CMD>AerialToggle<CR>", desc = "Toggle the Aerial Window", },
      { "<leader>to", "<CMD>AerialToggle<CR>", desc = "Toggle the Aerial Window" },
      { "}", "<CMD>AerialNext<CR>", desc = "Jump forwards 1 symbol" },
      { "{", "<CMD>AerialPrev<CR>", desc = "Jump backwards 1 symbol" },
    },
    config = true,
  },
  -- Splitting/Joining blocks of code
  {
    "Wansmer/treesj",
    dependices = { "nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Toggle Split/Join Block" },
      { "<leader>tj", "<cmd>TSJToggle<cr>", desc = "Toggle Join Block" },
      { "<leader>ts", "<cmd>TSJToggle<cr>", desc = "Toggle Split Block" },
      { "<leader>cj", "<cmd>TSJJoin<cr>", desc = "Join Block" },
      { "<leader>cs", "<cmd>TSJSplit<cr>", desc = "Split Block" },
    },
    config = function()
      require("treesj").setup({})
      require("core.utils").load_mappings("treesj")
    end,
  },
  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },
  ----------------------------------------------------------------------------
  -- Coding
  ----------------------------------------------------------------------------
  -- Auto close brackets
  {
    "m4xshen/autoclose.nvim",
    event = "BufEnter",
    config = function()
      require("autoclose").setup()
    end,
  },
  -- Terminal
  {
    "NvChad/nvterm",
    init = function()
      require("core.utils").load_mappings("nvterm")
    end,
    config = function(_, opts)
      require("base46.term")
      require("nvterm").setup(opts)
      require("core.utils").load_mappings("nvterm")
    end,
  },
  -- ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { [[<C-t>]] },
      {
        "<leader>0",
        "<cmd>2ToggleTerm<cr>",
        desc = "Terminal #2",
      },
    },
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = 20,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      shading_factor = "0.3", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      direction = "float",
      shell = vim.o.shell,
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
    },
    config = function()
      require("custom.configs.toggleterm")
    end,
  },
  -- Build Code
  {
    "pianocomposer321/yabs.nvim",
    config = function()
      require("custom.configs.yabs")
      require("core.utils").load_mappings("yabs")
    end,
  },
  ----------------------------------------------------------------------------
  -- UI
  ----------------------------------------------------------------------------
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- UFO folding
  {
    {
      "kevinhwang91/nvim-ufo",
      dependencies = {
        "kevinhwang91/promise-async",
        {
          "luukvbaal/statuscol.nvim",
          config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
              relculright = true,
              segments = {
                { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                { text = { "%s" }, click = "v:lua.ScSa" },
                { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
              },
            })
          end,
        },
      },
      event = "BufReadPost",
      opts = {
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      },
      init = function()
        vim.keymap.set("n", "zR", function()
          require("ufo").openAllFolds()
        end)
        vim.keymap.set("n", "zM", function()
          require("ufo").closeAllFolds()
        end)
      end,
    },
    -- Folding preview, by default h and l keys are used.
    -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
    -- On second press the preview will be closed and fold will be opened.
    -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
    {
      "anuvyklack/fold-preview.nvim",
      dependencies = "anuvyklack/keymap-amend.nvim",
      config = true,
    },
  },
  ----------------------------------------------------------------------------------------------------------
  -- Git
  ----------------------------------------------------------------------------------------------------------
  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      {
        "<leader>ug",
        function()
          Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false })
        end,
        desc = "Lazygit (root dir)",
      },
      {
        "<leader>uG",
        function()
          Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
        end,
        desc = "Lazygit (cwd)",
      },
    },
  },
  -- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    opts = {
      integrations = {
        diffview = true,
      },
      disable_commit_confirmation = true,
    },
    config = function()
      require("custom.configs.neogit")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
      end,
    },
    -- config = function()
    --   require("custom.configs.gitsigns")
    -- end,
  },
  -- Git Diff View
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function()
      require("custom.configs.diffview")
    end,
  },
  -- Git commands in nvim
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  -- Fugitive-companion to interact with github
  {
    "tpope/vim-rhubarb",
    lazy = false,
  },
  -- Add git related info in the signs columns and popups
  {
    "lewis6991/gitsigns.nvim",
    dependicies = { "nvim-lua/plenary.nvim" },
  },
  -- for creating gist
  -- Personal Access Token: ~/.gist-vim
  -- token XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  {
    "mattn/vim-gist",
    lazy = false,
    dependicies = "mattn/webapi-vim",
  },
  ----------------------------------------------------------------------------
  -- Markdown
  ----------------------------------------------------------------------------
  {
    -- PlantUML syntax highlighting
    {
      "aklt/plantuml-syntax",
      lazy = false,
      ft = { "plantuml" },
      keys = {
        { "<leader>up", "+PlantUML" },
        { "<leader>upu", "<cmd>PlantumlOpen<cr>", desc = "Open PlantUML Preview" },
        { "<leader>ups", "<cmd>PlantumlSave<cr>", desc = "Save PlantUML Preview" },
        { "<leader>upt", "<cmd>PlantumlToggle<cr>", desc = "Toggle PlantUML Preview" },
        { "<leader>tp", "<cmd>PlantumlToggle<cr>", desc = "Toggle PlantUML Preview" },
      },
    },
    -- provides support to mermaid syntax files (e.g. *.mmd, *.mermaid)
    {
      "mracos/mermaid.vim",
      lazy = false,
      ft = { "mermaid", "markdown" },
    },
    -- Markdown Syntax Highlighting
    -- URL: https://github.com/preservim/vim-markdown
    {
      "preservim/vim-markdown",
      config = function()
        -- 變更預設：文件內容毋需折疊
        vim.g.vim_markdown_folding_disabled = 1
        -- vim.g.markdown_fenced_languages = {
        --   "html",
        --   "python",
        --   "bash=sh",
        -- }
        -- disabling conceal for code fences
        -- vim.g.markdown_conceal_code_blocks = 0
      end,
    },
    -- Live server
    {
      "turbio/bracey.vim",
      build = "npm install --prefix server",
    },
    -- Open URI with your favorite browser from Neovim
    {
      "tyru/open-browser.vim",
      lazy = true,
      ft = { "plantuml", "markdown", "html" },
    },
    -- Preview markdown file
    {
      "iamcco/markdown-preview.nvim",
      lazy = false,
      enable = true,
      ft = { "markdown" },
      cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
      build = "cd app && yarn install",
      keys = {
        { "<leader>um", "+MarkDown" },
        { "<leader>umP", "<cmd> MarkdownPreview<CR>", desc = "Open Preview" },
        { "<leader>umc", "<cmd> MarkdownPreviewStop<CR>", desc = "Close Preview" },
        { "<leader>ump", "<cmd> MarkdownPreviewToggle<CR>", desc = "Toggle MarkdownPreview" },
        { "<leader>tm", "<cmd> MarkdownPreviewToggle<CR>", desc = "Toggle MarkdownPreview" },
      },
      init = function()
        -- 以下這選項，千萬不要設定，否則會造成無法正常預覽
        -- vim.g.mkdp_browserfunc = "open"
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_start = true
        vim.g.mkdp_auto_close = true
        vim.g.mkdp_open_ip = "127.0.0.1"
        vim.g.mkdp_port = "9999"
        vim.g.mkdp_browser = ""
        vim.g.open_to_the_world = false
        vim.g.mkdp_echo_preview_url = true
        vim.g.mkdp_page_title = "${name}"
        vim.g.mkdp_preview_options = {
          mkit = {},
          katex = {},
          uml = {},
          maid = {},
          disable_sync_scroll = 0,
          sync_scroll_type = "middle",
          hide_yaml_meta = 1,
          sequence_diagrams = {},
          flowchart_diagrams = {},
          content_editable = false,
          disable_filename = 0,
          toc = {},
        }
        vim.g.mkdp_markdown_css = ""
        vim.g.mkdp_highlight_css = ""
      end,
      -- config = function()
      --   require("core.utils").load_mappings("markdown_preview")
      -- end,
    },
    -- PlantUML
    {
      "weirongxu/plantuml-previewer.vim",
      ft = { "plantuml" },
      dependices = {
        {
          -- Open URI with your favorite browser from Neovim
          "tyru/open-browser.vim",
          -- PlantUML syntax highlighting
          "aklt/plantuml-syntax",
          -- provides support to mermaid syntax files (e.g. *.mmd, *.mermaid)
          "mracos/mermaid.vim",
        },
      },
      cmd = { "PlantumlOpen", "PlantumlSave", "PlantumlToggle" },
      config = function()
        vim.g.my_jar_path = vim.fn.stdpath("data") .. "/lazy/plantuml-previewer.vim/lib/plantuml.jar"
        vim.cmd([[
          autocmd FileType plantuml let g:plantuml_previewer#plantuml_jar_path = g:my_jar_path
          let g:plantuml_previewer#save_format = "png"
          let g:plantuml_previewer#debug_mode = 1
        ]])
      end,
    },
  },
  ----------------------------------------------------------------------------
  -- DAP
  ----------------------------------------------------------------------------
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "jbyuki/one-small-step-for-vimkind",
      "mxsdev/nvim-dap-vscode-js",
      -- build debugger from source
      {
        "microsoft/vscode-js-debug",
        -- version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
    },
    config = function()
      -- Setup DAP Environment
      require("custom.configs.dap")
      -- Setup DAP for JS/TS
      require("custom.configs.dap.adapters.js").setup()
      -- Load keymappings for DAP
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        -- dapui.open()
        dapui.open({ reset = true })
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  -- DAP for Lua work in Neovim
  {
    "jbyuki/one-small-step-for-vimkind",
    keys = {
      {
        "<leader>daL",
        function()
          require("osv").launch({ port = 8086 })
        end,
        desc = "Start Lua Debugger Server",
      },
      {
        "<leader>dal",
        function()
          require("osv").run_this()
        end,
        desc = "Launch Lua Code",
      },
    },
    config = function()
      require("custom.configs.dap.adapters.nlua")
    end,
  },
  -- DAP for Python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      {
        "<leader>daP",
        function()
          require("dap-python").test_method()
        end,
        desc = "Start Python Debugger Server",
      },
      {
        "<leader>dap",
        function()
          require("dap-python").test_class()
        end,
        desc = "Launch Python Code",
      },
    },
    config = function(_, _)
      require("custom.configs.dap.adapters.python")
    end,
  },
  -- DAP for Node.js (nvim-dap adapter for vscode-js-debug)
  -- { -- Debugger
  --   "microsoft/vscode-js-debug",
  --   -- build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  --   build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
  -- },
  -- { -- Plugin
  --   "mxsdev/nvim-dap-vscode-js",
  --   config = function()
  --     require("custom.configs.dap.adapters.js").setup()
  --   end,
  -- },
  -------------------------------------------------------------------------------
  -- Tools
  -------------------------------------------------------------------------------
  -- File Manager
  {
    "vifm/vifm.vim",
    lazy = false,
    cmd = { "Vifm", "VifmOpen", "VifmTabOpen", "VifmSplitOpen", "VifmVsplitOpen" },
    keys = {
      {
        "<leader>uv",
        function()
          vim.cmd("Vifm")
        end,
        desc = "Open Vifm",
      },
    },
  },
  -- Todo matches on any text that starts with one of your defined keywords (or alt)
  -- followed by a colon:
  --
  --  TODO: do something
  --  FIX: this should be fixed
  --  HACK: weird code warning
  --
  --Todos are highlighted in all regular files.
  -------------------------------------------------------------------------------
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>sT", "<cmd>TodoTelescope<cr>", desc = "Find Todo" },
    },
  },
}

return plugins
