return {
  -- Remove all background colors to make nvim transparent.
  -- {
  --   "xiyaowong/nvim-transparent",
  --   cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
  --   opts = {
  --     groups = { -- table: default groups
  --       'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
  --       'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
  --       'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
  --       'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  --     },
  --     extra_groups = { -- table/string: additional groups that should be cleared
  --       -- In particular, when you set it to 'all', that means all available groups
  --
  --       -- -- example of akinsho/nvim-bufferline.lua
  --       -- "BufferLineTabClose",
  --       -- "BufferlineBufferSelected",
  --       -- "BufferLineFill",
  --       -- "BufferLineBackground",
  --       -- "BufferLineSeparator",
  --       -- "BufferLineIndicatorSelected",
  --
  --       "BufferLineTabClose",
  --       "BufferlineBufferSelected",
  --       "BufferLineFill",
  --       "BufferLineBackground",
  --       "BufferLineSeparator",
  --       "BufferLineIndicatorSelected",
  --       "NvimTreeToggle",
  --       "TabLine",
  --       "TabLineFill",
  --       "StatusLine",
  --       "StatusLineNC",
  --       "NeoTreeNormal",
  --       "NeoTreeNormalNC",
  --     },
  --     exclude_groups = {}, -- table: groups you don't want to clear
  --   },
  --   config = function(_, opts)
  --     require("transparent").setup(opts)
  --   end,
  --   init = function(_)
  --     require('transparent').clear_prefix('NeoTree')
  --   end
  -- },

  -- It is easy to lose current cursor position, when using commands like % or <c-f>,<c-b>.
  -- This plugin add sub-cursor to show scroll direction!!
  {
    "gen740/SmoothCursor.nvim",
    enabled = false,
    event = { "BufReadPre" },
    config = function()
      require("smoothcursor").setup({ fancy = { enable = true } })
    end,
  },

  -- Smooth scrolling for ANY movement command (or string of commands) 🤯
  {
    "declancm/cinnamon.nvim",
    enabled = false,
    event = { "BufReadPre" },
    config = function()
      require("cinnamon").setup()
    end,
  },
}
