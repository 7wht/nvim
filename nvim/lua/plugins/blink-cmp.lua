vim.cmd.packadd("blink.cmp")


require("blink.cmp").setup({
  fuzzy = {
    implementation = "lua",
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
})

