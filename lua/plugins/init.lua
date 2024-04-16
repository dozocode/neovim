return {
  -- Simplifies creating powerful Neovim plugins with developer-friendly tools and utilities
  { "nvim-lua/plenary.nvim" },

  -- Neovim Treesitter configurations and abstraction layer
  {
    "nvim-treesitter/nvim-treesitter", 
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/playground",
    },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      -- sync_install = true,
      ensure_installed = {
        "bash",
        "dockerfile",
        "html",
        "markdown",
        "markdown_inline",
        "org",
        "query",
        "regex",
        "latex",
        "vim",
        "vimdoc",
        "yaml",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "tsx",
        "typescript",
        "css",
        "php",
      },
      highlight = { 
        enable = true
      },
      indent = { 
        enable = true 
      },
      matchup = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      context_commentstring = { 
        enable = true, 
        enable_autocmd = false 
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = swap_next,
          swap_previous = swap_prev,
        },
      },
    }
    -- opts = function()
    --   return {
    --     ensure_installed = { 
    --       "lua",
    --       "javascript",
    --       "typescript",
    --       "tsx",
    --       "vim", 
    --       "vimdoc", 
    --       "query", 
    --       "php", 
    --       "html" 
    --     },
    --     -- filters = {
    --     --   dotfiles = false,
    --     -- },
    --     -- disable_netrw = true,
    --     -- hijack_netrw = true,
    --     -- hijack_cursor = true,
    --     -- hijack_unnamed_buffer_when_opening = false,
    --     -- sync_root_with_cwd = true,
    --     -- update_focused_file = {
    --     --   enable = true,
    --     --   update_root = false,
    --     -- },
    --     -- view = {
    --     --   adaptive_size = false,
    --     --   side = "left",
    --     --   width = 30,
    --     --   preserve_window_proportions = true,
    --     -- },
    --     -- git = {
    --     --   enable = true,
    --     --   ignore = true,
    --     -- },
    --     -- filesystem_watchers = {
    --     --   enable = true,
    --     -- },
    --     -- actions = {
    --     --   open_file = {
    --     --     resize_window = true,
    --     --   },
    --     -- },
    --     -- renderer = {
    --     --   root_folder_label = false,
    --     --   highlight_git = true,
    --     --   highlight_opened_files = "none",

    --     --   indent_markers = {
    --     --     enable = true,
    --     --   },

    --     --   icons = {
    --     --     show = {
    --     --       file = true,
    --     --       folder = true,
    --     --       folder_arrow = true,
    --     --       git = true,
    --     --     },

    --     --     glyphs = {
    --     --       default = "󰈚",
    --     --       symlink = "",
    --     --       folder = {
    --     --         default = "",
    --     --         empty = "",
    --     --         empty_open = "",
    --     --         open = "",
    --     --         symlink = "",
    --     --         symlink_open = "",
    --     --         arrow_open = "",
    --     --         arrow_closed = "",
    --     --       },
    --     --       git = {
    --     --         unstaged = "✗",
    --     --         staged = "✓",
    --     --         unmerged = "",
    --     --         renamed = "➜",
    --     --         untracked = "★",
    --     --         deleted = "",
    --     --         ignored = "◌",
    --     --       },
    --     --     },
    --     --   },
    --     -- },
    --   }
    -- end,
    -- config = function () 
    --   -- local configs = require("nvim-treesitter.configs")

    --   -- configs.setup({
    --   --     ensure_installed = { "lua", "vim", "vimdoc", "query", "php", "javascript", "html" },
    --   --     sync_install = false,
    --   --     highlight = { enable = true },
    --   --     indent = { enable = true },  
    --   --   })

    --   require'nvim-treesitter.configs'.setup {
    --     autotag = {
    --       enable = true,
    --     }
    --   }
    -- end
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

  -- -- Blazing fast indentation style detection for Neovim written in Lua.
  -- {
  --   "nmac427/guess-indent.nvim",
  --   event = { "BufReadPre" },
  --   opts = {},
  -- },

  -- Finder system
  {
    "camspiers/snap",
    event = "VeryLazy",
    config = function ()
      local snap = require"snap"

      snap.maps {
        {"<Leader><Leader>", snap.config.file {producer = "ripgrep.file"}},
        {"<Leader>fb", snap.config.file {producer = "vim.buffer"}},
        {"<Leader>fo", snap.config.file {producer = "vim.oldfile"}},
        {"<Leader>ff", snap.config.vimgrep {}},
      }
    end
  },

  -- -- Remote
  -- {
  --   "yuseku/rsync.nvim", 
  --   event = "VeryLazy",
  --   build = "make",
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim" }
  --   }
  -- },

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

  -- typescript autotag
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    filetypes = {
      'html', 
      'javascript', 
      'typescript', 
      'javascriptreact', 
      'typescriptreact', 
      'svelte', 
      'vue', 
      'tsx', 
      'jsx', 
      'rescript',
      'xml',
      'php',
      'markdown',
      'astro', 
      'glimmer', 
      'handlebars', 
      'hbs',
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- auto closing
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    enabled = false,
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        check_ts = true,
      })
    end,
  },
}
