local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<F8>', '<cmd>:TagbarToggle<CR>') 
vim.keymap.set('n', '<C-k>', '<cmd>:NERDTree<CR>') 

vim.keymap.set('n', '<leader>t', '<cmd>:Neomux<CR>')
vim.g.neomux_start_term_split_map = "<leader>t"
vim.g.neomux_start_term_vsplit_map = "<leader>vt"
vim.g.neomux_winjump_map_prefix = "<leader>w"
vim.g.neomux_exit_term_mode_map = ""
vim.g.neomux_default_shell = "zsh"

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

