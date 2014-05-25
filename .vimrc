runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on

syntax on
color solarized

set nocompatible
set backspace=indent,eol,start
set autoindent

set ttimeout
set ttimeoutlen=100

set listchars=tab:>.,trail:.,extends:#,nbsp:.
set number

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

set laststatus=1
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set showcmd
set showmode
set scrolloff=3
set showmatch

set wildmenu
set wildmode=list:longest,full

set incsearch
set hlsearch
"set ignorecase
"set smartcase

set shiftwidth=2
set softtabstop=2
set expandtab

set tags+=.git/tags

set noswapfile
set hidden

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.aurora,*.mesos,BUILD,aurora set filetype=python
au BufRead,BufNewFile *.alert set filetype=conf

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let mapleader = "\<Space>"

nnoremap <leader><leader> :b#<cr>
nnoremap <leader>e :edit <c-r>=expand("%:p:h")<cr>/

nnoremap <silent><leader>gd :Git! diff<cr>
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <silent><leader>gb :Gblame<cr>

nnoremap <silent> <C-L> :set hlsearch! hlsearch?<CR><C-L>
