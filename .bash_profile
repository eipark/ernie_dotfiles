
# .bash_profile
#
# based on a chunk of jpb's bash profile.
#
# Load aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Conditional additions
if [ -d /Developer/Tools ];then
    export PATH=$PATH:/Developer/Tools:/Developer/usr/bin:/Developer/usr/sbin
fi
if [ -d /opt/local/bin ]; then
  export PATH=$PATH:/opt/local/bin
fi

if [ -d /opt/local/sbin ]; then
  export PATH=$PATH:/opt/local/sbin
fi

BASH_ENV=$HOME/.bashrc
ENV=$HOME/.bashrc

if [ -d ~/.bash_completion.d ]; then
    for c in ~/.bash_completion.d/*; do
        . "$c"
    done
fi

export BASH_ENV ENV PATH PS1 DISPLAY

# from macosxhints.com
cdf() # cd's to frontmost window of Finder
{
    cd "`osascript -e 'tell application "Finder"' \
        -e 'set myname to POSIX path of (target of window 1 as alias)' \
        -e 'end tell' 2>/dev/null`"
}

# use ssh-add -K /path/to/your/secret/key to add the key password to your
# keychain. Then the ssh-add -k below will use your keychain and not harass
# you for a password.
if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
    if [ -f /mach_kernel ]; then
        ssh-add -k
    fi
fi


# Setup bash history options
# export HISTCONTROL=erasedups
export HISTCONTROL='ignoreboth'
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=10000
export HISTTIMEFORMAT='%b %d %H:%M:%S: '
shopt -s histappend
set cmdhist

bind "set completion-ignore-case on"
shopt -s cdspell

if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi

export RUBYOPT="-I. -rubygems"

export PATH="$HOME/bin:$PATH"
source ~/bin/git-completion.bash
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

