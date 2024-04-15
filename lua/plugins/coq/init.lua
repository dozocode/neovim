return {
  -- Quickstart configurations for the LSP client
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- -- Is used to manage global and project local settings.
      -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },

      -- Is used to display LSP progress.
      { "j-hui/fidget.nvim", config = true },

      -- -- Provides incremental LSP renaming based on Neovim’s command-preview feature.
      -- { "smjonas/inc-rename.nvim", config = true },
    }
  },

  -- Fast as FUCK Neovim completion
  {
    "ms-jpq/coq_nvim",
    event = "VeryLazy",
    branch = "coq",
    init = function() vim.g.coq_settings = { auto_start = true } end,
    dependencies = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p" },
        { "neovim/nvim-lspconfig" },
    },
    config = function(plugin, opts)
      require("plugins.coq.lsp.typescript")
      require("plugins.coq.lsp.intelephense")
      require("plugins.coq.lsp.magento")
    end
  },

  -- LSP support for magento 2
  {
    "pbogut/magento2-ls",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("magento2_ls").setup()
    end,
  },
}
