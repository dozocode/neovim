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

  -- A pretty diagnostics list to help you solve all the trouble your code is causing.
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
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
