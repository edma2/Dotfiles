execute pathogen#infect()
syntax on
filetype plugin indent on

color solarized

set autoindent
set background=dark
set backspace=indent,eol,start
set expandtab
set hidden
set ignorecase
set incsearch
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nocompatible
set noswapfile
set number
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolloff=3
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=2
set tags+=.git/tags
set timeoutlen=1000 ttimeoutlen=0
set wildignore=*.class
set wildignorecase
set wildmenu
set wildmode=list:longest,full
set wrap

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
