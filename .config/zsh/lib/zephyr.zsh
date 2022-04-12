ZEPHYR_HOME=${ZDOTDIR:-~}/.zephyr
[[ -e $ZEPHYR_HOME ]] || \
  git clone --depth=1 https://github.com/mattmc3/zephyr $ZEPHYR_HOME

zstyle ':zephyr:plugins:syntax-highlighting' use-fast-syntax-highlighting yes
zstyle ':zephyr:plugin:prompt' theme pure

zephyr_plugins=(
  environment
  #terminal
  #editor
  #history
  #directory
  #utility
  #zfunctions
  #confd
  prompt
  completions
  autosuggestions
  syntax-highlighting
  git
  ssh
)
zstyle ':zephyr:load' plugins $zephyr_plugins
source $ZEPHYR_HOME/zephyr.zsh
