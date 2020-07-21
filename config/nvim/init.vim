call plug#begin(stdpath('data') . '/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
colorscheme iceberg

"Settings
set nohlsearch
set number relativenumber
set updatetime=100
set termguicolors

vnoremap <Space> <nop>
nnoremap <Space> <nop>
let mapleader = " "
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>s :w<CR>:source %<CR>
tnoremap <C-e> <C-\><C-n>
let g:rainbow_active = 0

"https://aonemd.github.io/blog/handy-keymaps-in-vim
"move to the split in the direction shown, or create a new split
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

