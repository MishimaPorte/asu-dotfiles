local Plug = vim.fn['plug#']

vim.call('plug#begin')

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
Plug 'Mofiqul/vscode.nvim'
Plug "RRethy/nvim-base16"
Plug "tweekmonster/impsort.vim"

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'numToStr/Comment.nvim'
Plug "jose-elias-alvarez/null-ls.nvim"


Plug ('olexsmir/gopher.nvim', {config = function()
      require('plugins.gopher')
    end})
Plug 'ray-x/go.nvim'
Plug 'kyazdani42/nvim-web-devicons' -- not working
vim.call('plug#end')


require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

require('Comment').setup({
    opleader = { line = '|'},
})

require('nvim-web-devicons').setup({ default = true; }) -- not working somehow


mason_lspconfig = require("mason-lspconfig")

require("mason").setup({})

mason_lspconfig.setup({})
mason_lspconfig.setup_handlers {
function(server_name)
  require("lspconfig")[server_name].setup({})
end
}

require("plgs.gonvim")
require("plgs.py")
