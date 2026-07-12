vim.cmd.packadd("telescope.nvim")

require('telescope').setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
})


