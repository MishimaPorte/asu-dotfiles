ts = require('nvim-treesitter.configs')
ts.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "haskell", "javascript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "T",
        node_incremental = "T",
        scope_incremental = "Y",
        node_decremental = "F",
      },
    },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- require'treesitter-context'.setup{enable = false}

vim.api.nvim_create_autocmd("VimEnter", {command = "TSEnable highlight"})
