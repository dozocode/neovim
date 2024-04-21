return {
  -- Kanagawa
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup()
  --     vim.cmd([[colorscheme kanagawa]])
  --   end,
  -- },

  -- Gruvbox
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup()
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  -- },

  -- Dracula
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      ---@type dracula
      local dracula = require "dracula"

      dracula.setup({
      transparent = false,
      on_colors = function (colors, color)
        ---@type dracula.palette
        return {
          -- override or create new colors
          mycolor = "#ffffff",
        }
      end,
      on_highlights = function (colors, color)
        ---@type dracula.highlights
        return {
          ---@type vim.api.keyset.highlight
          Normal = { fg = colors.mycolor }
        }
      end,
      plugins = {
        ["nvim-treesitter"] = true,
        ["nvim-lspconfig"] = true,
        ["nvim-navic"] = true,
        ["nvim-cmp"] = true,
        ["indent-blankline.nvim"] = true,
        ["neo-tree.nvim"] = true,
        ["nvim-tree.lua"] = true,
        ["which-key.nvim"] = true,
        ["dashboard-nvim"] = true,
        ["gitsigns.nvim"] = true,
        ["neogit"] = true,
        ["todo-comments.nvim"] = true,
        ["lazy.nvim"] = true,
        ["telescope.nvim"] = true,
        ["noice.nvim"] = true,
        ["hop.nvim"] = true,
        ["mini.statusline"] = true,
        ["mini.tabline"] = true,
        ["mini.starter"] = true,
        ["mini.cursorword"] = true,
      }
      })
      vim.cmd.colorscheme 'dracula'
      -- vim.cmd.colorscheme 'dracula-soft'
    end
  },
  
  -- Catppuccin
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "catppuccin",
  --   config = function()
  --     vim.cmd([[colorscheme catppuccin-mocha]])
  --   end,
  -- }
  
  -- Starry
  -- {
  --   "ray-x/starry.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("starry").setup()
  --     vim.cmd([[colorscheme dracula]])
  --   end,
  -- },
}
