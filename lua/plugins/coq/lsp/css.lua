local lsp = require "lspconfig"
local coq = require "coq"

lsp.css_variables.setup{}
lsp.css_variables.setup(coq.lsp_ensure_capabilities{})

local config = {
  settings = {
    css = { 
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = { 
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = { 
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  }
}

lsp.cssls.setup(config)
lsp.cssls.setup(coq.lsp_ensure_capabilities(config))

vim.cmd('COQnow -s')
