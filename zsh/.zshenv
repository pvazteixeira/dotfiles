# Setting environmental variables

export PATH=~/.local/bin:$PATH

export PATH=~/dotfiles/bin:$PATH

# (mini)conda
# if [ -d "$HOME/miniconda2" ]; then
#     echo " - Miniconda"
#     export PATH="$HOME/miniconda2/bin:$PATH"
# fi

export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"

# echo "PATH: $PATH"
# pyloc=`which python`
# echo "python: $pyloc"
# echo "PYTHONPATH: $PYTHONPATH"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"


# export ALTERNATE_EDITOR=""
export EDITOR='emacsclient -t'
