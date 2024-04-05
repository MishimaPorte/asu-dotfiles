local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-neotest/nvim-nio'
Plug 'mfussenegger/nvim-jdtls'                                            -- java (experimental) 10 10 23

Plug 'godlygeek/tabular'                                                  -- alignment plugin, 11 01 24
Plug ('vhyrro/luarocks.nvim', {rocks = { "fzy", "pathlib.nvim ~> 1.0" }})

Plug 'm4xshen/autoclose.nvim'                                             -- autobrackets 30th of july year two thousand twenty third
Plug 'tpope/vim-surround'                                                 -- surroundigs
Plug ('ms-jpq/chadtree', {branch = 'chad', ['do'] = 'python3 -m chadtree deps'}) -- filesystem browser
-- Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'                                               -- gcc
Plug 'vim-airline/vim-airline'                                            -- status bar
Plug 'lifepillar/pgsql.vim'                                               -- psql syntax highlight
Plug 'ap/vim-css-color'                                                   -- color name highlighter
Plug 'rafi/awesome-vim-colorschemes'                                      -- collection of colorschemes
Plug 'ryanoasis/vim-devicons'                                             -- adds filetype glyphs
Plug 'nikvdp/neomux'                                                      -- terminal execution
Plug 'preservim/tagbar'                                                   -- tagbar
Plug 'terryma/vim-multiple-cursors'                                       -- multipliple cursor
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag= '0.1.4' })                  -- file searching tool
Plug 'mrcjkb/haskell-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter'                                    -- tresitter for intelligent syntax highlight
Plug 'nvim-treesitter/playground'
Plug 'folke/tokyonight.nvim'
Plug "RRethy/nvim-base16"
Plug "tweekmonster/impsort.vim"
Plug 'tanvirtin/vgit.nvim'                                                -- git integration
Plug 'crispgm/nvim-tabline'
Plug 'anuvyklack/pretty-fold.nvim'                                        -- pretty folding 28 08 23
Plug "rest-nvim/rest.nvim"                                                -- rest api thing 10 02 2023
Plug "hsanson/vim-android"                                                -- for android development presumably 27 01 2024

Plug 'mfussenegger/nvim-dap'                                              -- DAP, finally. 20 06 2023
Plug 'rcarriga/nvim-dap-ui'                                               -- vscode-like dap monstrocity, 22 06 2023
Plug 'leoluz/nvim-dap-go'                                                 -- GOLANG DEBUGGING TECHNOLOGY, the sixth of march, year 2024

Plug 'sudormrfbin/cheatsheet.nvim'                                        -- hotkey finder
Plug 'nvim-lua/popup.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

Plug ('L3MON4D3/LuaSnip', {tag='v2.*', ['do'] = 'make install_jsregexp'})
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'ray-x/lsp_signature.nvim'                                           -- function argumets completion 18 08 2023

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'                                               -- some prime not working monstrocity, ?? 04 2023
Plug 'numToStr/Comment.nvim'                                              -- comments
Plug 'folke/todo-comments.nvim'                                           -- todos 22 06 2023

Plug "jose-elias-alvarez/null-ls.nvim"

Plug "MunifTanjim/nui.nvim"
Plug "kndndrj/nvim-dbee"
Plug "towolf/vim-helm"                                                    -- helm charts 24 08 2023

Plug ('olexsmir/gopher.nvim', {config = function()
      require('plugins.gopher')
end})

Plug 'ray-x/go.nvim'
Plug 'kyazdani42/nvim-web-devicons'                                       -- working finally, 22 06 2023

vim.call('plug#end')

require("luarocks-nvim").setup({rocks = { "lua-curl", "mimetypes", "xml2lua" }})
require("nio")

local rest = require("rest-nvim")
rest.setup({
    skip_ssl_verification = true,
    result = {
        split = {
            stay_in_current_window_after_split = false,
        }
    }
})

vim.keymap.set('n', '<leader>rr', "<cmd>:Rest run<CR>", opts)
vim.keymap.set('n', '<leader>rl', "<cmd>:Rest run last<CR>", opts)
require("autoclose").setup({})
require('pretty-fold').setup({
   sections = {
      left = { 'content' },
      right = {
         ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
         function(config) return config.fill_char:rep(20) end
      }
   },
   fill_char = '•',
   process_comment_signs = 'delete',
   add_close_pattern = true,
})
require('todo-comments').setup({})
require('nvim-web-devicons').setup({ default = true; })
require('Comment').setup({
    opleader = { line = '|'},
})

require("plgs.dap")
require("plgs.gonvim")
require("plgs.py")
require("plgs.git")

require("plgs.telescope")
-- require("plgs.bar")
require("plgs.harpoon")
require("plgs.dbee")
