# do NOT print/echo as it may cause issues when ssh/mosh-ing into a machine

# bins
export PATH=~/.local/bin:$PATH
export PATH=~/dotfiles/bin:$PATH

# add /opt/bin to path
if [ -d "/opt/bin" ]; then
    export PATH=/opt/bin:$PATH
fi

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

# LCM
if [ -e "/usr/local/bin/lcm-gen" ]; then
    export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"
fi

# PCL
if [ -d "$HOME/workspace/libraries/pcl/build/bin" ]; then
    export PATH="$HOME/workspace/libraries/pcl/build/bin:$PATH"
fi

# UEI
# if [ -d "/home/pvt/workspace/toolchains/uei/ueipac-3.4.3/powerpc-604-linux-gnu/bin" ]; then
#     export PATH=$PATH:"/home/pvt/workspace/toolchains/uei/ueipac-3.4.3/powerpc-604-linux-gnu/bin"
#     export UEIPACROOT="/home/pvt/workspace/toolchains/uei/ueipac-3.4.3"
# fi


function enable_ros2() {
    if [ -r "/opt/ros/dashing/setup.zsh" ]; then
        source /opt/ros/dashing/setup.zsh
    else
        echo "ROS 2 not found :("
    fi
}

function enable_ros() {
    if [ -r "/opt/ros/kinetic/setup.zsh" ]; then
        echo "Found ROS Kinetic!"
        source /opt/ros/kinetic/setup.zsh
    elif [ -r "/opt/ros/lunar/setup.zsh" ]; then
        echo "Found ROS Lunar!"
        source /opt/ros/lunar/setup.zsh
    elif [ -r "/opt/ros/melodic/setup.zsh" ]; then
        echo "ros version: melodic"
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
    export ROS_MASTER_URI="http://${ROS_HOSTNAME}:11311"
    export ROS_PARALLEL_JOBS=-j4  # let's not jam the machine

    echo "hostname:    $ROS_HOSTNAME"
    echo "master_uri:  $ROS_MASTER_URI"
}

function mbs() {
    # move to projects/mb_system and setup ROS and the WS
    cd '/home/pvt/workspace/projects/mb_system/'
    enable_ros
}

function hydra() {
    # move to projects/mb_system and setup ROS and the WS
    cd '/home/pvt/workspace/projects/hydra/'
    enable_ros
}

function rex() {
    cd '/home/pvt/workspace/projects/seagrant_rex/'
    enable_ros
}

function mariner() {
    cd '/home/pvt/workspace/projects/mariner_ws/'
    enable_ros
}


# trim logs created by dumping ppstest to file
function trimlog () {
    if (( $# == 1 ))
    then
        sed -i "s/.*assert //g" $1
        sed -i "s/sequence: //g" $1
        sed -i "s/ - clear.*//g" $1
    fi
}

# set ros master
function rsm() {
    if (( $# == 1 ))
    then
        export ROS_MASTER_URI=http://$1:11311
    else
        export ROS_MASTER_URI=http://`hostname`.local:11311
    fi
    echo "ROS master: $ROS_MASTER_URI"
}

# GNU GLOBAL
export GTAGSLIBPATH="$HOME/.gtags"

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# export ALTERNATE_EDITOR=""
export EDITOR='emacs'

# ruby/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# create/attach tmux session 0 locally (remotely via ssh -X if host provided)
function stm() {
    if (( $# == 1 ))
    then
        ssh pvt@$1 -X -t tmux new-session -A -s 0
    else
        tmux new-session -A -s 0
    fi
}

function dot2png() {
    sfdp -Tpng $1 -o $2
}


# function rmenv() {
#     if (( $# == 2 ))
#     then
#         tpath=
#         # echo $PATH | perl -pe 's|:(.*pcl.*?:)|:|' | grep -i pcl
#     else
#         echo "usage: rmenv <env-var> <substring>"
#         echo "example: rmenv PATH pcl"
#     fi
# }

function roscfg() {
    printenv | grep ROS
}

function commands() {
    awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}

# print the most used commands
alias topten="history | commands | sort -rn | head -n20"

function mk() {
    # lazy make
    if [ -f ".catkin_workspace" ]; then
        # catkin workspace: run catkin make
        catkin_make -DCMAKE_BUILD_TYPE=Debug
    elif [ -f "Makefile" ]; then
        # run alias for make -j...
        make -j$nthreads  #&& notify-send 'build succeeded' || notify-send 'build failed' "
    else
        echo "No build info found!\n"
    fi
}
