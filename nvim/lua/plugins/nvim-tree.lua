vim.cmd.packadd("nvim-tree.nvim")

require("nvim-tree").setup({
  respect_buf_cwd = true,
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
  },
})
