require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "vim", "help", "go" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
}
