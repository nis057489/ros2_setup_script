# ROS 2 install script (Humble/Jazzy)

This repo contains a simple installer script that sets up the ROS 2 apt repo and installs either ROS 2 Humble or ROS 2 Jazzy.

## Local usage

```bash
bash install_ros2.sh humble
# or
bash install_ros2.sh jazzy
```

## Curl + run

### Humble

```bash
curl -fsSL https://raw.githubusercontent.com/nis057489/ros2_setup_script/refs/heads/main/install_ros2.sh | bash -s -- humble
```

### Jazzy

```bash
curl -fsSL https://raw.githubusercontent.com/nis057489/ros2_setup_script/refs/heads/main/install_ros2.sh | bash -s -- jazzy
```
