local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<F8>', '<cmd>:TagbarToggle<CR>') 
vim.keymap.set('n', '<F2>', '<cmd>:CHADopen<CR>') 

vim.keymap.set('n', '<leader><Tab>', '<cmd>:tabnew<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>:tabclose<CR>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

vim.cmd([[

tnoremap <C-h> <C-\\><C-o><C-w>h
tnoremap <C-k> <C-\\><C-o><C-w>k
tnoremap <C-l> <C-\\><C-o><C-w>l
tnoremap <C-j> <C-\\><C-o><C-w>j

nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

nnoremap <Space> @q
nnoremap <C-Space> 
vnoremap <C-Space> 
vnoremap <leader>e :!sh<CR>
]])
-- vim.api.nvim_create_user_command('Baza', 'lua require("dbee").open()', {})
