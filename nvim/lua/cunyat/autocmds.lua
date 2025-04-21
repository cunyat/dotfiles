-- Disable syntax on large files (>10k lines)
vim.api.nvim_create_autocmd("BufEnter", {
    -- group = syntax_group,
    pattern = "*",
    callback = function()
        if vim.api.nvim_buf_line_count(0) > 10000 then
            vim.cmd [[ syntax off ]]
        end
    end
})


-- Strip trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*", command = "%s/\\s\\+$//e" })

local gototest = vim.api.nvim_create_augroup("GoToTest", { clear = true })

vim.api.nvim_create_autocmd("Filetype", {
    pattern = { "php" },
    group = gototest,
    callback = function()
        local filter = vim.fn.expand('%:t'):match("(.+)%..+$") .. ".php$"

        vim.keymap.set("n", "gt", function()
            require("telescope.builtin").find_files({
                path_display = { "truncate" },
                promt_prefix = filter,
                search_file = filter,
            })
        end)
    end
})

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

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

local terminal_au_group = vim.api.nvim_create_augroup('me.terminal', { clear = true })

vim.api.nvim_create_autocmd('TermOpen', {
    desc = "Set default options for teminal buffer and starts insert mode",
    group = terminal_au_group,
    callback = function()
        vim.opt.number = false;
        vim.opt.relativenumber = false;
        vim.cmd('startinsert')
    end
})
