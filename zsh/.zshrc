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
alias gp="git pull"

# cd with no arguments to root if in a git repo
_git_cd() {
  if [[ "$1" != "" ]]; then
    cd "$@"
  else
    local OUTPUT
    OUTPUT="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [[ -e "$OUTPUT" ]]; then
      if [[ "$OUTPUT" != "$(pwd -P)" ]]; then
        cd "$OUTPUT"
      else
        cd
      fi
    else
      cd
    fi
  fi
}

if hash git 2>/dev/null; then
  alias cd=_git_cd
fi

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

PS1='%(?.%F{green}.%F{red})%#%f '
RPS1='[%B%F{magenta}$(gitpwd)%f%b]'

if [[ -f $HOME/.zshrc.local ]]; then
  . $HOME/.zshrc.local
fi
