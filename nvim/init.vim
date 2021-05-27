" Plugins
call plug#begin('~/.vim/nvim/plugged/')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'farmergreg/vim-lastplace'
Plug 'Chiel92/vim-autoformat'

" TPOPE!
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


"Sets
set hidden
set ignorecase
set smartcase
set number
set relativenumber
set expandtab
set shiftwidth=4
set softtabstop=4
set nowrap
set laststatus=2
set scrolloff=4
set path+=**
set wildmode=list:longest
set completeopt=menuone,noselect " nvim-compe depends on this
"TODO: Status line
"set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set nohlsearch
set signcolumn=yes
"j is down therefore the left of the two braces should go down
nnoremap { }
nnoremap } {
nnoremap Q <nop>
nnoremap q: <nop>
nnoremap <leader>qn <cmd>cnext<cr>
nnoremap <leader>qp <cmd>cprevious<cr>
nnoremap <leader>qc <cmd>cclose<cr>
nnoremap <leader>qo <cmd>copen<cr>

"use base conda when working with virtualenvs
let g:python3_host_prog=expand('~/anaconda3/bin/python3')

"Configure pluings
lua require('config')
