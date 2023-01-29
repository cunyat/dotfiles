vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map("t", "<Esc>", "<C-\\><C-n>", opts)

map("n", "<Leader>w", ":w<CR>", opts)

map("n", "<Leader>p", ":Telescope git_files show_untracked=true<CR>", opts)
map("n", "<Leader>P", ":Telescope find_files<CR>", opts)
map("n", "<Leader>k", ":Telescope live_grep<CR>" ,opts)
map("n", "<Leader>b", ":Telescope buffers<CR>", opts)

