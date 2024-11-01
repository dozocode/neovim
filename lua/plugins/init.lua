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
    -- opts = {
    --   -- sync_install = true,
    --   ensure_installed = {
    --     "bash",
    --     "dockerfile",
    --     "html",
    --     "markdown",
    --     "markdown_inline",
    --     "org",
    --     "query",
    --     "regex",
    --     "latex",
    --     "vim",
    --     "vimdoc",
    --     "yaml",
    --     "javascript",
    --     "json",
    --     "json5",
    --     "jsonc",
    --     "lua",
    --     "tsx",
    --     "typescript",
    --     "css",
    --     "php",
    --     "xml",
    --   },
    --   highlight = { 
    --     enable = true,
    --   },
    --   indent = { 
    --     enable = true 
    --   },
    --   matchup = {
    --     enable = true,
    --   },
    --   endwise = {
    --     enable = true,
    --   },
    --   autotag = {
    --     enable = true,
    --   },
    --   context_commentstring = { 
    --     enable = true, 
    --     enable_autocmd = false 
    --   },
    --   textobjects = {
    --     select = {
    --       enable = true,
    --       lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    --       keymaps = {
    --         -- You can use the capture groups defined in textobjects.scm
    --         ["aa"] = "@parameter.outer",
    --         ["ia"] = "@parameter.inner",
    --         ["af"] = "@function.outer",
    --         ["if"] = "@function.inner",
    --         ["ac"] = "@class.outer",
    --         ["ic"] = "@class.inner",
    --       },
    --     },
    --     move = {
    --       enable = true,
    --       set_jumps = true, -- whether to set jumps in the jumplist
    --       goto_next_start = {
    --         ["]m"] = "@function.outer",
    --         ["]]"] = "@class.outer",
    --       },
    --       goto_next_end = {
    --         ["]M"] = "@function.outer",
    --         ["]["] = "@class.outer",
    --       },
    --       goto_previous_start = {
    --         ["[m"] = "@function.outer",
    --         ["[["] = "@class.outer",
    --       },
    --       goto_previous_end = {
    --         ["[M"] = "@function.outer",
    --         ["[]"] = "@class.outer",
    --       },
    --     },
    --     swap = {
    --       enable = true,
    --       swap_next = swap_next,
    --       swap_previous = swap_prev,
    --     },
    --   },
    -- }
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
    config = function () 
      -- lvim.builtin.treesitter.autotag.enable = true 

      -- local configs = require("nvim-treesitter.configs")

      -- configs.setup({
      --     ensure_installed = { "lua", "vim", "vimdoc", "query", "php", "javascript", "html" },
      --     sync_install = false,
      --     highlight = { enable = true },
      --     indent = { enable = true },  
      --   })

      -- require'nvim-treesitter.configs'.setup {
      --   autotag = {
      --     enable = true,
      --   }
      -- }
      
       require 'nvim-ts-autotag'.setup()
       require("nvim-treesitter.configs").setup({ 
           sync_install = true, 
           ensure_installed = { 
               "html", 
               "javascript", 
               "typescript", 
               "tsx", 
               -- "svelte", 
               -- "vue", 
               -- "php", 
               -- "glimmer", 
               -- "rescript", 
               -- "embedded_template",
               -- "tsx"
           }, 
       }) 
    end
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter", 
  --   build = ":TSUpdate"
  -- },

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

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup({
        indent = { char = "▏" }
      })
    end
  },

  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require('rainbow-delimiters.setup').setup({})
  --   end
  -- },

  -- {
  --   "kiyoon/treesitter-indent-object.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     {
  --       "ai",
  --       function() require'treesitter_indent_object.textobj'.select_indent_outer() end,
  --       mode = {"x", "o"},
  --       desc = "Select context-aware indent (outer)",
  --     },
  --     {
  --       "aI",
  --       function() require'treesitter_indent_object.textobj'.select_indent_outer(true) end,
  --       mode = {"x", "o"},
  --       desc = "Select context-aware indent (outer, line-wise)",
  --     },
  --     {
  --       "ii",
  --       function() require'treesitter_indent_object.textobj'.select_indent_inner() end,
  --       mode = {"x", "o"},
  --       desc = "Select context-aware indent (inner, partial range)",
  --     },
  --     {
  --       "iI",
  --       function() require'treesitter_indent_object.textobj'.select_indent_inner(true, 'V') end,
  --       mode = {"x", "o"},
  --       desc = "Select context-aware indent (inner, entire range) in line-wise visual mode",
  --     },
  --   },
  -- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   tag = "v2.20.8",  -- Use v2
  --   event = "BufReadPost",
  --   config = function()
  --     -- vim.opt.list = true
  --     -- vim.opt.listchars:append "space:⋅"
  --     -- vim.opt.listchars:append "eol:↴"

  --     -- require("indent_blankline").setup {
  --     --     space_char_blankline = " ",
  --     --     show_current_context = true,
  --     --     show_current_context_start = true,
  --     -- }

  --     vim.opt.termguicolors = true
  --     vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
  --     vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
  --     vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
  --     vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
  --     vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
  --     vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

  --     vim.opt.list = true
  --     vim.opt.listchars:append "space:⋅"
  --     vim.opt.listchars:append "eol:↴"

  --     -- char = "▏"
  --     require("indent_blankline").setup {
  --         space_char_blankline = " ",
  --         char_highlight_list = {
  --             "IndentBlanklineIndent1",
  --             "IndentBlanklineIndent2",
  --             "IndentBlanklineIndent3",
  --             "IndentBlanklineIndent4",
  --             "IndentBlanklineIndent5",
  --             "IndentBlanklineIndent6",
  --         },
  --     }
  --   end,
  -- },
}
