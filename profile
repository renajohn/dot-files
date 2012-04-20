export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# set UTF8 local
export LC_ALL="en_US.UTF-8"

# set vim as the default editor
export EDITOR=vim

# To prevent loggin out with Ctrl+d:
export IGNOREEOF=2

# enable 256 color mode
export TERM=xterm-256color

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

git_branch() {
    b=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'`
    echo $b;
}
commits_behind_develop() {
    # Is there a develop branch ?
    d=`git branch 2>/dev/null | grep -P '\s+develop$' | wc -l`
    if [[ $d == "1" ]]; then
        n=`git rev-list HEAD..develop | wc -l`
        if [[ $n != "0" ]]; then
            echo "${BLINK}, $n commits behind develop${NO_BLINK}"
        fi;
    fi;
}
git_prompt() {
    branch=$(git_branch);
    if [[ "$branch" == "" ]]; then
        echo "";
    else
        echo "${GREEN} ($branch$(commits_behind_develop)${GREEN})";
    fi
}

function prompt_func() {
    previous_return_value=$?;    
    prompt="${TITLEBAR}${BLUE}[${LIGHT_GRAY}\w${GREEN}$(git_prompt)${BLUE}]${COLOR_NONE} "
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}➔ "
    else
        PS1="${prompt}${RED}➔${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func

# local stuff
if [ -f ~/.profile.local ]; then
  . ~/.profile.local
fi

