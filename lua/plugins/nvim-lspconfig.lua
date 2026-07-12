vim.api.nvim_create_user_command("LSPToggle", function ()
  vim.g.lsp = not vim.g.lsp
  if vim.g.lsp then
    vim.opt.signcolumn = "yes:1"
    vim.cmd.packadd("nvim-lspconfig.nvim")

    vim.lsp.config("lua_ls", {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
      settings = {
        Lua = {
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })

    vim.lsp.enable({
      "lua_ls",
      "rust_analyzer",
      "clangd",
      "ty",
    })
  else
    local active_clients = vim.lsp.get_clients()

    for _, client in ipairs(active_clients) do
        vim.cmd('lsp stop', client.name)
    end
    vim.opt.signcolumn = "auto"
  end
end, {})


-- sudo pacman -S --needed clang ty rust-analyzer lua-language-server

