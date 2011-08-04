# .bash_profile

# Load aliases and functions
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:/usr/local/bin:/usr/local/sbin

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

export BASH_ENV ENV PATH PS1 DISPLAY

export PATH="$HOME/bin:$PATH"
source ~/bin/git-completion.bash
# PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '


