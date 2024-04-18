local g = vim.g
local opt = vim.opt

-- -- hide status line
-- vim.cmd("set laststatus=0")
-- vim.cmd("set cursorline")
-- vim.cmd("set noshowcmd")
-- vim.cmd("set noshowmode")
-- vim.cmd("set noruler")

-- map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false

-- clipboard
-- opt.clipboard:append("unnamedplus")
opt.clipboard = "unnamedplus" -- Access system clipboard

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- backspace
opt.backspace = "indent,eol,start"

-- cursor line
opt.cursorline = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- vim.cmd("set autoindent")
-- opt.autoindent = true
-- opt.breakindent = true
-- opt.smartindent = true

opt.cmdheight = 0

opt.foldcolumn = "1"        -- '0' is not bad
opt.foldenable = true
opt.foldlevel = 99          -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99

opt.signcolumn = "yes"
opt.colorcolumn = "120"


