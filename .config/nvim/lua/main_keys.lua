local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<F8>', '<cmd>:TagbarToggle<CR>') 
vim.keymap.set('n', '<F2>', '<cmd>:NERDTree<CR>') 

vim.keymap.set('n', '<leader><Tab>', '<cmd>:tabnew<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>:tabclose<CR>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)


vim.cmd("\
nnoremap <C-h> <C-w>h\
nnoremap <C-j> <C-w>j\
nnoremap <C-k> <C-w>k\
nnoremap <C-l> <C-w>l\
nnoremap <Space> @q\
nnoremap <C-Space> \
vnoremap <C-Space> \
")
