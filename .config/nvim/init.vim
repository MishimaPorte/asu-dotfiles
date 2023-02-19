filetype on
filetype plugin on
filetype indent on
:set number
:set relativenumber
:set cursorline
:set shiftwidth=4
:set tabstop=4
:set expandtab
:set nobackup
:set scrolloff=10
:set incsearch
:set ignorecase
:set smartcase
:set showmode
:set showmatch
:set hlsearch
:set history=1000
:set wildmenu
:set wildmode=list:longest
:set wildignore=*docx,*.jpg,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
:set belloff=all

call plug#begin()

Plug 'tpope/vim-surround' " surroundigs
Plug 'preservim/nerdtree' " filesystem browser
Plug 'tpope/vim-commentary' " gcc
Plug 'vim-airline/vim-airline' " status bar
Plug 'lifepillar/pgsql.vim' " psql syntax highlight
Plug 'ap/vim-css-color' " color name highlighter 
Plug 'rafi/awesome-vim-colorschemes' " collection of colorschemes
Plug 'ryanoasis/vim-devicons' " adds filetype glyphs
Plug 'tc50cal/vim-terminal' " terminal execution
Plug 'preservim/tagbar' " tagbar
Plug 'terryma/vim-multiple-cursors' " multipliple cursor
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'

call plug#end()

:nmap <F8> :TagbarToggle<CR>
:noremap <C-k> :NERDTree<CR>
:noremap <C-t> :Terminal bash<CR>

:lua << EOF
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}


require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- The following example advertise capabilities to `clangd`.
require('lspconfig').clangd.setup {
  capabilities = capabilities,
}

EOF

