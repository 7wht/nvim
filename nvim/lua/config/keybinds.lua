vim.g.mapleader = " "


vim.keymap.set("n", "<leader>w", ":set wrap!<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- make opened file exectuable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", vim.cmd.Neogit)

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>fe", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "<leader>E", function()
  vim.cmd("NvimTreeToggle")
  vim.cmd("bdelete #")
end)

vim.keymap.set("n", "<leader>cd", function()
  local b = require("oil").get_current_dir()
  if !b then
    b = vim.fn.getcwd()
  end
  local p = vim.fn.input("Nvim-Tree root dir: ", b .. "", "dir")
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

vim.keymap.set("v" , "<", "<gv")
vim.keymap.set("v" , ">", ">gv")

vim.api.nvim_create_autocmd({ 'TextYankPost', }, {
    desc = 'Highlight when yanking (copying) text',
    callback = function() vim.hl.on_yank() end,
})

vim.keymap.set("n", "<leader>x", function()
  local file = vim.fn.expand("%:~:.")
  local ext2 = file:gsub(".*%.(.*)%..*$", "%1")
  if ext2 == "tar" then
    local keys = vim.api.nvim_replace_termcodes(":!tar xf " .. file, true, false, true)
    vim.api.nvim_feedkeys(keys, "m", false)
  else
    local keys = vim.api.nvim_replace_termcodes(":!7z x " .. file, true, false, true)
    vim.api.nvim_feedkeys(keys, "m", false)
  end
end)



vim.keymap.set("n", "<leader><tab>", function()
  if vim.opt.expandtab:get() == false then
    vim.opt.expandtab = true
    print("expandtab: enabled")
  else
    vim.opt.expandtab = false
    print("expandtab: disabled")
  end
end)
vim.keymap.set("n", "<leader>n<tab>", function()
    vim.ui.input({ prompt = "set tabstop and shiftwidth: " }, function(input)
    if input then
      local num = tonumber(input)
        if num == nil then
          print("invalid number")
        else
        vim.opt.tabstop = num
        vim.opt.shiftwidth = num
        print("changed to " .. tostring(num))
      end
    end
  end)
end)

