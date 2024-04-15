local g = vim.g
local opt = vim.opt

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

-- cursor line
opt.cursorline = true
