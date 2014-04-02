" Browse file in cgit (Cgit! for copy to clipboard)
function! s:Cgit(bang)
  let repo = substitute(system('basename `git rev-parse --show-toplevel`'), '\n$', '', '')
  let repo_root = substitute(system('git rev-parse --show-toplevel'), '\n$', '', '')
  let abs_path = expand("%:p")
  let rel_path = substitute(abs_path, '^'.repo_root.'/', '', '')
  let url = 'https://cgit.twitter.biz/'.repo.'/tree/'.rel_path.'#n'.line(".")

  if a:bang
    let @* = url 
    echom url 
  else
    call system('git web--browse '.'"'.url.'"')
  endif
endfunction
command! -bang Cgit call <SID>Cgit(<bang>0)
