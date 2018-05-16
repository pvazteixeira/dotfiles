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

if [ -e "$HOME/Downloads/firefox/firefox" ]; then
    alias ffox="$HOME/Downloads/firefox/firefox"
fi

if [ -e "$HOME/Downloads/julia/julia" ]; then
    alias julia="$HOME/Downloads/julia/julia"
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
    if [ -e "/opt/ros/kinetic/setup.zsh" ]; then
        echo "Found ROS Kinetic!"
        source /opt/ros/kinetic/setup.zsh
        # if [ -e "$HOME/ros_catkin_ws/devel/setup.zsh" ]; then
        #     source ~/ros_catkin_ws/devel/setup.zsh
        # fi
    elif [ -r "/opt/ros/lunar/setup.zsh" ]; then
        echo "Found ROS Lunar!"
        source /opt/ros/lunar/setup.zsh
        # if [ -e "$HOME/workspace/ros_catkin_ws/devel/setup.zsh" ]; then
        #     source ~/ros_catkin_ws/devel/setup.zsh
        # fi
    else
        echo "ROS not found :("
    fi

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

