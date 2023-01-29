require("cunyat.plugins")
require("cunyat.autocmds")
require("cunyat.mappings")

-- TODO: move this settings into a module

vim.api.nvim_create_user_command(
    "ReloadConfig",
    function()
        for name, _ in pairs(package.loaded) do
            if name:match("^cunyat") then
                package.loaded[name] = nil
            end
        end

        dofile(vim.env.MYVIMRC)
        vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
    end,
    { bang = true }
)

local set = vim.opt

-- Colorscheme
vim.cmd.colorscheme("kanagawa")
vim.g.airline_theme = "deus"
set.background = "dark"

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.compatible = false
set.number = true
set.backspace = "indent,eol,start"
set.showmode = false
set.ruler = true
set.encoding = "utf-8"
set.cursorline = true
set.showmatch = true
set.ignorecase = true
set.hlsearch = true
set.incsearch = true
set.smartcase = true

-- set.mouse = "v"
set.wildmode = "longest,list"
set.completeopt = "menuone,noselect"
set.termguicolors = true

set.backup = false
set.swapfile = false
set.undofile = false

set.expandtab = true
set.shiftround = true
set.smartindent = true
set.autoindent = true

vim.cmd.set("mouse+=a")
vim.cmd.syntax("on")

vim.api.nvim_command('filetype plugin indent on')

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
