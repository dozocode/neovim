return {
  -- Quickstart configurations for the LSP client
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Is used to display LSP progress.
      { "j-hui/fidget.nvim", config = true },
    },
    config = function(plugin, opts)

    end
  },

  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    -- event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local nls = require("null-ls")

      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.eslint,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end
      }
    end
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
      -- require("plugins.coq.lsp.intelephense")
      require("plugins.coq.lsp.typescript")
      require("plugins.coq.lsp.css")
      require("plugins.coq.lsp.eslint")
    end
  },

  -- -- LSP support for magento 2
  -- {
  --   "pbogut/magento2-ls",
  --   event = { "BufReadPre", "BufNewFile" },
  --   build = "cargo build --release",
  --   config = function()
  --     require("magento2_ls").setup()
  --   end,
  -- },
}
