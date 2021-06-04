# do NOT print/echo as it may cause issues when ssh/mosh-ing into a machine

######################
### EXPORT CONTROL ###
######################

# bins
export PATH=~/.local/bin:$PATH
export PATH=~/dotfiles/bin:$PATH

# GNU GLOBAL
export GTAGSLIBPATH="$HOME/.gtags"

# SSH
export SSH_KEY_PATH="~/.ssh/id_rsa"

# export ALTERNATE_EDITOR=""
export EDITOR='emacs'

# ruby/gems
if [ -d "$HOME/gems/bin:$PATH" ]; then
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
fi

# add /opt/bin to path
if [ -d "/opt/bin" ]; then
    export PATH=/opt/bin:$PATH
fi

if [ -e "/usr/local/bin/lcm-gen" ]; then
    export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"
fi

if [ -d "$HOME/workspace/libraries/pcl/build/bin" ]; then
    export PATH="$HOME/workspace/libraries/pcl/build/bin:$PATH"
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

function enable_ros2() {
    for release in dashing; do
        if [ -r "/opt/ros/$release/setup.zsh" ]; then
            echo "found release: $release"
            source "/opt/ros/$release/setup.zsh"
            break
        fi
    done
    # if [ -r "/opt/ros/dashing/setup.zsh" ]; then
    #     source /opt/ros/dashing/setup.zsh
    # else
    #     echo "ROS 2 not found :("
    # fi
}

# set ros master
function rsm() {
    export ROS_HOSTNAME=`hostname`.local
    if (( $# == 1 ))
    then
        export ROS_MASTER_URI=http://$1:11311
    else
        export ROS_MASTER_URI="http://${ROS_HOSTNAME}:11311"
    fi
    echo "ROS hostname:    $ROS_HOSTNAME"
    echo "ROS master_uri:  $ROS_MASTER_URI"
}

function enable_ros() {
    for release in noetic melodic lunar kinetic; do
        if [ -r "/opt/ros/$release/setup.zsh" ]; then
            echo "found release: $release"
            source "/opt/ros/$release/setup.zsh"
            break
        fi
    done

    export ROS_PARALLEL_JOBS=-j4  # let's not jam the machine
}

function sb(){
    for release in noetic melodic lunar kinetic; do
        if [ -r "/opt/ros/$release/setup.zsh" ]; then
            echo "found release: $release"
            source "/opt/ros/$release/setup.zsh"
            break
        fi
    done
}

function cdrosws(){
    # cd into a ros workspace if it exists and source
    if (( $# != 1 )); then
        echo "missing argument; syntax: cdrosws(<dir>)"
        return
    fi

    if ! [ -d $1 ]; then
        echo "directory $1 not found!"
        return
    fi

    cd $1
    enable_ros
    rsm

    if [ -r "devel/setup.zsh" ]; then
        source "devel/setup.zsh"
    else
        echo "local directory does not appear to be a ROS workspace"
    fi
}


function mbs() {
    # move to projects/mb_system and setup ROS and the WS
    cdrosws '/home/pvt/workspace/projects/mb_system/'
}

function hydra() {
    # move to projects/mb_system and setup ROS and the WS
    cdrosws '/home/pvt/workspace/projects/hydra/'
}

function rex() {
    cdrosws '/home/pvt/workspace/projects/seagrant_rex/'
}

function mariner() {
    cdrosws '/home/pvt/workspace/projects/mariner_ws/'
}

function tb3() {
    cdrosws '/home/pvt/workspace/projects/killerbot/'
}


# trim logs created by dumping ppstest to file
function trimppslog () {
    if (( $# == 1 ))
    then
        sed -i "s/.*assert //g" $1
        sed -i "s/sequence: //g" $1
        sed -i "s/ - clear.*//g" $1
    fi
}



function stm() {
    # create/attach tmux session 0 locally (remotely via ssh -X if host provided)
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
    # make dispatcher: catkin_make for ros workspaces, regular make for makefiles, cmake+make for OOS builds
    if [ -f ".catkin_workspace" ]; then
        # catkin workspace: run catkin make
        catkin_make -DCMAKE_BUILD_TYPE=Debug
    elif [ -f "Makefile" ]; then
        # run alias for make -j...
        make -j$nthreads  #&& notify-send 'build succeeded' || notify-send 'build failed' "
    elif [ -f "CMakeLists.txt" ]; then
        # kinda dangerous... 
        if ! [ -d "build" ]; then
            mkdir build
        fi
        cd build
        cmake ..
        make -j$nthreads
    else
        echo "No build info found!\n"
    fi
}

function roscustominstall(){
    # Script to add packages to a custom ROS install (e.g. RPi)
    if (( $# == 1 ))
    then
        echo "please provide at least one package to install"
    else
        # populate $PACKAGES with arguments
    fi

    cd ~/workspace/ros_catkin_ws

    # regen install file
    rosinstall_generator ${PACKAGES} --rosdistro melodic --deps --wet-only --tar > melodic-custom_ros.rosinstall

    # update file
    wstool merge -t src melodic-custom_ros.rosinstall
    wstool update -t src

    # install dependencies
    rosdep install --from-paths src --ignore-src --rosdistro melodic -y -r --os=debian:buster

    # make & install
    sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/melodic
}
