vgit = require('vgit')
vgit.setup()
local opts = { noremap=true, silent=true }

-- this is called "addiction"
vim.keymap.set('n', '<leader>gd', vgit.buffer_diff_preview, opts)
vim.keymap.set('n', '<leader>gh', vgit.buffer_hunk_preview, opts)
vim.keymap.set('n', '<leader>gs', vgit.buffer_stage, opts)
vim.keymap.set('n', '<leader>gu', vgit.buffer_unstage, opts)
vim.keymap.set('n', '<leader>gk', vgit.hunk_up, opts)
vim.keymap.set('n', '<leader>gj', vgit.hunk_down, opts)
vim.keymap.set('n', '<leader>ghs', vgit.buffer_hunk_stage, opts)
vim.keymap.set('n', '<leader>ghu', vgit.buffer_hunk_reset, opts)
