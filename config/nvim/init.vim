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
Plug 'vim-crystal/vim-crystal'
call plug#end()

"Map Leader
let mapleader = " "
nnoremap <space> <Nop>

"vim Settings
set background=dark
set clipboard=unnamed
set colorcolumn=80
set nohlsearch
set nomodelineexpr
set nowrap
set number relativenumber
set pyxversion=3
set smartindent
set termguicolors
set updatetime=100

"set python version
let g:python3_host_prog="/usr/local/bin/python3"

"Plugin settings
"Disable rainbow parentheses by default
let g:rainbow_active=0

"coc
"Confirm first item on <cr> if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Use tab to navigate completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

"Use spaces instead of tabs
set expandtab
set shiftwidth=4
set tabstop=4

colorscheme iceberg
highlight ColorColumn ctermbg=235 guibg=#1e2132


"Keymaps
nmap <leader>l :execute ":!command black '" . expand('%:p') . "'"<CR>
nmap <leader>o :setlocal spell! spelllang=en_us<CR>
nmap <leader>p :execute ":!command pandoc '" . expand('%:p') . "' --from=gfm --pdf-engine=wkhtmltopdf --output '" . expand('%:r') . ".pdf' && open '" . expand('%:r') . ".pdf'"<CR>
nmap <leader>r :RainbowToggle<CR>
nmap <leader>s :w<CR>:source %<CR>
nnoremap c "_c
nnoremap x "_x

"Use Tab/S-Tab to change indentation
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

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
autocmd BufEnter * if count(["", "markdown", "text"], &filetype) == 0 | setlocal nowrap | endif
autocmd BufEnter * if count(["", "markdown", "text"], &filetype) == 1 | noremap <buffer> K :!open dict:///<cword><cr> | endif
autocmd BufEnter * if count(["", "markdown", "text"], &filetype) == 1 | setlocal wrap | endif 
autocmd Filetype gitcommit setlocal spell spelllang=en_us
autocmd Filetype haml setlocal tabstop=4 softtabstop=4
autocmd Filetype python setlocal colorcolumn=100
autocmd Filetype ruby,yaml setlocal tabstop=2 softtabstop=2
