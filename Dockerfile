FROM ros:noetic-ros-base

RUN apt-get update &&\
  apt-get install -y ros-$ROS_DISTRO-rosserial-arduino ros-$ROS_DISTRO-rosserial git &&\
  apt-get -y clean &&\
  apt-get -y purge &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

HEALTHCHECK CMD /ros_entrypoint.sh rostopic list || exit 1

COPY ./ros.launch /
CMD ["roslaunch", "--wait", "ros.launch"]
WORKDIR /
