#!/bin/bash
# Ernie's Customized .bashrc

# ====================
# Environment
# ====================
export HOME=~
export TERM=xterm-256color


set -o vi                                         # vi mode
bind -m vi-insert "\C-l":clear-screen             # Restore ^L to clear screen
bind -m vi-insert "\C-p":dynamic-complete-history # ^p check for partial match in history
bind -m vi-insert "\C-n":menu-complete            # cycle through the list of partial matches

# ====================
# Path
# ====================
test -d "$HOME/bin" && PATH=$HOME/bin:$PATH
export GEM_HOME=/Library/Ruby/Gems/2.0.0
export PATH=$PATH:$GEM_HOME:/Users/epark/.gem/ruby/2.0.0:/System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/ruby/gems/2.0.0

# ====================
# Aliases
# ====================
if [[ $(uname) == 'Linux' ]]; then
  LS_COMMON="--color=auto"
elif [[ $(uname) == 'Darwin' ]]; then
  LS_COMMON="-Gh"
fi
test -n "$LS_COMMON" && alias ls="command ls $LS_COMMON"
alias ll="ls -l"
alias la="ls -la"
alias rc="vim ~/.bashrc"
alias pro="vim ~/.bash_profile"
alias srcrc="source ~/.bashrc"
alias srcpro="source ~/.bash_profile"
alias ~="cd ~"
alias g="git"
alias v="vim"
alias dot="cd ~/ernie_dotfiles"
alias locals="dot && v local_aliases"
alias csrc="~ && v .comp_specific_bashrc"

if [ -f ~/ernie_dotfiles/local_aliases ]; then
	. ~/ernie_dotfiles/local_aliases
fi

# ====================
# EDITOR and  PAGER
# ====================
EDITOR=vim
export EDITOR
PAGER="less -FiRswX"
MANPAGER=$PAGER
export PAGER MANPAGER

# ====================
# LS Colors
# ====================
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS="ex=31:di=36:ln=35"

# ====================
# Bash Completion
# ====================

. ~/ernie_dotfiles/bash_completion

# ====================

# ===================

function title () {
  echo -ne "\033]0;"$@"\007"
}
# Source file specific only to this computer
# ====================
if [ -f ~/.comp_specific_bashrc ] ; then
	. ~/.comp_specific_bashrc
fi

# ====================
# PROMPT
# ====================
# Colors
K="\[\033[0;30m\]"
R="\[\033[0;31m\]"
G="\[\033[0;32m\]"
Y="\[\033[0;33m\]"
B="\[\033[0;34m\]"
P="\[\033[0;35m\]"
C="\[\033[0;36m\]"
W="\[\033[0;38m\]"
NC="\[\033[0;0m\]"

function prompt_simple {
  unset PROMPT_COMMAND
  PS1="\W\\$ "
  PS2="> "
}

function prompt_fancy {
  unset PROMPT_COMMAND
  # Shows user@host in the title
  # TITLEBAR="\[\033]0;\u@\h\007\]"
  # Shows a "*" next to the branch name if you have un-staged local changes
  # Shows a "+" next to the branch name if you have staged local changes
  export GIT_PS1_SHOWDIRTYSTATE=1
  # Shows a "$" next to the branch name if you have stashed changes
  export GIT_PS1_SHOWSTASHSTATE=1
  # Shows a "%" next to the branch name if you have untracked files
  export GIT_PS1_SHOWUNTRACKEDFILES=1

  # Put it all together
  PS1="${TITLEBAR}${P}[\@] ${Y}[\u@\h] ${C}[\w]"
  # rvm status
  #[[ $(type -t rvm) = "function" ]] && PS1="${PS1} ${R}[\$(rvm current)]"
  # git status
  [[ $(type -t __git_ps1) = "function" ]] && PS1="${PS1} ${G}"'$(__git_ps1 "[%s]")'

	if [ -n "$SSH_CLIENT" ]; then
    xxx="${C}[----------------- SSH -----------------]\n"
	else
		xxx=""
	fi
	PS1="${xxx}${PS1}"
  PS1=$PS1'\n '"${R}♥  ${W}"
  PS2="> "
}

prompt_fancy
