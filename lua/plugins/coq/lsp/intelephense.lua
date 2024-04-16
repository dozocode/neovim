local lsp = require "lspconfig"
local coq = require "coq"

local config = {
  filetypes = { 
    "php",
    "phtml"
  }
}

lsp.intelephense.setup(config)
lsp.intelephense.setup(coq.lsp_ensure_capabilities(config))
vim.cmd('COQnow -s')
