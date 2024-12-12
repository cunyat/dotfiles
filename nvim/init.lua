-- TODO: move this settings into a module

local set = vim.opt

-- Colorscheme todo: set it on theme file
-- vim.cmd.colorscheme("cat")
-- set.background = "dark"
-- set.background = "light"

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.compatible = false
set.number = true
set.relativenumber = true
set.signcolumn = 'yes'
set.backspace = "indent,eol,start"
set.mouse = ''
set.cursorline = true
set.showmatch = true
set.ignorecase = true
set.hlsearch = true
set.incsearch = true
set.smartcase = true

set.wildmode = "longest,list"
set.completeopt = "menuone,noselect"
set.termguicolors = true

set.backup = false
set.swapfile = false
set.undofile = true

set.expandtab = true
set.shiftround = true
set.smartindent = true
set.autoindent = true
set.breakindent = true

vim.cmd.syntax("on")

vim.api.nvim_command('filetype plugin indent on')

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

require("cunyat.lazy")
require("cunyat.autocmds")
require("cunyat.mappings")
