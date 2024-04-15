return {
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
  -- {
  --   "Mofiqul/dracula.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("dracula").setup()
  --     vim.cmd([[colorscheme dracula]])
  --   end,
  -- },
  
  -- Catppuccin
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
    opts = {
      integrations = {
        -- alpha = true,
        -- cmp = true,
        -- flash = true,
        -- gitsigns = true,
        -- illuminate = true,
        -- indent_blankline = { enabled = true },
        -- lsp_trouble = true,
        -- mason = true,
        -- mini = true,
        -- native_lsp = {
        --   enabled = true,
        --   underlines = {
        --     errors = { "undercurl" },
        --     hints = { "undercurl" },
        --     warnings = { "undercurl" },
        --     information = { "undercurl" },
        --   },
        -- },
        -- navic = { enabled = true, custom_bg = "lualine" },
        -- neotest = true,
        -- noice = true,
        -- notify = true,
        -- neotree = true,
        -- semantic_tokens = true,
        -- telescope = true,
        -- treesitter = true,
        -- which_key = true,
      },
    },
  }
}
