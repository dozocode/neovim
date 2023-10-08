return {
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    config = function()
      require("styler").setup({
        themes = {
          markdown = { colorscheme = custom_colorscheme },
          help = { colorscheme = custom_colorscheme },
        },
      })
    end,
  },
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup({})

  --     vim.cmd('colorscheme github_dark_high_contrast')
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local tokyonight = require("tokyonight")
  --     tokyonight.setup({ style = "storm" })
  --     tokyonight.load()
  --   end,
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup()
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
      require("dracula").setup()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    config = function()
      local custom_json_path = vim.fn.expand('~/.config/nvim/custom.json')
      local custom_config = nil
      local custom_colorscheme = "catppuccin-mocha"

      -- Check if the custom.json file exists
      if vim.fn.filereadable(custom_json_path) == 1 then
        -- Load file data
        local file = io.open(custom_json_path, "r")
        local content = file:read "*a"
        file:close()

        -- Parse the JSON content
        local custom_data = vim.json.decode(content)

        if custom_data then
          custom_config = custom_data
        end

        if custom_config and custom_config["colorscheme"] and custom_config["colorscheme"] ~= "" then
          custom_colorscheme = custom_config["colorscheme"]
        end
      end

      vim.cmd.colorscheme(custom_colorscheme)
    end,
  },
}
