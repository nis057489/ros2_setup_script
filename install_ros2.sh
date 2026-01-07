#!/bin/bash

set -euo pipefail

usage() {
	cat <<'EOF'
Usage:
  ./install_ros2.sh <humble|jazzy>

Examples:
  ./install_ros2.sh humble
  ./install_ros2.sh jazzy
EOF
}

if [[ ${1-} == "" || ${1-} == "-h" || ${1-} == "--help" ]]; then
	usage
	exit 1
fi

ROS_DISTRO="${1,,}"
case "$ROS_DISTRO" in
	humble|jazzy)
		;;
	*)
		echo "Error: unsupported ROS distro '$ROS_DISTRO' (expected: humble|jazzy)" >&2
		usage
		exit 2
		;;
esac

locale  # check for UTF-8

sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt install -y software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt upgrade -y

sudo apt install -y "ros-${ROS_DISTRO}-desktop" ros-dev-tools
