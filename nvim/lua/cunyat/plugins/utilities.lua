return {
    { 'tpope/vim-sleuth' },
    { 'tpope/vim-fugitive' },
    { 'mbbill/undotree' },
    {
        'folke/zen-mode.nvim',
        opts = {
        }
    },
    {
        'folke/trouble.nvim',
        opts = {}
    },
    {
        'ziglang/zig.vim',
        config = function()
            -- don't show parse errors in a separate window
            vim.g.zig_fmt_parse_errors = 0
            -- disable format-on-save from `ziglang/zig.vim`
            vim.g.zig_fmt_autosave = 0
        end
    },
}
