set nocompatible

call pathogen#infect()

filetype plugin indent on
autocmd Filetype c,cpp,java,php set cindent

set backspace=indent,eol,start

" AUTOCOMPLETION
set omnifunc=syntaxcomplete#Complete   " Autocompletion, engage!
set cot+=menuone    " Show preview of function prototype

" INDENTATION
set autoindent      " Indent same level as the previous line
set smartindent

" INTERFACE
set background=dark
syntax on
color solarized

hi CursorLine term=none cterm=none

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd     " Show partial command in status line
endif

if has('statusline')
    set laststatus=1
    set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P
    "set statusline=[%n]\ %<%f\ %((%1*%M%*%R%Y)%)\ %=%-19(\LINE\ [%3l/%3L]\ COL\ [%02c%03V]%)\ %P
endif

set showmode

set scrolloff=3     " Number of lines to keep above and below cursor
set showmatch       " Show matching brackets/paranthesis

set wildmenu
set wildignorecase
set wildignore=*.class
"set wildmode=list:full
set wildmode=list:longest,full

" FORMATTING
"set textwidth=79
"set nowrap          " Don't wrap long lines

" show indentation
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" SEARCHING
set incsearch       " Search as you type
set ignorecase
set smartcase
"set hlsearch        " Hilight search terms
set path=**

" TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number
set wrap
set hidden

set noswapfile
set tags=.git/tags

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.aurora,*.mesos,BUILD set filetype=python
au BufRead,BufNewFile *.alert set filetype=conf
au BufRead,BufNewFile Capfile set filetype=ruby

let mapleader = "\<Space>"

" Previous buffer
nnoremap <leader><leader> :b#<cr>
" Toggle search highlighting
nnoremap <silent><leader>c :set hlsearch! hlsearch?<CR>
" Opens a new buffer with the current buffer's path
nnoremap <leader>e :edit <c-r>=expand("%:p:h")<cr>/
" Git diff
nnoremap <silent><leader>gd :Git! diff<cr>
" Git status
nnoremap <silent><leader>gs :Gstatus<cr>
" Git grep
nnoremap <leader>gg :Ggrep<space>
" Git blame
nnoremap <silent><leader>gb :Gblame<cr>
