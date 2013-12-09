export HISTCONTROL=erasedups
export HISTSIZE=10000

# set UTF8 local
export LC_ALL="en_US.UTF-8"

# set vim as the default editor
export EDITOR=vim

# To prevent loggin out with Ctrl+d:
export IGNOREEOF=2

# enable 256 color mode
#export TERM=xterm-256color

# ls colors that look less discusting with solarized
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD


# git centric prompt
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"


# local stuff
if [ -f ~/.profile.local ]; then
  . ~/.profile.local
fi

