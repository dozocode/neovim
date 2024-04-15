local lsp = require "lspconfig"
local coq = require "coq"

lsp.intelephense.setup{}
lsp.intelephense.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
