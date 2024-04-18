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
      -- vim.g.coq_settings = { 
      --   ["keymap.recommended"] = false,
      -- }

      -- _G.pumvisible = function()
      --   return vim.fn.pumvisible() == 1
      -- end

      -- _G.check_complete = function()
      --   local info = vim.fn.complete_info()
      --   return info.selected == -1 and "<C-e><CR>" or "<C-y>"
      -- end

      -- vim.api.nvim_set_keymap('i', '<Esc>',   'v:lua.pumvisible() ? "<C-e><Esc>" : "<Esc>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<C-c>',   'v:lua.pumvisible() ? "<C-e><C-c>" : "<C-c>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<BS>',    'v:lua.pumvisible() ? "<C-e><BS>" : "<BS>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<CR>',    'v:lua.pumvisible() ? v:lua.check_complete() : "<CR>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<Tab>',   'v:lua.pumvisible() ? "<C-n>" : "<Tab>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.pumvisible() ? "<C-p>" : "<BS>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<C-j>',   'v:lua.pumvisible() ? "<C-n>" : "<Tab>"', {expr = true, noremap = true, silent = true})
      -- vim.api.nvim_set_keymap('i', '<C-k>', 'v:lua.pumvisible() ? "<C-p>" : "<BS>"', {expr = true, noremap = true, silent = true})

      -- require("plugins.coq.lsp.intelephense")
      require("plugins.coq.lsp.typescript")
      require("plugins.coq.lsp.css")
      require("plugins.coq.lsp.eslint")
    end
  },
}
