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
    elif [ -d "$HOME/anaconda3" ]; then
        echo "Found anaconda!"
        export PATH="$HOME/anaconda3/bin:$PATH"
    else
        echo "Conda not found!"
    fi
}

if [ -e "$HOME/applications/firefox/firefox" ]; then
    alias ffox="$HOME/applications/firefox/firefox"
fi

if [ -e "$HOME/applications/julia/bin/julia" ]; then
    alias julia="$HOME/applications/julia/bin/julia"
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

    if [ -r "devel/setup.zsh" ]; then
        echo "Found ROS workspace in local directory!"
        source "devel/setup.zsh"
    fi

    # TODO: determine and export ip (or use ros_hostname instead)
    export ROS_HOSTNAME=`hostname`.local
    export ROS_PARALLEL_JOBS=-j4  # let's not jam the machine
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

function rsm() {
    if (( $# == 1 ))
    then
        export ROS_MASTER_URI=http://$1:11311
    else
        export ROS_MASTER_URI=http://`hostname`.local:11311
    fi
    echo "ROS master: $ROS_MASTER_URI"
}


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
