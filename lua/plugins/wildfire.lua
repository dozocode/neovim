-- With Wildfire you can quickly select the closest text object among a group of candidates.
-- By default candidates are i', i", i), i], i}, ip and it.
return {
  "sustech-data/wildfire.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
}
