-- Bundle of more than two dozen new textobjects for Neovim.
return {
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
    event = "VeryLazy",
    enabled = false,
  },
  { "axieax/urlview.nvim", enabled = false, cmd = { "UrlView" } },
}
