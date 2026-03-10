return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      cmp = false,
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv", 'require "luv"' } },
        { path = "busted/library",     words = { "it%(", "describe%(" } },
        { path = "luassert/library",   words = { "it%(", "describe%(" } },
        { path = "lpeg/library",       words = { 'require "lpeg"' } },
      },
      integrations = {
        lspconfig = false,
        cmp = false,
      },
    },
  },
}
