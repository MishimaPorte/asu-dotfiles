null_ls = require("null-ls")

local sources = {
  -- python
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,
}

null_ls.setup({ sources = sources })


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
      vim.lsp.buf.format()
  end,
  group = format_sync_grp,
})
