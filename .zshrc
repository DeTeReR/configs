# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstal

#ROYDE additions:

autoload -U promptinit
promptinit

prompt adam1

bindkey '^H' backward-kill-word

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vim
export VISUAL=vim

export PYTHONPATH=${PYTHONPATH}:~/repos/scrape/scrape/:~/repos/scrape/scrapers/
export PYTHONPATH=${PYTHONPATH}:~/repos/lib/gambitpy/:~/repos/lib/dumaclient/:~/repos/lib/lineproto/:~/repos/strategies/gambitsolvers/miyagi/

# psql stuff
export PGAPPNAME="psql daniel@royde-deskt"


alias lt='ls -ltrh'
alias hist='history 1'
export PATH=${PATH}:~/repos/core/bin
if [ -z "$TMUX" ]; then
	tmux
fi

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


bindkey "^[[D" backward-word
bindkey "^[[C" forward-word
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
