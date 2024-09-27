local lsp = require "lspconfig"
local coq = require "coq"

local config = {
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" }
}

lsp.emmet_language_server.setup(config)
lsp.emmet_language_server.setup(coq.lsp_ensure_capabilities(config))

vim.cmd('COQnow -s')
