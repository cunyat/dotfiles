if not vim.g.neovide then
    return
end

vim.o.guifont = "FiraCode Nerd Font Mono:h14"
vim.g.neovide_floating_shadow = false

local padding = 16
vim.g.neovide_padding_top = padding
vim.g.neovide_padding_bottom = padding / 2
vim.g.neovide_padding_right = padding
vim.g.neovide_padding_left = padding
