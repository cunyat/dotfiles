vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_prev() })
end, opts)
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ diagnostic = vim.diagnostic.get_next() })
end, opts)

vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files({})
end, {})
vim.keymap.set('n', '<leader>gf', function()
  require('telescope.builtin').git_files({})
end, {})
vim.keymap.set('n', '<leader>sw', function()
  local word = vim.fn.expand('<cword>')
  require('telescope.builtin').grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>sW', function()
  local word = vim.fn.expand('<cWORD>')
  require('telescope.builtin').grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>sg', function()
  require('telescope.builtin').live_grep()
end, {})
vim.keymap.set('n', '<leader>sh', function()
  require('telescope.builtin').help_tags()
end, {})
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers()
end, {})
vim.keymap.set('n', '<leader>"', function()
  require('telescope.builtin').registers()
end, {})
vim.keymap.set('n', '<leader>st', function()
  require('telescope.builtin').builtin()
end, {})
vim.keymap.set('n', '<leader>np', function()
  require('telescope.builtin').find_files({
    cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy')
  })
end, {})

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>zz', require('zen-mode').toggle, opts)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- mappings.
  -- see `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gri', require('telescope.builtin').lsp_implementations, bufopts)
  vim.keymap.set('n', '<leader>ds', function()
    require('telescope.builtin').lsp_document_symbols()
  end, bufopts)
  vim.keymap.set('n', '<leader>ws', function()
    require('telescope.builtin').lsp_dynamic_workspace_symbols()
  end, bufopts)
end

-- use lspattach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
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

-- terminal
vim.keymap.set({ 't' }, '<ESC><ESC>', '<C-\\><C-N>', {})

-- disable s in normal and visual mode mode
vim.keymap.set({ 'v', 'n' }, 's', '<Nop>', {})

-- treesiter textobjects
local function select_textobject(textobject)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(textobject, "textobjects")
  end
end

vim.keymap.set({ 'x', 'o' }, 'aa', select_textobject('@parameter.outer'))
vim.keymap.set({ 'x', 'o' }, 'ia', select_textobject('@parameter.inner'))
vim.keymap.set({ 'x', 'o' }, 'am', select_textobject('@function.outer'))
vim.keymap.set({ 'x', 'o' }, 'im', select_textobject('@function.inner'))
vim.keymap.set({ 'x', 'o' }, 'ac', select_textobject('@class.outer'))
vim.keymap.set({ 'x', 'o' }, 'ic', select_textobject('@class.inner'))

vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
end)
vim.keymap.set("n", "<leader>A", function()
  require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner"
end)


vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
