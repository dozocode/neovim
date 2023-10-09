return {
  -- Remove all background colors to make nvim transparent.
  {
    "xiyaowong/nvim-transparent",
    cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
    opts = {
      groups = { -- table: default groups
        'Normal',
        -- 'NormalNC',
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'SignColumn',
        'EndOfBuffer',
        'CursorLineNr',
      },
      extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
        "NvimTreeToggle",
        "TabLine",
        "TabLineFill",
        "StatusLineNC",
        "StatusLine",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
      },
      exclude_groups = {
        "CursorLine"
      }, -- table: groups you don't want to clear
    },
    config = function(_, opts)
      require("transparent").setup(opts)
    end,
    init = function(_)
      require('transparent').clear_prefix('NeoTree')
    end
  },

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

  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },

        -- Window open
        open = {
          -- Whether to enable this animation
          enable = false,
        },

        -- Window close
        close = {
          -- Whether to enable this animation
          enable = false,
        }
      }
    end,
  }
}
