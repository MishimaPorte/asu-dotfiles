require('go').setup()
local util = require('lspconfig.util')
local path = util.path
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
local opts = { noremap=true, silent=true }

-- vim.api.nvim_create_user_command('Upper', 'echo toupper(<q-args>)', { nargs = 1 })

vim.keymap.set('n', 'tt', '<cmd>:GoAddTag<CR>', opts)
vim.keymap.set('n', 'tr', '<cmd>:GoRmTag<CR>', opts)

local function get_maingo(workspace)
  local match = vim.fn.glob(path.join(vim.fn.getcwd(), "*", 'main.go'))
  if match ~= '' then
      return match
  end
  match = vim.fn.glob(path.join(vim.fn.getcwd(), 'main.go'))
  if match ~= '' then
      return match
  end

  return vim.fn.input("main go: ", "", "file")
end
require('dap-go').setup({
   dap_configurations = {
     {
           type = "go",
           name = "maingo",
           request = "launch",
           program = get_maingo,
           buildFlags = "",
     }
  }
})
