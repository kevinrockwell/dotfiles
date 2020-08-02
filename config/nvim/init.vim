call plug#begin(stdpath('data') . '/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"Map Leader
let mapleader = " "
nnoremap <space> <Nop>

"vim Settings
set background=dark
set clipboard=unnamed
set colorcolumn=80
set nohlsearch
set number relativenumber
set pyxversion=3
set smartindent
set termguicolors
set updatetime=100

"Plugin settings
"Disable rainbow parentheses by default
let g:rainbow_active=0

"coc
"Confirm first item on <cr> if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Use tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Symbol renaming.
map <leader>n <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Use spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

colorscheme iceberg
highlight ColorColumn ctermbg=235 guibg=#1e2132


"Keymaps
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>s :w<CR>:source %<CR>

"Use Tab/S-Tab to change indentation
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

"Use C-e to enter normal mode in terminal
tnoremap <C-e> <C-\><C-n>

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
