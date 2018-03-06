# echo "Setting environment variables"

# bins
export PATH=~/.local/bin:$PATH
export PATH=~/dotfiles/bin:$PATH

# (ana/mini)conda
if [ -d "$HOME/miniconda2" ]; then
    # echo " - Miniconda"
    export PATH="$HOME/miniconda2/bin:$PATH"
elif [ -d "$HOME/anaconda2" ]; then
    # echo " - Anaconda"
    export PATH="$HOME/anaconda2/bin:$PATH"
else
    # echo "conda not found!"
fi

if [ -e "/usr/local/bin/lcm-gen" ]; then
    export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"
else
    echo "lcm not found!"
fi

# ROS
if [ -e "/opt/ros/kinetic/setup.zsh" ]; then
    # ROS Kinetic (debian 8)
    source /opt/ros/kinetic/setup.zsh
    if [ -e "$HOME/ros_catkin_ws/devel/setup.zsh" ]; then
        source ~/ros_catkin_ws/devel/setup.zsh
    fi
    # turtlebot WiFi:
    # export ROS_MASTER_URI=http://192.168.10.15:11311
    # export ROS_MASTER_URI=http://192.168.10.4:11311
    # localhost:
    # export ROS_MASTER_URI=http://localhost:11311
    # export ROS_HOSTNAME=localhost
    # export ROS_IP=192.168.10.15
    export ROS_PARALLEL_JOBS=-j4  # let's not jam the machine
elif [ -r "/opt/ros/lunar/setup.zsh" ]; then
    # ROS Lunar (debian 9)
    # source /opt/ros/lunar/setup.zsh
    # if [ -e "$HOME/workspace/ros_catkin_ws/devel/setup.zsh" ]; then
    #     source ~/ros_catkin_ws/devel/setup.zsh
    # fi
else
    # echo "ROS not found!"
fi


# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# export ALTERNATE_EDITOR=""
export EDITOR='emacsclient -t'

