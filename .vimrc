runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on
color solarized

set number
set hlsearch
set statusline=%<%f\ %y\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set expandtab
set shiftwidth=2
set softtabstop=2

set noswapfile
set hidden
set tags+=.git/tags

let mapleader = "\<Space>"

nnoremap <leader><leader> :b#<cr>
nnoremap <leader>e :edit <c-r>=expand("%:p:h")<cr>/

nnoremap <silent><leader>gd :Git! diff<cr>
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <silent><leader>gb :Gblame<cr>
