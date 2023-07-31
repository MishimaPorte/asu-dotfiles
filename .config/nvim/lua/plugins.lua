local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'm4xshen/autoclose.nvim' -- autobrackets 30th of july year two thousand twenty third
Plug 'tpope/vim-surround' -- surroundigs
Plug 'preservim/nerdtree' -- filesystem browser
Plug 'tpope/vim-commentary' -- gcc
Plug 'vim-airline/vim-airline' -- status bar
Plug 'lifepillar/pgsql.vim' -- psql syntax highlight
Plug 'ap/vim-css-color' -- color name highlighter 
Plug 'rafi/awesome-vim-colorschemes' -- collection of colorschemes
Plug 'ryanoasis/vim-devicons' -- adds filetype glyphs
Plug 'nikvdp/neomux' -- terminal execution
Plug 'preservim/tagbar' -- tagbar
Plug 'terryma/vim-multiple-cursors' -- multipliple cursor
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag= '0.1.1' }) -- file searching tool
Plug 'mrcjkb/haskell-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter' -- tresitter for intelligent syntax highlight
Plug 'nvim-treesitter/playground'
Plug 'folke/tokyonight.nvim'
Plug "RRethy/nvim-base16"
Plug "tweekmonster/impsort.vim"
Plug 'tanvirtin/vgit.nvim' -- git integration
Plug 'crispgm/nvim-tabline'

Plug 'mfussenegger/nvim-dap' -- DAP, finally. 20 06 2023
Plug 'rcarriga/nvim-dap-ui' -- vscode-like dap monstrocity, 22 06 2023

Plug 'sudormrfbin/cheatsheet.nvim' -- hotkey finder
Plug 'nvim-lua/popup.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'onsails/lspkind-nvim'

Plug ('L3MON4D3/LuaSnip', {tag='v2.*', ['do'] = 'make install_jsregexp'})
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon' -- some prime not working monstrocity, ?? 04 2023
Plug 'numToStr/Comment.nvim' -- comments
Plug 'folke/todo-comments.nvim' -- todos 22 06 2023

Plug "jose-elias-alvarez/null-ls.nvim"


Plug ('olexsmir/gopher.nvim', {config = function()
      require('plugins.gopher')
    end})
Plug 'ray-x/go.nvim'
Plug 'kyazdani42/nvim-web-devicons' -- working finally, 22 06 2023

vim.call('plug#end')

require('Comment').setup({
    opleader = { line = '|'},
})

require('todo-comments').setup({})

require('nvim-web-devicons').setup({ default = true; })


mason_lspconfig = require("mason-lspconfig")

require("mason").setup({})

mason_lspconfig.setup({})

mason_lspconfig.setup_handlers {
function(server_name)
  require("lspconfig")[server_name].setup({})
end
}

require("autoclose").setup({
})


require("plgs.gonvim")
require("plgs.py")
require("plgs.git")

require("plgs.dap")
require("plgs.telescope")
require("plgs.bar")
