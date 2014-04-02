setopt autocd
setopt completeinword
setopt correct
setopt extendedglob
setopt extendedhistory
setopt globcomplete
setopt incappendhistory
setopt interactivecomments
setopt nobeep
setopt noclobber
setopt promptsubst
setopt pushdsilent
setopt sharehistory

HISTFILE=$HOME/.zsh_history
SAVEHIST=1000000
HISTSIZE=1000000

export CLICOLOR=1
export LSCOLORS=gxGxFxdxbxDxDxBxBxExEx
export EDITOR=vim

alias g="git"
alias gg="git grep"
alias gc="git checkout"
alias gcm="git checkout master"
alias gb="git branch"
alias gd="git diff"
alias gdm="git diff master"
alias gm="git merge"
alias gmm="git merge master"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git status"
alias gr='cd $(git rev-parse --show-toplevel)'
alias gp="git pull"

case `uname` in
  FreeBSD)
    alias ls='gnuls --color=auto -GF'
  ;;
  NetBSD)
    alias ls='ls -F'
  ;;
  OpenBSD)
    alias ls='ls -F'
  ;;
  Linux)
    alias ls='ls --color=always -F'
  ;;
  Darwin)
    alias ls='ls -GF'
  ;;
esac

alias vi='vim'
alias e='exit'

##
# streams
##
#
_stations=(groovesalad cliqhop spacestream missioncontrol secretagent christmas dronezone)

stations() { for s in $_stations; do echo $s; done }

for s in $_stations; do
  alias $s="mpg123 -Cq http://ice.somafm.com/$s"
done

autoload -U compinit && compinit
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' menu select

autoload -U edit-command-line
zle -N edit-command-line

bindkey -v
bindkey "^?" backward-delete-char # allows backspace to delete behind cursor
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins '^t' history-incremental-search-forward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M vicmd '^t' history-incremental-search-forward
bindkey '^p' push-line
bindkey ' ' magic-space
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^W" backward-delete-word
bindkey "^b" backward-word
bindkey "^f" forward-word
bindkey "^d" delete-word
bindkey "^k" kill-line
bindkey -M viins "^xe" edit-command-line
bindkey -M vicmd "^xe" edit-command-line

autoload -U colors && colors
# Stolen from http://chneukirchen.org/dotfiles/.zshrc
# gitpwd - print %~, limited to $NDIR segments, with inline git branch
NDIRS=2
gitpwd() {
  local -a segs splitprefix; local prefix branch
  segs=("${(Oas:/:)${(D)PWD}}")

  if gitprefix=$(git rev-parse --show-prefix 2>/dev/null); then
    splitprefix=("${(s:/:)gitprefix}")
    if ! branch=$(git symbolic-ref -q --short HEAD); then
      branch=$(git name-rev --name-only HEAD 2>/dev/null)
      [[ $branch = *\~* ]] || branch+="~0"    # distinguish detached HEAD
    fi
    if (( $#splitprefix > NDIRS )); then
      print -n "${segs[$#splitprefix]}@$branch "
    else
      segs[$#splitprefix]+=@$branch
    fi
  fi

  print "${(j:/:)${(@Oa)segs[1,NDIRS]}}"
}

cnprompt6() {
  case "$TERM" in
    xterm*|rxvt*)
      precmd() {  print -Pn "\e]0;%~\a" }
      preexec() { printf "\e]0;%s\a" $1 };;
  esac
  setopt PROMPT_SUBST
  nbsp=$'\u00A0'
  bindkey -s $nbsp '^u'
  PS1='%B%(?..%?? )%(1j.%j& .)%b$(gitpwd)%B%(!.%F{red}.%F{magenta}) %#$nbsp%f%b'
  RPROMPT=''
}

cnprompt6

if [[ -f $HOME/.zshrc.local ]]; then
  . $HOME/.zshrc.local
fi
