# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Antidote is the package manager
source $ZDOTDIR/antidote.zsh

source $ZDOTDIR/completion.zsh
source $ZDOTDIR/git-aliases.zsh

# share history between seesion/term
setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# User configuration

# my dot files under version control. Use "config add <bla>" "config commit" etc...
alias config='/usr/bin/git --git-dir=$HOME/.dot-files-repo/ --work-tree=$HOME'
alias ls=exa

#pyenv init
eval "$(pyenv init --path)"
source $ZDOTDIR/fast-pyenv-virtualenv.zsh


# docker prune
function docker_prune_all() {
    docker system prune -af
    docker volume prune -f
    docker image prune -af
}


# zsh autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,underline"

# zoxide is an autojumper
eval "$(zoxide init zsh)"
alias cd=z
alias cdi=zi

export GPG_TTY=$(tty)

export HOMEBREW_NO_ENV_HINTS=yes

# launch fucking tmux since alacritty is not capable of doing so.
alias alatmux="tmux new -A -s alacritty"

# list process who listen on specific port (tcp only)
listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

export PIP_REQUIRE_VIRTUALENV=true

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
