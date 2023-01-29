vim.api.nvim_create_augroup('bufcheck', {clear = true})

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

