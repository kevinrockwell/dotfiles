call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()
colorscheme iceberg

"Settings
set nohlsearch
set number
set updatetime=100

nnoremap <Space> <nop>
let mapleader =" "
map <leader>o :setlocal spell! spelllang=en_us<CR>
tnoremap <C-e> <C-\><C-n>
nnoremap <C-j> <C-w>w


"https://aonemd.github.io/blog/handy-keymaps-in-vim
"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

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

