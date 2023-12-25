local jdtls = require('jdtls')
jdtls.start_or_attach({
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
})

local bufopts = { noremap=true, silent=true }
-- vim.keymap.set('n', 'gD', jdtls.lsp.buf.declaration, bufopts)
-- vim.keymap.set('n', 'gd', jdtls.buf.definition, bufopts)
-- vim.keymap.set('n', 'K', jdtls.buf.hover, bufopts)
-- vim.keymap.set('n', 'gi', jdtls.buf.implementation, bufopts)
-- -- vim.keymap.set('n', '<C-s>', jdtls.buf., bufopts)
-- vim.keymap.set('n', '<leader>D', jdtls.buf.type_definition, bufopts)
-- vim.keymap.set('n', '<leader>rn', jdtls.buf.rename, bufopts)
-- vim.keymap.set('n', '<leader>ca', jdtls.buf.code_action, bufopts)
-- vim.keymap.set('v', '<leader>ca', jdtls.buf.code_action, bufopts)
-- vim.keymap.set('n', 'gr', jdtls.buf.references, bufopts)
