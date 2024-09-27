local lsp = require "lspconfig"
local coq = require "coq"

lsp.tailwindcss.setup{}
lsp.tailwindcss.setup(coq.lsp_ensure_capabilities{})

vim.cmd('COQnow -s')
