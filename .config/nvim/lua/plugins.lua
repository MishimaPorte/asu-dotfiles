local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'nvim-neotest/nvim-nio'

Plug 'godlygeek/tabular'                                                  -- alignment plugin, 11 01 24
Plug ('vhyrro/luarocks.nvim', {rocks = { "fzy", "pathlib.nvim ~> 1.0" }})

Plug 'perillo/qbe.vim'                                                    -- qbe (compiler backend) plugin 02 03 2024
Plug 'm4xshen/autoclose.nvim'                                             -- autobrackets 30th of july year two thousand twenty third
Plug 'tpope/vim-surround'                                                 -- surroundigs
Plug 'tpope/vim-fugitive'                                                 -- git
Plug 'tpope/vim-commentary'                                               -- gcc
Plug 'tpope/vim-fugitive'                                                 -- vim git shit cause the mustache guy recommended
Plug 'vim-airline/vim-airline'                                            -- status bar
Plug 'lifepillar/pgsql.vim'                                               -- psql syntax highlight
Plug 'ap/vim-css-color'                                                   -- color name highlighter
Plug 'rafi/awesome-vim-colorschemes'                                      -- collection of colorschemes
Plug 'ryanoasis/vim-devicons'                                             -- adds filetype glyphs
Plug 'nikvdp/neomux'                                                      -- terminal execution
Plug 'preservim/tagbar'                                                   -- tagbar
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'                                      -- file searching tool
Plug 'mrcjkb/haskell-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter'                                    -- tresitter for intelligent syntax highlight
Plug 'nvim-treesitter/playground'
Plug 'folke/tokyonight.nvim'
Plug "RRethy/nvim-base16"
Plug 'crispgm/nvim-tabline'
Plug 'mfussenegger/nvim-dap'                                              -- DAP, finally. 20 06 2023
Plug 'rcarriga/nvim-dap-ui'                                               -- vscode-like dap monstrocity, 22 06 2023
Plug 'leoluz/nvim-dap-go'                                                 -- GOLANG DEBUGGING TECHNOLOGY, the sixth of march, year 2024

-- Plug 'sudormrfbin/cheatsheet.nvim'                                        -- hotkey finder
-- Plug 'nvim-lua/popup.nvim'

Plug 'neovim/nvim-lspconfig'

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

Plug "jose-elias-alvarez/null-ls.nvim"

Plug "MunifTanjim/nui.nvim"

Plug ('olexsmir/gopher.nvim', {config = function()
      require('plugins.gopher')
end})

Plug 'ray-x/go.nvim'
Plug 'kyazdani42/nvim-web-devicons'                                       -- working finally, 22 06 2023
Plug 'ray-x/guihua.lua'
Plug 'nvim-neo-tree/neo-tree.nvim'

vim.call('plug#end')

require("autoclose").setup({})
require('nvim-web-devicons').setup({ default = true; })
require('Comment').setup({
    opleader = { line = '|'},
})

require("plgs.dap")
require("plgs.gonvim")
require("plgs.py")

require("plgs.telescope")
require("plgs.harpoon")

