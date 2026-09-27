vim.o.guifont = "JetBrainsMonoNL Nerd Font:h20:b" -- text below applies for VimScript:


vim.opt.mouse = "a"


vim.keymap.set({ "n", "v" }, "<A-=>", function()
  vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) + 0.1
end)

vim.keymap.set({ "n", "v" }, "<A-->", function()
  vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1.0) - 0.1
end)

vim.keymap.set({ "n", "v" }, "<A-0>", function()
  vim.g.neovide_scale_factor = 1.0
end)

vim.keymap.set("i", "<C-S-v>", function()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { desc = "Paste from system clipboard" })

-- terminal
local term_buf = nil
local term_win = nil

local function toggle_terminal()
  -- If the terminal window is open and valid, close it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- Calculate target height based on a percentage of total editor lines
  local percentage = 0.40 -- 30% of the screen height
  local total_height = vim.o.lines
  local target_height = math.floor(total_height * percentage)

  -- Open a horizontal split at the bottom
  vim.cmd("botright split")
  term_win = vim.api.nvim_get_current_win()

  -- Apply the percentage-based height
  vim.api.nvim_win_set_height(term_win, target_height)

  -- If the terminal buffer exists and is valid, reuse it
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_set_current_buf(term_buf)
  else
    -- Otherwise, open a fresh terminal and grab its buffer ID
    vim.cmd("term")
    vim.opt.ft = "Terminal"
    term_buf = vim.api.nvim_get_current_buf()
  end

  -- Automatically enter insert mode when opening the terminal
  vim.cmd("startinsert")
end

vim.keymap.set({ "n", "t" }, "<A-/>", toggle_terminal, { desc = "Toggle Terminal Split" })

vim.keymap.set("n", "<A-t>", function()
  toggle_terminal()
  toggle_terminal()
  vim.cmd("b zsh")
end)

local cursor_animation_length = vim.g.neovide_cursor_animation_length or 0.13
local cursor_animation_enabled = cursor_animation_length > 0

function ToggleNeovideCursorAnimation()
  if cursor_animation_enabled then
    vim.g.neovide_cursor_animation_length = 0
    cursor_animation_enabled = false
  else
    vim.g.neovide_cursor_animation_length = cursor_animation_length
    cursor_animation_enabled = true
  end
end

vim.keymap.set("n", "<leader>uc", ToggleNeovideCursorAnimation, {
  desc = "Toggle Neovide cursor animation",
})

local cursor_animation_length = vim.g.neovide_cursor_animation_length or 0.13
local cursor_animation_enabled = cursor_animation_length > 0

function ToggleNeovideCursorAnimation()
  if cursor_animation_enabled then
    vim.g.neovide_cursor_animation_length = 0
    cursor_animation_enabled = false
  else
    vim.g.neovide_cursor_animation_length = cursor_animation_length
    cursor_animation_enabled = true
  end
end

vim.keymap.set("n", "<A-a>", ToggleNeovideCursorAnimation, {
  desc = "Toggle Neovide cursor animation",
})

vim.opt.cmdheight= 0
require("plugins.lualine")

