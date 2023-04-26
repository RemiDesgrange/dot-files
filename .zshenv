export ZDOTDIR=~/.config/zsh
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.tfenv/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=/usr/local/bin:$PATH
# use uutils coreutils instead of BSD one
export PATH="/opt/homebrew/opt/uutils-coreutils/libexec/uubin:$PATH"
alias rm=urm

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
