return {
  -- Simplifies creating powerful Neovim plugins with developer-friendly tools and utilities.
  { "nvim-lua/plenary.nvim" },

  -- UI Component Library for Neovim.
  { "MunifTanjim/nui.nvim" },

  -- This plugin provides the same icons as well as colors for each icon.
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "DaikyXendo/nvim-material-icon" },
    config = function()
      require("nvim-web-devicons").setup({
        override = require("nvim-material-icon").get_icons(),
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
          }
        }
      })
    end,
  },

  -- Icon set for neovim plugins and settings.
  { "yamatsum/nvim-nonicons", config = true,        enabled = false },

  -- Plugin for Vim that enhances the dot command's functionality.
  { "tpope/vim-repeat",       event = "VeryLazy" },

  -- Plugin that peeks lines of the buffer in non-obtrusive way.
  { "nacro90/numb.nvim",      event = "BufReadPre", config = true },

  -- This plugin adds indentation guides to Neovim.
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  -- Enhances Neovim's UI with telescope integration.
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { relative = "editor" },
      select = {
        backend = { "telescope", "fzf", "builtin" },
      },
    },
  },

  -- A fancy, configurable, notification manager for NeoVim
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#000000",
      -- background_colour = "#A3CCBE",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },

  -- Plugin that lets you highlight, navigate, and operate on sets of matching text.
  -- It extends vim's % key to language-specific words instead of just single characters.
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
  { "tpope/vim-surround", event = "BufReadPre", enabled = false },

  -- Surround selections, stylishly 😎
  {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    opts = {},
  },

  -- Smart and Powerful commenting plugin
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = { "n", "v" } }, { "gbc", mode = { "n", "v" } } },
    config = function(_, _)
      local opts = {
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
      require("Comment").setup(opts)
    end,
  },

  -- Is a simple lua plugin for automated session management.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },

  -- Better-escape.vim is created to help Vim/Nvim users escape insert mode quickly using
  -- their customized key combinations, without experiencing the lag.
  {
    "max397574/better-escape.nvim",
    enabled = true,
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({
        mapping = { "jk" },
      })
    end,
  },

  -- Escape insert mode, terminal mode, the "hit-enter-prompt" and more with a simple two character mapping
  {
    "TheBlob42/houdini.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {
      escape_sequences = {
        ["t"] = "<ESC>",
        ["c"] = "<ESC>",
      },
    },
  },

  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  {
    "moll/vim-bbye",
    event = "VeryLazy",
    enabled = true,
  },
}
