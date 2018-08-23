# do NOT print/echo as it may cause issues when ssh/mosh-ing into a machine

# bins
export PATH=~/.local/bin:$PATH
export PATH=~/dotfiles/bin:$PATH

# Conda
function enable_conda() {
    if [ -d "$HOME/miniconda2" ]; then
        echo "Found miniconda!"
        export PATH="$HOME/miniconda2/bin:$PATH"
    elif [ -d "$HOME/anaconda2" ]; then
        echo "Found anaconda!"
        export PATH="$HOME/anaconda2/bin:$PATH"
    else
        echo "Conda not found!"
    fi
}

if [ -e "$HOME/Applications/firefox/firefox" ]; then
    alias ffox="$HOME/Applications/firefox/firefox"
fi

if [ -e "$HOME/Applications/julia/bin/julia" ]; then
    alias julia="$HOME/Applications/julia/bin/julia"
fi

# LCM
if [ -e "/usr/local/bin/lcm-gen" ]; then
    export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"
fi

# PCL
if [ -d "$HOME/workspace/libraries/pcl/build/bin" ]; then
    export PATH="$HOME/workspace/libraries/pcl/build/bin:$PATH" 
fi


function enable_ros() {
    if [ -r "/opt/ros/kinetic/setup.zsh" ]; then
        echo "Found ROS Kinetic!"
        source /opt/ros/kinetic/setup.zsh
    elif [ -r "/opt/ros/lunar/setup.zsh" ]; then
        echo "Found ROS Lunar!"
        source /opt/ros/lunar/setup.zsh
    elif [ -r "/opt/ros/melodic/setup.zsh" ]; then
        echo "Found ROS Melodic!"
        source /opt/ros/melodic/setup.zsh
    else
        echo "ROS not found :("
    fi

    # TODO: determine and export ip

    if [ -r "$HOME/workspace/ros/devel/setup.zsh" ]; then
        echo "Found ROS workspace under $HOME/workspace/ros"
        source "$HOME/workspace/ros/devel/setup.zsh"
    fi
}
# ROS
    # ROS Kinetic (debian 8)
    # turtlebot WiFi:
    # export ROS_MASTER_URI=http://192.168.10.15:11311
    # export ROS_MASTER_URI=http://192.168.10.4:11311
    # localhost:
    # export ROS_MASTER_URI=http://localhost:11311
    # export ROS_HOSTNAME=localhost
    # export ROS_IP=192.168.10.15
    # export ROS_PARALLEL_JOBS=-j4  # let's not jam the machine

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# export ALTERNATE_EDITOR=""
export EDITOR='emacs'

# create/attach tmux session 0 locally (remotely via ssh -X if host provided)
function stm() {
    if (( $# == 1 ))
    then
        ssh pvt@$1 -X -t tmux new-session -A -s 0
    else
        tmux new-session -A -s 0
    fi
}
