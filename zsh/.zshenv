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

# fuzzy finder
if [ -d "/usr/share/doc/fzf/examples/" ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

# ruby/gems
if [ -d "$HOME/gems/bin:$PATH" ]; then
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
fi

if [ -d "/opt/bin" ]; then
    export PATH=/opt/bin:$PATH
fi


if [ -d "$HOME/workspace/libraries/pcl/build/bin" ]; then
    export PATH="$HOME/workspace/libraries/pcl/build/bin:$PATH"
fi

# 2021.09.27 - bypassing 'enable_ros' to troubleshoot things
if [ -d "/opt/ros/melodic" ]; then
    source "/opt/ros/melodic/setup.zsh"
fi




function stm() {
    # create/attach tmux session 0 locally (remotely via ssh -X if host provided)
    if (( $# == 1 ))
    then
        ssh $1 -X -t tmux new-session -A -s 0
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
        echo "DANGER ZONE"
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

# tmux reset display - this resets the DISPLAY environment variable
function trd(){
    export DISPLAY="`tmux show-env | sed -n 's/^DISPLAY=//p'`"
}


# export CC=/usr/bin/clang
# export CXX=/usr/bin/clang++



