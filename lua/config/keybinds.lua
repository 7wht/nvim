vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>fe", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "<leader>E", function()
  vim.cmd("NvimTreeToggle")
  vim.cmd("bdelete #")
end)

vim.keymap.set("n", "<leader>cd", function()
  local p = vim.fn.input("Nvim-Tree root dir: ", vim.fn.getcwd() .. "/", "dir")
  if p and p ~= "" then
    vim.cmd("cd " .. vim.fn.fnameescape(p))
    vim.cmd("NvimTreeToggle")
    vim.cmd("NvimTreeToggle")
  end
end, { desc = "Set Nvim-Tree root (cwd) to dir" })

vim.keymap.set("n", "<leader>h", vim.cmd.Oil)
vim.keymap.set("n", "L", ":bnext<CR>")
vim.keymap.set("n", "H", ":bprev<CR>")
vim.keymap.set("n", "<leader>bd", ":bd!<CR>")
vim.keymap.set("n", "<leader>bad", ":silent! %bd<CR>")

-- move between split windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set("n", "<C-o>", "<C-w>o")
vim.keymap.set("n", "<C-.>", "<C-w>>")
vim.keymap.set("n", "<C-,>", "<C-w><")
vim.keymap.set("n", "<C-=>", "<C-w>+")
vim.keymap.set("n", "<C-->", "<C-w>-")

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Q', 'q', {})

vim.keymap.set('t', '<M-z>', '<C-\\><C-n>')

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.api.nvim_create_autocmd({ 'TextYankPost', }, {
    desc = 'Highlight when yanking (copying) text',
    callback = function() vim.hl.on_yank() end,
})




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

vim.keymap.set({ "n", "t" }, "<C-/>", toggle_terminal, { desc = "Toggle Terminal Split" })

vim.keymap.set("n", "<leader>t", function()
  toggle_terminal()
  toggle_terminal()
  vim.cmd("b bash")
end)

