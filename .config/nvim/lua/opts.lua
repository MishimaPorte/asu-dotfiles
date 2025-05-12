vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('filetype plugin indent on')
vim.opt.number = true
vim.opt.syntax = "on"
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.shiftwidth=4
vim.opt.tabstop=4
vim.opt.expandtab = true
vim.cmd(':set nobackup')
vim.opt.scrolloff=10
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.history=1000
vim.opt.wildmenu = true
vim.cmd(':set wildmode=list:longest')
vim.cmd(':set wildignore=*docx,*.jpg,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx')
vim.opt.belloff='all'
vim.g.mapleader = ';'
vim.opt.completeopt="longest"

