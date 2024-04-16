local lsp = require "lspconfig"
local coq = require "coq"

local config = {
  filetypes = { 
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  }
}

lsp.tsserver.setup(config)
lsp.tsserver.setup(coq.lsp_ensure_capabilities(config))
vim.cmd('COQnow -s')
