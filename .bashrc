#
# ~/.bashrc
#

#
## Source custom aliases, variables, etc
#

# Variables / environment
[ -f ~/.bash_env ] && . ~/.bash_env

# Aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Custom functions
[ -f ~/.bash_func ] && . ~/.bash_func

#
## Arch's defaults for .bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
## Ported from preferred debian install
#
HISTORYCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;\u@\h: \w\a\]$PS1"
	;;
esac

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls -h --color=auto'
	alias ll='ls -lah --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

export PATH=$HOME/.local/bin:$PATH

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/cheek/.lmstudio/bin"
# End of LM Studio CLI section

