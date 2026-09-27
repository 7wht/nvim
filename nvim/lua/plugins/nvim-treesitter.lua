vim.cmd.packadd("nvim-treesitter.nvim")

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('config') .. '/site',
}
