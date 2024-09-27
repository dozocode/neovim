return {
  -- Simplifies creating powerful Neovim plugins with developer-friendly tools and utilities
  { "nvim-lua/plenary.nvim" },

  -- Neovim Treesitter configurations and abstraction layer
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate"
  },

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

  -- Finder system
  {
    "nvim-telescope/telescope.nvim", 
    event = "VeryLazy",
    tag = "0.1.6",
    dependencies = { 
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require "telescope"
      local actions = require "telescope.actions"
      local builtin = require "telescope.builtin"

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

      local mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          -- ["<C-n>"] = actions.cycle_history_next,
          -- ["<C-p>"] = actions.cycle_history_prev,
          -- ["?"] = actions_layout.toggle_preview,
          -- ["<C-s>"] = custom_actions.visidata,
          -- ["<A-f>"] = custom_actions.file_browser,
          -- ["<C-z>"] = custom_actions.toggle_term,
          ['<C-d>'] = actions.delete_buffer,
        },
        n = {
          -- ["s"] = custom_actions.visidata,
          -- ["z"] = custom_actions.toggle_term,
          -- ["<A-f>"] = custom_actions.file_browser,
          -- ["q"] = require("telescope.actions").close,
          -- ["cd"] = custom_actions.cwd,
          -- ['<C-d>'] = actions.delete_buffer
        },
      }

      local opts = {
        defaults = {
          mappings = mappings,
        },
        pickers = {
          buffers = {
            previewer = false,
          },
      }

      telescope.setup(opts)
    end
  },

  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end) -- C-H is bound to COQ.nvim
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-t>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
  },
}
