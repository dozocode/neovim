local lspconfigutil = require("lspconfig.util")

return {
  -- Quickstart configurations for the LSP client.
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Is used to manage global and project local settings.
      { "folke/neoconf.nvim",      cmd = "Neoconf", config = true },

      -- Is used to display LSP progress.
      { "j-hui/fidget.nvim",       config = true },

      -- Provides incremental LSP renaming based on Neovim’s command-preview feature.
      { "smjonas/inc-rename.nvim", config = true },

      -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
      "williamboman/mason.nvim",

      -- Bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
      "williamboman/mason-lspconfig.nvim",

      -- Bridges "mason.nvim" with "null-ls" for Neovim convenience.
      "jay-babu/mason-null-ls.nvim",
    },
    opts = {
      servers = {
        dockerls = {},
        intelephense = {},
        ---@type lspconfig.options.tsserver
        tsserver = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
          filetypes = {
            "typescript",
            "typescriptreact",
            "typescript.tsx"
          }
        },
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
        html = {},
        cssls = {},
        emmet_ls = {
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "phtml" }
        },
        pyright = {},
      },
      setup = {},
      format = {
        timeout_ms = 3000,
      },
    },
    config = function(plugin, opts)
      require("plugins.lsp.servers").setup(plugin, opts)
    end,
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      -- List of servers for mason to install
      ensure_installed = {
        "shfmt",
        "prettierd",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "pyright"
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- A VS Code like winbar.
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    enabled = false, -- use lspsaga
    config = true,
  },

  {
    "folke/lsp-colors.nvim",
    opts = {
      Error = "#db4b4b",
      Warning = "#e0af68",
      Information = "#0db9d7",
      Hint = "#10B981"
    }
  },

  -- A pretty diagnostics list to help you solve all the trouble your code is causing.
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      -- use_diagnostic_signs = true
      position = "bottom", -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      cycle_results = true, -- cycle item list when reaching beginning or end of list
      action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q",                                                                        -- close the list
        cancel = "<esc>",                                                                   -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",                                                                      -- manually refresh
        jump = { "<cr>", "<tab>", "<2-leftmouse>" },                                        -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },                                                           -- open buffer in new split
        open_vsplit = { "<c-v>" },                                                          -- open buffer in new vsplit
        open_tab = { "<c-t>" },                                                             -- open buffer in new tab
        jump_close = { "o" },                                                               -- jump to the diagnostic and close the list
        toggle_mode = "m",                                                                  -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s",                                                              -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
        toggle_preview = "P",                                                               -- toggle auto_preview
        hover = "K",                                                                        -- opens a small popup with the full multiline message
        preview = "p",                                                                      -- preview the diagnostic location
        open_code_href = "c",                                                               -- if present, open a URI with more information about the diagnostic error
        close_folds = { "zM", "zm" },                                                       -- close all folds
        open_folds = { "zR", "zr" },                                                        -- open all folds
        toggle_fold = { "zA", "za" },                                                       -- toggle fold of current file
        previous = "k",                                                                     -- previous item
        next = "j",                                                                         -- next item
        help = "?"                                                                          -- help menu
      },
      multiline = true,                                                                     -- render multi-line messages
      indent_lines = true,                                                                  -- add an indent guide below the fold icons
      win_config = { border = "single" },                                                   -- window configuration for floating windows. See |nvim_open_win()|.
      auto_open = false,                                                                    -- automatically open the list when you have diagnostics
      auto_close = false,                                                                   -- automatically close the list when you have no diagnostics
      auto_preview = true,                                                                  -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false,                                                                    -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" },                                                    -- for the given modes, automatically jump if there is only a single result
      include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    },
    keys = {
      { "<leader>ld", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics" },
      { "<leader>lD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },

  -- Improves the Neovim built-in LSP experience.
  {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    opts = {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    },
  },

  -- IDE-like breadcrumbs, out of the box.
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    enabled = function()
      return vim.fn.has("nvim-0.10.0") == 1
    end,
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.shfmt,
        },
      }
    end,
  },

  -- Bridges "mason.nvim" with "null-ls" for Neovim convenience.
  {
    "jay-babu/mason-null-ls.nvim",
    opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false },
  },

  -- LSP signature hint when you type.
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },

  -- Interactive real time Neovim scratchpad for embedded Lua engine - Type and watch!.
  -- { "rafcamlet/nvim-luapad", cmd = { "LuaRun", "Luapad" } },

  -- A lightweight formatting engine that plays nice with LSP.
  {
    "stevearc/conform.nvim",
    enabled = false,
    event = "BufReadPre",
    opts = {},
  },

  -- An asynchronous linter plugin, complementary to the built-in Language Server Protocol support.
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    event = "BufReadPre",
    opts = { ft = {} },
    config = function(_, opts)
      require("lint").linters_by_ft = opts.ft
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- A pretty window for previewing, navigating and editing your LSP locations.
  {
    "dnlhc/glance.nvim",
    enabled = false,
    cmd = { "Glance" },
    opts = {},
  },

  -- A simple Neovim plugin that enhances LSP code actions with fully customizable signs,
  -- personalized actions, and server-specific mappings, making code actions more predictable.
  {
    "luckasRanarison/clear-action.nvim",
    enabled = false,
    event = "VeryLazy",
    cmd = { "CodeActionToggleSigns", "CodeActionToggleLabel" },
    opts = {},
  },

  -- A Neovim Lua plugin providing access to the SchemaStore catalog.
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },

  -- LSP support for magento 2
  {
    "pbogut/magento2-ls",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("magento2_ls").setup()
    end,
  },
}
