vim.g.mapleader = ","


local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map("t", "<Esc>", "<C-\\><C-n>", {
	desc = "exist terminal mode with esc",
	silent = true,
	noremap = true,
})

map("n", "<Leader>w", ":w<CR>", opts)

map("n", "<Leader>p", ":GFiles<CR>", opts)
map("n", "<Leader>P", ":Files<CR>", opts)
map("n", "<Leader>k", ":Ag<CR>", opts)
map("n", "<Leader>b", ":Buffers<CR>", opts)




