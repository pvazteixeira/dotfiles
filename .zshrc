# Path to your oh-my-zsh installation.
  export ZSH=/home/pvt/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

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
plugins=(git ssh-agent debian)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
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
export ALTERNATE_EDITOR=""
export EDITOR='emacsclient -t'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias day="redshift -O 6500"
alias night="redshift -O 2300"

export TERM=xterm-256color

# Set environment variables (move to separate file soon)
if [ -d "$HOME/Workspace/mrg/pyslam-pod" ]; then
  export PYTHONPATH="$HOME/Workspace/mrg/pyslam-pod/build/lib:$PYTHONPATH"
  # visualization: lcm/python 
  export PYTHONPATH="$HOME/Workspace/mrg/pyslam-pod/externals/visualization-pod/lcmtypes/python:$PYTHONPATH"
  # pyslam
  export PYTHONPATH="$HOME/Workspace/mrg/pyslam-pod/python:$PYTHONPATH"
fi

# lcmtypes - ogmapper
if [ -d "$HOME/Workspace/ogmapper/lcmtypes/python" ]; then
    echo "Adding ogmapper files to path"
    export PYTHONPATH="$HOME/Workspace/ogmapper/lcmtypes/python:$PYTHONPATH"
    export CLASSPATH="$HOME/Workspace/ogmapper/pod-build/lcmtypes_ogmapper.jar:$CLASSPATH"
fi

# lcmtypes - 3dfls
if [ -d "$HOME/Workspace/3dfls/3dfls/lcmtypes/python" ]; then
    echo "Adding 3dfls files to path"
    export PYTHONPATH="$HOME/Workspace/3dfls/3dfls/lcmtypes/python:$PYTHONPATH"
    export CLASSPATH="$HOME/Workspace/3dfls/3dfls/pod-build/lcmtypes_3dfls.jar:$CLASSPATH"
fi


# mute LCM by default
export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"

# set aliases (move to separate file)
# alias lcm-mute=export LCM_DEFAULT_URL=udpm://239.255.76.67:7667?ttl=0"
# alias lcm-unmute="export LCM_DEFAULT_URL=udpm://239.255.76.67:7667?ttl=1"

