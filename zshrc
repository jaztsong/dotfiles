# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="gnzh"
ZSH_THEME="cloud"
# ZSH_THEME="duellj"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Vi mode
#bindkey -v
# 10ms for key sequences
MENU_COMPLETE=true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={a-zA-Z}'

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
#VIMODE='[i]'
#function zle-line-init zle-keymap-select {
#    VIMODE="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
#bindkey -a u undo
#bindkey -a '^R' redo
#bindkey '^?' backward-delete-char
#bindkey '^H' backward-delete-char
#
## history search in vim mode
## http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

export KEYTIMEOUT=1
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
alias tmux="tmux -2"
#Auto start tmux
ZSH_TMUX_AUTOSTART=true
plugins=(git tmux z colored-man-pages vi-mode)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/11/bin:/Library/Tex/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#--------------------------------------------
#Fancy ctrl z to switch vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
#-------------------------------------------
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#command history setting
#
# "open"
case "$OSTYPE" in
   cygwin*)
      alias open="cmd /c start"
      ;;
   linux*)
      alias open="xdg-open"
      ;;
   darwin*)
      # alias start="open"
      ;;
esac



setopt nosharehistory
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias backlit="sudo xmodmap -e 'add mod3 = Scroll_Lock'"
# Install trash-cli
alias del='trash-put'
# alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"
alias rm="del"
alias v="vim"
alias summary="Rscript -e 'summary(as.numeric(readLines(\"stdin\")))'"
alias ecdf="Rscript -e 'd=quantile(as.numeric(readLines(\"stdin\")),probs=seq(0,1,0.01),na.rm=1);cat(d,sep=\"\n\");'|awk '{print \$1,0.01*NR}'"

#open pdf with zathrua
alias pdf="zathura"

# kill all unattached tmux session (normally caused by VSCODE)
alias kill_tmux="tmux list-sessions | grep -E -v '\(attached\)$' |cut -d: -f1|xargs -I {} tmux kill-session -t {}"

# The setting for tensorflow
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export PATH=/home/song3/Teaching/git_scripts/client_scripts${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# for Mac
# export PATH="$HOME/opt/anaconda3/bin:$PATH"
# for Linux
export PATH="$HOME/anaconda3/bin:$PATH"
export PAGER=cat
source /opt/ros/melodic/setup.zsh

# export CARLAPATH=$HOME/Research/carla

# export PYTHONPATH=$HOME/Research/carla/PythonClient
# export PYTHONPATH=$PYTHONPATH:$HOME/Research/racecar-RL/src
