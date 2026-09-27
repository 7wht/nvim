vim.cmd.packadd("undotree.nvim")

vim.keymap.set('n', '<leader>u', function()
  vim.cmd("UndotreeToggle")
  vim.cmd(":wincmd h")
  vim.cmd(":wincmd k")
end)


