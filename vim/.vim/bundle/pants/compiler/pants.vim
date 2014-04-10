" Vim compiler file
" Compiler: pants
" Maintainer: Eugene Ma <ema@twitter.com>
" Last Change:

if exists("current_compiler")
  finish
endif
let current_compiler = "pants"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pantscompile\ %

CompilerSet errorformat=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
                       \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
                       \%-G%.%#
