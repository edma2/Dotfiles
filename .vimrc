runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Basics
syntax on
filetype plugin indent on
color solarized

" Autocommands
autocmd BufRead,BufNewFile *.thrift set filetype=thrift
autocmd BufRead,BufNewFile *.aurora,*.mesos,BUILD,aurora set filetype=python
autocmd BufRead,BufNewFile *.alert set filetype=conf
autocmd BufWritePre *.scala :%s/\s\+$//e " kill trailing whitespace on save

" Settings (plus vim-sensible, vim-sleuth)
set number
set hlsearch
set statusline=%<%f\ %y\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set expandtab
set shiftwidth=2
set softtabstop=2
set noswapfile
set hidden
set tags+=.git/tags,~/src/science/.git/tags.thrift
set path=**

" Mappings
let mapleader = "\<Space>"
nnoremap <leader><leader> :b#<cr>
nnoremap <leader>e :edit <c-r>=expand("%:p:h")<cr>/
