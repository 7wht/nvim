vim.cmd.packadd("opencode.nvim")

vim.keymap.set({ "n", "x" }, "<leader><C-a>",   function() require("opencode").ask("@this: ") end,                    { desc = "Ask OpenCode…" })
vim.keymap.set({ "n", "x" }, "go",      function() return require("opencode").operator("@this ") end,         { desc = "Append range to OpenCode", expr = true })

vim.opt.rulerformat =
  [[%=%{strcharpart(luaeval("require('opencode').statusline()"), 0, 1) == '󰚩' ? strcharpart(luaeval("require('opencode').statusline()"), 0, 1) : ''}  %p%%]]

