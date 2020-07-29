call plug#begin(stdpath('data') . '/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"Settings
set background=dark
set clipboard=unnamed
set colorcolumn=80
set nohlsearch
set number relativenumber
set smartindent
set termguicolors
set updatetime=100

"Use spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

colorscheme iceberg
highlight ColorColumn ctermbg=235 guibg=#1e2132

let mapleader = " "
let g:rainbow_active=0

"Keymaps
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>s :w<CR>:source %<CR>

tnoremap <C-e> <C-\><C-n>

nnoremap <Space> <nop>

"https://aonemd.github.io/blog/handy-keymaps-in-vim
"Move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"Filetype specific config
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2
autocmd Filetype python setlocal colorcolumn=100
