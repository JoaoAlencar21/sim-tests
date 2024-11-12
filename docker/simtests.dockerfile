### Dockerfile para testes do ambiente de simulação. ###
## Autor - João Assuéro Rêgo de Alencar ##ros-${ROS_DISTRO}-cartographer-* \

FROM osrf/ros:noetic-desktop-full
ENV TZ=America/Sao_Paulo
ARG DEBIAN_FRONTEND=noninteractive

# Installing dependencies
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
    git gedit ros-noetic-rviz\
    ros-${ROS_DISTRO}-gazebo-* \
    ros-${ROS_DISTRO}-navigation \
    ros-${ROS_DISTRO}-joint-state-* \
    ros-${ROS_DISTRO}-visualization-msgs \
    ros-${ROS_DISTRO}-multirobot-map-merge \
    ros-${ROS_DISTRO}-explore-lite \
    ros-${ROS_DISTRO}-teleop-twist-keyboard \
    ros-${ROS_DISTRO}-xacro

# Sourcing ROS and building the environment
RUN mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws/src && \
    git clone https://github.com/adipandas/indoor_bot.git && \
    /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash && cd ~/catkin_ws && catkin_make"