local lsp = require "lspconfig"
local coq = require "coq"

local config = {}

lsp.csharp_ls.setup(config)
lsp.csharp_ls.setup(coq.lsp_ensure_capabilities(config))
vim.cmd('COQnow -s')
