# zsh mode
set -o vi
bindkey "jj" vi-cmd-mode

function zle-line-init zle-keymap-select {
        VIM_NORMAL="%K{208}%F{black}⮀%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}⮀%k%f"
        VIM_INSERT="%K{075}%F{black}⮀%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}⮀%k%f"
        RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
        RPS2=$RPS1
        zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

alias ls='ls --color'
alias la='ls -a'
alias python='python3'

export DISPLAY=localhost:0.0
setopt auto_cd
setopt correct

autoload -U compinit
compinit

#単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

# "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd


# setting for prompt
setopt PROMPT_SUBST
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1

PROMPT='[%n@%m:%~]$(__git_ps1 " (%s)")%# '
PROMPT='
[%B%F{red}%n@%m%f%b:%F{yellow}%~%f]%F{cyan}$(__git_ps1 " (%s)")%f
${VIMODE}%# '

# ls after cd
function chpwd(){
  emulate -L zsh
  ls -a
}

# cd after mkdir
function mkdir {
    command mkdir $1 && cd $1
}

# cd after mkdir as mkcd
function mkcd {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "\`$1' already exists"
    else
        mkdir $1 && cd $1
    fi
}


# path for jupyter
export PATH=~/.local/bin/jupyter:$PATH


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

