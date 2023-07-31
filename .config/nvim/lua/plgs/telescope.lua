local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true
        }
    },
      defaults = {
        mappings = {
          i = {
            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
          },
          n = {
            ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
            ["O"] = actions.select_tab,
            ["o"] = actions.select_default,
          }
        }
      },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>ft', builtin.treesitter, opts)
vim.keymap.set('n', '<leader>fh', '<cmd>:Telescope todo-comments todo<CR>', opts)
vim.keymap.set('n', '<leader>d', function() actions.delete_buffer() end)

