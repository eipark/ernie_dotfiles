# .bash_profile

# Load aliases and functions
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/opt/local/bin

# Conditional additions
if [ -d /Developer/Tools ];then
    export PATH=$PATH:/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin
fi

BASH_ENV=$HOME/.bashrc
ENV=$HOME/.bashrc

if [ -d ~/.bash_completion.d ]; then
    for c in ~/.bash_completion.d/*; do
        . "$c"
    done
fi

bind "set completion-ignore-case on"

export BASH_ENV ENV PATH PS1 DISPLAY

export PATH="$HOME/bin:$PATH"
source ~/ernie_dotfiles/git-completion.bash
#PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/Users/epark/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin

if [ -f ~/.comp_specific_bash_profile ]; then
	. ~/.comp_specific_bash_profile
fi

