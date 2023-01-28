require("neoscroll").setup({ easing_function = "quadratic" })

local t = {}

t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "50", nil } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "50", nil } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "50", nil } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "50", nil } }
t["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } }
t["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } }
t["zt"] = { "zt", { "10" } }
t["zz"] = { "zz", { "10" } }
t["zb"] = { "zb", { "10" } }

require("neoscroll.config").set_mappings(t)
