-- Auto toggle hlsearch
local ns = vim.api.nvim_create_namespace("toggle_hlsearch")
local function toggle_hlsearch(char)
  if vim.fn.mode() == "n" then
    local keys = { "<CR>", "n", "N", "*", "#", "?", "/" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end
vim.on_key(toggle_hlsearch, ns)

-- indentation by file type
local function indentationByFile(fileType, indentationWidth)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = fileType,
    callback = function()
      vim.opt_local.shiftwidth = indentationWidth
      vim.opt_local.tabstop = indentationWidth
    end,
  })
end

indentationByFile("php", 4)
indentationByFile("phtml", 4)
indentationByFile("xml", 4)

