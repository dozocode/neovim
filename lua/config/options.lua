-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local opt = vim.opt

-- number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "120"

-- remove thin cursor in insert mode
-- opt.guicursor = ""

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")
opt.clipboard = "unnamedplus" -- Access system clipboard

-- split windows
opt.splitright = true
opt.splitbelow = true

-- other
opt.iskeyword:append("-")
opt.isfname:append("@-@")
opt.title = true

opt.updatetime = 200

opt.hlsearch = false
opt.incsearch = true

-- transaprency
g.transparent_enabled = true

-- indentation by file type
local function indentationByFile(fileType, indentationWidth)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = fileType,
    callback = function()
      vim.opt_local.shiftwidth = indentationWidth
      vim.opt_local.tabstop = indentationWidth
    end,
  })
end

indentationByFile("php", 4)
indentationByFile("phtml", 4)
indentationByFile("xml", 4)

opt.autoindent = true
opt.breakindent = true
opt.cmdheight = 0
opt.completeopt = "menuone,noselect"
opt.conceallevel = 0
opt.confirm = true
-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "1"        -- '0' is not bad
opt.foldenable = true
opt.foldlevel = 99          -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.formatoptions = "jqlnt" -- tcqj
opt.hidden = true
opt.inccommand = "nosplit"
opt.joinspaces = false
opt.laststatus = 3
opt.list = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrollback = 100000
opt.scrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 8
opt.smartindent = true
opt.splitkeep = "screen"
opt.timeoutlen = 300
opt.undofile = true
opt.wildmode = "longest:full,full"

-- map <leader> to space
g.mapleader = " "
g.maplocalleader = " "
g.markdown_recommended_style = 0

-- WSL yank support
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    -- Copy win32yank.exe to C:\Windows\System32\
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
