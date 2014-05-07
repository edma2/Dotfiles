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

filetype plugin indent on
syntax on
color solarized
set background=dark
set backspace=indent,eol,start
set autoindent
set smartindent
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set showmode
set scrolloff=3
set showmatch
set wildmenu
set wildignorecase
set wildignore=*.class
set wildmode=list:longest,full
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set incsearch
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set wrap
set hidden
set noswapfile
set tags+=.git/tags

au BufRead,BufNewFile *.thrift set filetype=thrift
au BufRead,BufNewFile *.aurora,*.mesos,BUILD,aurora set filetype=python
au BufRead,BufNewFile *.alert set filetype=conf
au BufRead,BufNewFile Capfile set filetype=ruby

let mapleader = "\<Space>"

" Previous buffer
nnoremap <leader><leader> :b#<cr>
" Toggle search highlighting
nnoremap <silent><C-L> :set hlsearch! hlsearch?<CR>
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
