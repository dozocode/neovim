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

  -- Gruvbox Baby
  -- {
  --   "luisiacc/gruvbox-baby",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup()
  --     vim.cmd([[colorscheme gruvbox-baby]])
  --   end,
  -- },

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
  
  -- Github themes
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('github-theme').setup({})
  --     vim.cmd('colorscheme github_dark')
  --   end,
  -- }  
  
  -- Miasma
  -- {
  --   "xero/miasma.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme miasma")
  --   end,
  -- }

  -- Bamboo
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('bamboo').setup {}
  --     require('bamboo').load()
  --     vim.o.termguicolors = true
  --   end,
  -- },

  -- Tokyo Dark
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyodark").setup({})
      vim.cmd([[colorscheme tokyodark]])
    end,
      -- opts = {
      --     -- custom options here
      -- },
      -- config = function(_, opts)
      --     require("tokyodark").setup(opts) -- calling setup is optional
      --     vim.cmd [[colorscheme tokyodark]]
      -- end,
  }
}
