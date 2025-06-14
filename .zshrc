# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/m/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
source ~/.zsh/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=True
plugins=(git)
#plugins+=(safe-paste)
#plugins+=(safe_paste)
# git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
#plugins+=(k)

source $ZSH/oh-my-zsh.sh
PS1='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%}%{$fg[yellow]%}$(__git_ps1)%{$reset_color%} %(!.#.$) '

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

HISTSIZE=1000000
SAVEHIST=1000000

#alias g='gnome-open'

#function dolog() {
# if [ $# -ne 1 ]; then
#   echo 'Illegal number of arguments'
#   return 1
# fi
# docker ps --format "{{.Names}}" | egrep "^$1$" > /dev/null
# if [ $? -ne 0 ]; then
#   echo "Container '$1' does not exist"
#   return 1
# fi
# docker exec -it "$1" bash
#}

backward-kill-to-space () {
  local  WORDCHARS='*?_-.[]~=&;!#$%^(){}<>\/'
  zle backward-kill-word
}
zle -N backward-kill-to-space
bindkey '^W' backward-kill-to-space

#function integrity() {
  # usage integrity https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css
  # output sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N
#  echo -n "sha384-";
#  curl "$1" -s |  openssl dgst -binary -sha384 | openssl base64 -A
#}

#function budzik {
#    WAKEUP_TIME=$1
#    echo 'amixer -D pulse set Master 10%' | at $WAKEUP_TIME
#    echo 'amixer -D pulse set Master 20%' | at $WAKEUP_TIME + 3 min
#    echo 'amixer -D pulse set Master 30%' | at $WAKEUP_TIME + 6 min
#    echo 'amixer -D pulse set Master 40%' | at $WAKEUP_TIME + 9 min
#    echo 'amixer -D pulse set Master 50%' | at $WAKEUP_TIME + 12 min
#}
function budzik {
    WAKEUP_TIME=$1
    CURRENT_VOLUME=$(amixer -D pulse get Master  | awk -F'[][]' '/Left:/ { gsub(/%/, "", $2); print $2 }')
    echo "for i in \$(seq $CURRENT_VOLUME 10); do amixer -D pulse set Master \$i%; sleep 1; done" | at $WAKEUP_TIME
    echo 'for i in $(seq 10 20); do amixer -D pulse set Master $i%; sleep 1; done' | at $WAKEUP_TIME + 3 min
    echo 'for i in $(seq 20 30); do amixer -D pulse set Master $i%; sleep 1; done' | at $WAKEUP_TIME + 6 min
    echo 'for i in $(seq 30 40); do amixer -D pulse set Master $i%; sleep 1; done' | at $WAKEUP_TIME + 9 min
    echo 'for i in $(seq 40 50); do amixer -D pulse set Master $i%; sleep 1; done' | at $WAKEUP_TIME + 12 min
    # for i in $(seq 10 20); do amixer -D pulse set Master $i%; sleep 1; done
}
