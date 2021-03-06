# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# append to the history file, don't overwrite it
shopt -s histappend

export HISTSIZE=20000
export HISTFILESIZE=$HISTSIZE
# don't put duplicate lines in the history,
# ignore lines starting with a space
export HISTCONTROL=ignoredups:ignorespace
# ignore some common commands
export HISTIGNORE="&:ls:ll:gs:gd:[bf]g:exit:pwd:clear:mount:umount"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /etc/bash_completion ]; then
		source /etc/bash_completion;
	elif [ -f /usr/local/etc/bash_completion ]; then
		source /usr/local/etc/bash_completion;
  elif [ -f /opt/local/etc/bash_completion ]; then
    source /opt/local/etc/bash_completion
	fi
fi


# Default editors
export EDITOR="code -g"
export GUI_EDITOR="code -g"
export REACT_EDITOR="code -g"
export BUNDLER_EDITOR="code -g"
export GIT_EDITOR="vim"


# Add /usr/local/sbin
export PATH="$PATH:/usr/local/sbin"

# Don't worry about /var/mail/ notifications
unset MAILCHECK

store_cwd() { pwd > ~/.cwd~; }
autoreload_prompt_command+="store_cwd;"

# Set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
