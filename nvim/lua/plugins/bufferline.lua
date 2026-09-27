vim.cmd.packadd("bufferline.nvim")
vim.opt.termguicolors = true

require("bufferline").setup{
  options = {
    always_show_bufferline = false,
    padding = 0,
    tab_size = 0,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    show_duplicate_prefix = false,
    indicator = {
      style = "none",
    },
    separator_style = "thin"
  }
}
