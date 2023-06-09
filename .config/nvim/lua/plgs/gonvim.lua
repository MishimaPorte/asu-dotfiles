require('go').setup()
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
local opts = { noremap=true, silent=true }

vim.keymap.set('n', 'tt', '<cmd>:GoAddTag<CR>', opts)
vim.keymap.set('n', 'tr', '<cmd>:GoRmTag<CR>', opts)
