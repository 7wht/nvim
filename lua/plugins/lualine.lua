vim.cmd.packadd("lualine.nvim")

local function recording_macro()
  local r = vim.fn.reg_recording()
  if r == nil or r == '' then
    return ''
  end
  return 'REC @' .. r
end

require('lualine').setup({
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {
        "NvimTree",
        "Terminal"
      },
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = { recording_macro },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})


local macro_group = vim.api.nvim_create_augroup("LualineRecording", { clear = true })

local function refresh_lualine()
  pcall(function()
    require("lualine").refresh({
      force = true,
      scope = "window",
      place = { "statusline" },
    })
  end)
end

vim.api.nvim_create_autocmd("RecordingEnter", {
  group = macro_group,
  callback = function()
    refresh_lualine()
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  group = macro_group,
  callback = function()
    vim.schedule(refresh_lualine) -- refresh on next event loop tick
  end,
})

