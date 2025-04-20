vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)


local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', telescope.find_files, {})
vim.keymap.set('n', '<leader>gf', telescope.git_files, {})
vim.keymap.set('n', '<leader>sw', function()
    local word = vim.fn.expand('<cword>')
    telescope.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>sW', function()
    local word = vim.fn.expand('<cWORD>')
    telescope.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>sg', telescope.live_grep)
vim.keymap.set('n', '<leader>sh', telescope.help_tags, {})
vim.keymap.set('n', '<leader><space>', telescope.buffers, {})
vim.keymap.set('n', '<leader>"', telescope.registers, {})
vim.keymap.set('n', '<leader>st', telescope.builtin, {})

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>zz', require('zen-mode').toggle, opts)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- mappings.
    -- see `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', telescope.lsp_references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, bufopts)
    vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, bufopts)
end

-- use lspattach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('lspattach', {
    group = vim.api.nvim_create_augroup('userlspconfig', {}),
    callback = on_attach
})

-- stay on visual after indenting
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- oil
local oil = require('oil')
vim.keymap.set('n', '-', oil.open, { noremap = true, silent = true, desc = "Open parent directory" })
vim.keymap.set('n', '_', function()
    oil.open(vim.fn.getcwd())
end, { noremap = true, silent = true, desc = "Open parent directory" })

-- system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true, silent = true, desc = "Yank into system register" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = "Paste from system register" })
