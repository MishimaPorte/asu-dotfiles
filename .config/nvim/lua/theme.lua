hl = vim.api.nvim_set_hl
local c = require('vscode.colors').get_colors()
    -- Python
vim.o.background = "dark"
require('vscode').setup({})
hl(0, '@constant', { fg = "#4fc1ff", bg = 'NONE' })
hl(0, '@type.builtin', { fg = c.vscBlueGreen, bg = 'NONE' })
hl(0, '@string.escape', { fg = c.vscYellowOrange, bg = c.vscYellowOrange })
--hl(0, 'pythonIncludeLine', { fg = c.vscBlueGreen, bg = 'NONE' })
--hl(0, 'pythonImportedModule', { fg = c.vscBlueGreen, bg = 'NONE' })

