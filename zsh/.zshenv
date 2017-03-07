# Setting environmental variables
echo "Adding to path:"


export PATH=~/.local/bin:$PATH

# (mini)conda
if [ -d "$HOME/miniconda2" ]; then
    echo " - Miniconda"
    export PATH="$HOME/miniconda2/bin:$PATH"
fi


# if [ -d "$HOME/Workspace/hauv-collection-test/build" ]; then
#     echo " - hauv-collection-test"
    
#     # python bindings 
#     export PYTHONPATH="$HOME/Workspace/hauv-collection-test/build/lib:$PYTHONPATH"
#     # add individual jars to classpath
# #   # visualization: lcm/python 
# #   export PYTHONPATH="$HOME/Workspace/mrg/pyslam-pod/externals/visualization-pod/lcmtypes/python:$PYTHONPATH"
# #   # pyslam
# #   export PYTHONPATH="$HOME/Workspace/mrg/pyslam-pod/python:$PYTHONPATH"
# fi

# lcmtypes - ogmapper
# if [ -d "$HOME/Workspace/hauv-slam/ogmapper/lcmtypes/python" ]; then
#     echo "- hauv-slam/ogmapper"
#     export PYTHONPATH="$HOME/Workspace/hauv-slam/ogmapper/lcmtypes/python:$PYTHONPATH"
#     export CLASSPATH="$HOME/Workspace/hauv-slam/ogmapper/pod-build/lcmtypes_ogmapper.jar:$CLASSPATH"
# fi

# lcm-types - visualization
# if [ -d "$HOME/Workspace/hauv-slam/visualization-pod/lcmtypes/python" ]; then
#     echo "- hauv-slam/visualization-pod"
#     export PYTHONPATH="$HOME/Workspace/hauv-slam/visualization-pod/lcmtypes/python:$PYTHONPATH"
#     export CLASSPATH="$HOME/Workspace/hauv-slam/visualization-pod/pod-build/lcmtypes_visualization.jar:$CLASSPATH"
# fi

# lcmtypes - 3dfls
# if [ -d "$HOME/Workspace/3dfls/3dfls/lcmtypes/python" ]; then
#     echo "- 3dfls"
#     # export PYTHONPATH="$HOME/Workspace/3dfls/3dfls/lcmtypes/python:$PYTHONPATH"
#     export CLASSPATH="$HOME/Workspace/3dfls/3dfls/pod-build/lcmtypes_3dfls.jar:$CLASSPATH"
# fi

# lcmtypes - viewer
# if [ -d "$HOME/Workspace/marine/pods/visualization/pod-build" ]; then
#     echo "- viewer"
#     export CLASSPATH="$HOME/Workspace/marine/pods/visualization/pod-build/lcmtypes_visualization.jar:$CLASSPATH"
# fi

# lcmtypes - hauv
# if [ -d "$HOME/Workspace/project-hauv/hauvlcm/pod-build" ]; then
#     echo "- hauvlcm"
#     export CLASSPATH="$HOME/Workspace/project-hauv/hauvlcm/pod-build/lcmtypes_hauvlcm.jar:$CLASSPATH"
# fi

# mute LCM by default
export LCM_DEFAULT_URL="udpm://239.255.76.67:7667?ttl=0"
