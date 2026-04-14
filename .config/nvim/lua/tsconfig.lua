ts = require("nvim-treesitter")
ts.setup()
ts.install({ "c", "lua", "vim", "vimdoc", "python", "haskell", "javascript" })
vim.treesitter.language.register("html", "gotmpl")
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if vim.list_contains(ts.get_available(), lang) then
      if not vim.list_contains(ts.get_installed(), lang) then
        ts.install(lang):wait()
      end

      vim.treesitter.start(args.buf)
    end
  end,
  desc = "enable nvim-treesitter and install parser if not installed",
})

-- ts.setup {
--   ensure_installed = ,
--   sync_install = false,
--   auto_install = true,
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
--   incremental_selection = {
--       enable = true,
--       keymaps = {
--         init_selection = "T",
--         node_incremental = "T",
--         scope_incremental = "Y",
--         node_decremental = "F",
--       },
--     },
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false, -- Whether the query persists across vim sessions
--     keybindings = {
--       toggle_query_editor = 'o',
--       toggle_hl_groups = 'i',
--       toggle_injected_languages = 't',
--       toggle_anonymous_nodes = 'a',
--       toggle_language_display = 'I',
--       focus_language = 'f',
--       unfocus_language = 'F',
--       update = 'R',
--       goto_node = '<cr>',
--       show_help = '?',
--     },
--   }
-- }

vim.api.nvim_create_autocmd("VimEnter", {command = "TSEnable highlight"})
