vim.api.nvim_create_user_command("PhpFindTest", function()
    local filename = vim.fn.expand('%:t'):match("(.+)%..+$")

    require("telescope.builtin").find_files({
        search_dirs = { "tests/" },
        search_file = filename .. "[CT]est.php$",
    })
end)
