# External sources include: zachbrowne and moqmar gists
########################################
## Beautiful prompt with optional git info
########################################
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Desert-inspired PS1 with git branch
export PS1='\[\e[1;38;5;244m\]\t \[\e[1;36m\]\u@\H \[\e[1;33m\]\w\[\e[1;38;5;172m\]$(parse_git_branch) \[\e[1;36m\]\$ \[\e[0m\]'


########################################
## BASH history and window mgmt       ##
########################################

# search through history wit:xh up/down arrows
bind '"\e[A": history-search-backward' 2>/dev/null
bind '"\e[B": history-search-forward' 2>/dev/null

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

##################################
## alias party                  ##
##################################

alias ls="ls --color=always"
alias ll="ls -l"
alias la="ls -lA"
alias pls="sudo"

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Just git things
# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gco='git checkout'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gpl='git pull'

#############################
## Warn about root shells! ##
#############################

if [ `id -u` -eq 0 ]; then 
    start="\033[1;37;41m"
    end="\033[0m"
    printf "\n"
    printf "  $start                                                                       $end\n"
    printf "  $start  WARNING: You are in a root shell. This is probably a very bad idea.  $end\n"
    printf "  $start                                                                       $end\n"
    printf "\n"
fi
