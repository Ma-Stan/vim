" Plugins
call plug#begin('~/.config/plugins-nvim/')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'farmergreg/vim-lastplace'
Plug 'Chiel92/vim-autoformat'

" Plug 'tanvirtin/monokai.nvim'
" Plug 'crusoexia/vim-monokai'
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'kaicataldo/material.vim'

" TPOPE!
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sleuth'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'ggandor/leap.nvim'
Plug 'ggandor/lightspeed.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/playground'
call plug#end()

" colorscheme monokai_pro
let g:sonokai_style='atlantis'
set termguicolors

"Sets
set hidden
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
set noswapfile
set laststatus=2
set scrolloff=6
set wildmode=list:longest
set completeopt=menu,menuone,noselect " nvim-compe depends on this
set clipboard=
" set clipboard=unnamedplus
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

nnoremap <leader>y "*y
vnoremap <leader>y "*y

let g:surround_99 = "/* \r */"
let g:surround_40 = "(\r)"
let g:surround_91 = "[\r]"
let g:surround_123 = "{\r}"

command SrcConf source $MYVIMRC

augroup lightspeedworkaround
  autocmd!
  autocmd WinEnter * set scrolloff=6
augroup END

function StatuslineFn()
  let sl = ""
  if &filetype == "help"
    let sl = sl ."%t"
  else
    let sl = sl . "%f"
  endif
  let sl = sl ."%h%m%r%=%-14.(%l,%c%V)\ %P"
  if &modified
    let sl = "%#StatusLnModified#" . sl
  endif
  return sl
endfunction

set statusline=%{%StatuslineFn()%}

augroup resized
  autocmd!
  autocmd VimResized * wincmd =
augroup END

function SetColorschemeCmd(scheme)
  if get(g:, 'colors_name', 'default') == a:scheme
    return
  endif
  exec 'colorscheme ' . a:scheme
  highlight StatusLnModified ctermfg=232 ctermbg=221 guifg=#262626 guibg=#ffd75f
  if mode() == 'c'
    let old_command = getcmdtype() . getcmeline()
    call feedkeys("\<Esc>".old_command,'t')
  endi
endfunction

function LargeFileSearchConf()
  setl shortmess+=S
  setl noatuoread
endfunction

augroup LargeFiles
  autocmd!
  autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 1024 * 1024 * 100 | call LargeFileSearchConf() | endif
augroup END

function WarnFunc()
  let act_tab = getwininfo(win_getid())[0].tabnr
  for win_id in nvim_list_wins()
    let winfo = getwininfo(win_id)[0]
    if winfo.tabnr == act_tab
      let binfo = getbufinfo(winfo.bufnr)[0]
      if binfo.changed && filereadable(binfo.name)
        call SetColorschemeCmd('dogrun')
      endif
    endif
  endfor
endfunction

augroup WarnLoseFocus
  autocmd!
  autocmd FocusLost * ++nested call WarnFunc()
  autocmd FocusGained * ++nested call SetColorschemeCmd('sonokai')
augroup END

call SetColorschemeCmd('sonokai')

"use base conda when working with virtualenvs
" let g:python3_host_prog=expand('~/anaconda3/bin/python3')

"Configure pluings
lua require('config')
