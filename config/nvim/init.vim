"  init.vim
"  TODO: Fix up / organize autocmds
call plug#begin(stdpath('data') . '/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'cocopon/iceberg.vim'
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lervag/vimtex'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/vim-pencil'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-crystal/vim-crystal'
call plug#end()

let mapleader = " "
nnoremap <space> <Nop>
let maplocalleader = "\\"

set background=dark
set clipboard=unnamed
set colorcolumn=80
set nohlsearch
set nomodelineexpr
set nowrap
set number relativenumber
set pyxversion=3
set smartindent
set smartcase
set spellfile=~/.config/nvim/spell/en.utf-8.add
set updatetime=100

if (has("termguicolors"))
    set termguicolors
endif

syntax enable

" set python version to system default
" TODO look at making this more constant so python updates don't
" immediately break things
let g:python3_host_prog="/usr/local/bin/python3"

set expandtab
set shiftwidth=4
set tabstop=4

colorscheme iceberg
highlight ColorColumn ctermbg=235 guibg=#1e2132

" Generic Keymaps
nmap <C-p> :FZF<cr>
nmap <leader>, :bprev<cr>
nmap <leader>. :bnext<cr>
nmap <leader>w :bdel<cr>
nmap <leader>o :setlocal spell! spelllang=en_us<CR>
nmap <leader>p :w<CR>:execute ":!command pandoc '" . expand('%:p') . "' 
            \ --from=gfm --pdf-engine=pdflatex --output '" . expand('%:r') 
            \ . ".pdf' && displayline 1 '" 
            \ . expand('%:r') . ".pdf'"<CR>
nmap <leader>r :RainbowToggle<CR>
nmap <leader>s :w<CR>:source %<CR>
nnoremap C "_C
nnoremap c "_c
nnoremap x "_x
vnoremap c "_c
vnoremap x "_x
vmap D "_d

" Use Tab/S-Tab to change indentation
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" Use C-e to enter normal mode in terminal
tnoremap <C-e> <C-\><C-n>

" https://aonemd.github.io/blog/handy-keymaps-in-vim
" Move to the split in the direction shown, or create a new split
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


" Plugin settings
"
" Disable rainbow parentheses by default
let g:rainbow_active=0

" coc.nvim
" Confirm first item on <cr> if nothing is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
            \ "\<C-g>u\<CR>"

" Use tab to navigate completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Call formatter
nmap <leader>f <Plug>(coc-format)
vmap <leader>f <Plug>(coc-format-selected)

"  Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

"  GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

"  Writing Config
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#autoformat = 0
let s:write_mode = 0

function! s:write_toggle()
    ToggleDitto
    PencilToggle
    if &filetype == "tex"
        let g:pencil#wrapModeDefault = 'hard'
        set conceallevel=0
    endif
    let s:write_mode = ! s:write_mode
    if s:write_mode
        Limelight
        setlocal spell spelllang=en_us
    else
        Limelight!
        setlocal nospell
        let g:pencil#wrapModeDefault = 'soft' " Reset write mode for non tex files
    endif
endfunction

" Init writing related plugins with Goyo 
nmap <leader>g :Goyo<CR>
autocmd User GoyoEnter call s:write_toggle()
autocmd User GoyoLeave call s:write_toggle()


" vim-ditto keymaps
nmap ]d <Plug>DittoNext
nmap [d <Plug>DittoPrev
nmap +d <Plug>DittoGood
nmap _d <Plug>DittoBad

" vimtex
let g:tex_flavor='latex'
let g:vimtex_syntax_conceal_default = 0
let g:vimtex_view_method='skim'

" Reverse search
" See https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/
" and https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/
function! SetServerName()
    let cmd = printf("echo %s > /tmp/curnvimserver.txt", v:servername)
    call system(cmd)
endfunction

" Filetype specific config
" TODO Organize autocmds better
augroup custom
    autocmd!
    autocmd Filetype markdown,text noremap <buffer> K :!open dict:///<cword><cr> 
                \ | setlocal wrap
    autocmd BufLeave if count(["markdown", "text"], &filetype) == 1 
                \ | setlocal nowrap 
                \ | nunmap K 
                \ | endif
    autocmd Filetype gitcommit setlocal spell spelllang=en_us
    autocmd Filetype haml setlocal tabstop=4 softtabstop=4
    autocmd Filetype python setlocal colorcolumn=100 
                \ | nnoremap <buffer> <leader>p :execute ":!command python3 " . expand('%:p')<CR>
    autocmd Filetype ruby,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd Filetype tex call SetServerName() | set conceallevel=0
augroup END
