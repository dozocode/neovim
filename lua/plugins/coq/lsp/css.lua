local lsp = require "lspconfig"
local coq = require "coq"

lsp.css_variables.setup{}
lsp.css_variables.setup(coq.lsp_ensure_capabilities{})

lsp.cssls.setup{}
lsp.cssls.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
