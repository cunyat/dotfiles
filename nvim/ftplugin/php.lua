---@param file_name string
local function find_test()
  local filter = vim.fn.expand("%:t"):match("(.+)%..+$") .. "Test.php"

  vim.notify("filter = " .. filter, vim.log.levels.INFO)

  require("telescope.builtin").find_files({
    path_display = { "truncate" },
    promt_prefix = filter,
    search_file = filter,
  })
end


vim.keymap.set("n", "<leader>ts", find_test, { desc = "Find test file", buffer = true })

-- php.nvim keymaps
vim.keymap.set("n", "<leader>tf", function()
  require('php.phpunit').run_phpunit({ vim.fn.bufname() })
end, { desc = "Test file", buffer = true })
