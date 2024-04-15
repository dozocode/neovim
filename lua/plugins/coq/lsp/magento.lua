  -- -- Add magento 2 support
  local lspconfig_util = require "lspconfig.util"
  local server_config = require "lspconfig.configs"

  print()

  server_config.magento = {
    default_config = {
      cmd = { vim.env.HOME .. "/lsp/magento2", "--stdio" },
      name = "magento",
      filetypes = {
        "xml",
        "php",
        "phtml"
      },
      root_dir = lspconfig_util.find_git_ancestor,
      single_file_support = true,
    }
  }

local lsp = require "lspconfig"
local coq = require "coq"

lsp.magento.setup{}
lsp.magento.setup(coq.lsp_ensure_capabilities{})
vim.cmd('COQnow -s')
