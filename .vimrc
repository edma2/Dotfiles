set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'altercation/vim-colors-solarized'
Plugin 'derekwyatt/vim-scala'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'sprsquish/thrift.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'file:///Users/ema/src/vim-plugins/twitter-cgit'
Plugin 'vim-go', {'pinned': 1}

filetype plugin indent on

" Colorscheme
syntax on
color solarized
set background=dark

" Indentation
set autoindent

" UI
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set showmode
set showmatch
set scrolloff=3
set number
set wrap
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set backspace=indent,eol,start

" Completion
set wildmenu
set wildignorecase
set wildignore=*.class
set wildmode=list:longest,full

" Search
set incsearch
set ignorecase
set smartcase

set hidden
set noswapfile

set tags+=.git/tags

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.aurora,*.mesos,BUILD,aurora set filetype=python
au BufRead,BufNewFile *.alert set filetype=conf
au BufRead,BufNewFile Capfile set filetype=ruby

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let mapleader = "\<Space>"

nnoremap <leader><leader> :b#<cr>
" Opens a new buffer with the current buffer's path
nnoremap <leader>e :edit <c-r>=expand("%:p:h")<cr>/

nnoremap <silent><leader>gd :Git! diff<cr>
nnoremap <silent><leader>gs :Gstatus<cr>
nnoremap <leader>gg :Ggrep<space>
nnoremap <silent><leader>gb :Gblame<cr>
