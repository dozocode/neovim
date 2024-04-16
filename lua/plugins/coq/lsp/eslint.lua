local lsp = require "lspconfig"
local coq = require "coq"

local config = {
  -- on_attach = function(client, bufnr)
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     buffer = bufnr,
  --     command = "EslintFixAll",
  --   })
  -- end,
}

lsp.eslint.setup(config)
lsp.eslint.setup(coq.lsp_ensure_capabilities(config))
vim.cmd('COQnow -s')
