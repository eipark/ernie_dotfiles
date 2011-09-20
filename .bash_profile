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
source ~/bin/git-completion.bash
#PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '

if [ -f ~/.comp_specific_bash_profile ]; then
	. ~/.comp_specific_bash_profile
fi

##
# Your previous /Users/ernestipark/.bash_profile file was backed up as /Users/ernestipark/.bash_profile.macports-saved_2011-08-30_at_01:34:41
##

# MacPorts Installer addition on 2011-08-30_at_01:34:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
