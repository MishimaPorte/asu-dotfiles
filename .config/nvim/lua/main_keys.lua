local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<F8>', '<cmd>:TagbarToggle<CR>') 
vim.keymap.set('n', '<F2>', '<cmd>:NERDTree<CR>') 

vim.keymap.set('n', '<leader>t', '<cmd>:Neomux<CR>')
vim.g.neomux_start_term_split_map = "<leader>t"
vim.g.neomux_start_term_vsplit_map = "<leader>vt"
vim.g.neomux_winjump_map_prefix = "<leader>w"
vim.g.neomux_exit_term_mode_map = ""
vim.g.neomux_default_shell = "zsh"

vim.keymap.set('n', '<leader>T', '<cmd>:tabnew<CR>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

-- HARPOON settings (lol)
local harpoon = require('harpoon')
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
local harpoon_cmd_ui = require('harpoon.cmd-ui')
harpoon_settings = {
    save_on_toggle = false,

    save_on_change = true,

    enter_on_sendcmd = false,

    tmux_autoclose_windows = false,

    excluded_filetypes = { "harpoon" },

    mark_branch = false,
}
harpoon.setup(harpoon_settings)
vim.keymap.set('n', '<leader>p', harpoon_ui.nav_prev, opts)
vim.keymap.set('n', '<leader>n', harpoon_ui.nav_next, opts)
vim.keymap.set('n', '<F3>', harpoon_cmd_ui.toggle_quick_menu, opts)
vim.keymap.set('n', '<leader>a', harpoon_mark.add_file, opts)
vim.keymap.set('n', '<leader>1', function() harpoon_ui.nav_file(1) end, opts)
vim.keymap.set('n', '<leader>2', function() harpoon_ui.nav_file(2) end, opts)
vim.keymap.set('n', '<leader>3', function() harpoon_ui.nav_file(3) end, opts)
vim.keymap.set('n', '<leader>4', function() harpoon_ui.nav_file(4) end, opts)
vim.keymap.set('n', '<leader>5', function() harpoon_ui.nav_file(5) end, opts)

vim.cmd("\
nnoremap <C-h> <C-w>h\
nnoremap <C-j> <C-w>j\
nnoremap <C-k> <C-w>k\
nnoremap <C-l> <C-w>l\
inoremap <C-Space> <C-x><C-o>\
")
