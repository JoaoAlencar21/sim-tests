#!/bin/bash
# Specifies that the script should be executed using the Bash shell.

    # $USE_GPUS \                       -> Runs the Docker container with GPU support if available.
    # --user ros_ws \                   -> Sets the user inside the container to 'ros_ws'.
    # -e QT_X11_NO_MITSHM=1 \           -> Sets an environment variable to disable MIT-SHM to help with X11 forwarding.
    # --network=host \                  -> Uses the host's network stack inside the container.
    # --ipc=host \                      -> Uses the host's IPC namespace, allowing the container to communicate with X server.
    # --privileged \                    -> Grants extended privileges to this container.
    # --oom-kill-disable                -> Prevents the container from being killed if it runs out of memory.
    # --device /dev/video0              -> Gives the container access to the video device /dev/video0.
    # -v /dev/video0:/dev/video0        -> Mounts the host's video0 device inside the container.
    # -v /dev/dri:/dev/dri \            -> Mounts the host's Direct Rendering Manager (DRM) device to support GPU rendering.
    # -v $PWD/ros_ws:/home/ROS/ros_ws \ -> Mounts the current directory's ROS workspace into the container.
    # -e DISPLAY=$DISPLAY \             -> Passes the host's display environment variable to the container.
    # ros_ws:noetic                     -> Specifies the Docker image to use.
    # -v /tmp/.X11-unix:/tmp/.X11-unix  -> Deixa o docker acessar aplicativos de GUI.
xhost +local:docker

docker run -it  --rm \
    -e QT_X11_NO_MITSHM=1 \
    --network=host \
    --ipc=host \
    --privileged \
    --oom-kill-disable \
    --device /dev/video0 \
    -v /dev/video0:/dev/video0 \
    -v /dev/dri:/dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /$PWD/catkin_ws:/root/catkin_ws \
    -e DISPLAY=$DISPLAY \
    simtests:noetic