local function map(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true })
end

local keymap = vim.keymap.set

-- file explorer
map("n", "<leader>e", "<cmd>CHADopen<CR>")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- deleting to void register
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- splits
map("n", "<leader>sv", "<C-w>v")     -- split window vertically
map("n", "<leader>sh", "<C-w>s")     -- split window horizontally
map("n", "<leader>se", "<C-w>=")     -- make splut windows equal width
map("n", "<leader>sx", ":close<CR>") -- close current split window

-- tabs
map("n", "<leader>to", ":tabnew<CR>")   -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
map("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab

-- close current buffer
map("n", "<Leader>q", ":Bdelete<CR>")

-- keep cursor in the middle when ctrl + d
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
