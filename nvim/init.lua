local set = vim.opt

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
set.completeopt = "menuone,noselect,popup,fuzzy"
set.termguicolors = true

set.backup = false
set.swapfile = false
set.undofile = true

set.expandtab = true
set.shiftround = true
set.smartindent = true
set.autoindent = true
set.breakindent = true

-- set.rtp:append("~/dev/cunyat/php.nvim");

vim.cmd.syntax("on")
vim.api.nvim_command('filetype plugin indent on')

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

require("cunyat.lazy")
require("cunyat.autocmds")
require("cunyat.mappings")
require("cunyat.neovide")

