return {
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup()
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

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
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "catppuccin",
  --   config = function()
  --     vim.cmd([[colorscheme catppuccin]])
  --   end,
  -- }
}
