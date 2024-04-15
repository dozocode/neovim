return {
  -- Simplifies creating powerful Neovim plugins with developer-friendly tools and utilities.
  { "nvim-lua/plenary.nvim" },

  -- requires python3-venv then :CHADdeps
  {
    "ms-jpq/chadtree",
    event = "VeryLazy",
    branch = "chad",
    build = "python3 -mhadtree deps",
  },

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

  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  {
    "moll/vim-bbye",
    event = "VeryLazy",
    enabled = true,
  },

  -- Blazing fast indentation style detection for Neovim written in Lua.
  {
    "nmac427/guess-indent.nvim",
    enabled = false,
    event = { "BufReadPre" },
    opts = {},
  },

  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {},
  --   config = function(_, opts)
  --     require("refactoring").setup(opts)
  --     require("telescope").load_extension("refactoring")
  --   end,
  --   -- stylua: ignore
  --   keys = {
  --     { "<leader>rs", function() require("telescope").extensions.refactoring.refactors() end, mode = { "v" }, desc = "Refactor", },
  --     { "<leader>ri", function() require("refactoring").refactor("Inline Variable") end, mode = {"n","v"}, desc =  "Inline Variable" },
  --     { "<leader>rb", function() require('refactoring').refactor('Exract Block') end, mode = {"n"}, desc = "Extract Block" },
  --     { "<leader>rf", function() require('refactoring').refactor('Exract Block To File') end, mode = {"n"}, desc = "Extract Block to File" },
  --     { "<leader>rP", function() require('refactoring').debug.printf({below = false}) end,  mode = {"n"}, desc = "Debug Print" },
  --     { "<leader>rp", function() require('refactoring').debug.print_var({normal = true}) end, mode = {"n"}, desc = "Debug Print Variable" },
  --     { "<leader>rc", function() require('refactoring').debug.cleanup({}) end, mode = {"n"}, desc = "Debug Cleanup" },
  --     { "<leader>rf", function() require('refactoring').refactor('Extract Function') end,  mode = {"v"}, desc = "Extract Function" },
  --     { "<leader>rF", function() require('refactoring').refactor('Extract Function to File') end, mode = {"v"}, desc =  "Extract Function to File" },
  --     { "<leader>rx", function() require('refactoring').refactor('Extract Variable') end, mode = {"v"}, desc = "Extract Variable" },
  --     { "<leader>rp", function() require('refactoring').debug.print_var({}) end, mode = {"v"}, desc =  "Debug Print Variable" },
  --   },
  -- },

  -- Finder system
  {
    "camspiers/snap",
    event = "VeryLazy",
    config = function ()
      -- Basic example config
      local snap = require"snap"
      snap.maps {
        {"<Leader><Leader>", snap.config.file {producer = "ripgrep.file"}},
        {"<Leader>fb", snap.config.file {producer = "vim.buffer"}},
        {"<Leader>fo", snap.config.file {producer = "vim.oldfile"}},
        {"<Leader>ff", snap.config.vimgrep {}},
      }
    end
  }
}
