# Reckless Ted's Fundland Interfaces (rtf_interfaces)

- ImageIR (mlx90640)
    - uint16 image width and height
    - float32[] data
- Top
    - float32[] cpu: [core0, core1, ...]
    - float32[] memory: [used, max]
    - float32[] disk: [used, max]
    - string hostname
    - string ipv4

## To Build

```
git clone https://github.com/RecklessTedsFunland/rtf_interfaces.git
colcon build --symlink-install --packages-select rtf_interfaces
source install/setup.bash
```

Double check it worked:

```
kevin@dalek workspace % ros2 interface show rtf_interfaces/msg/ImageIR
std_msgs/Header header  # Header timestamp should be acquisition time of image
                        # Header frame_id should be optical frame of camera
                        # origin of frame should be optical center of camera
                        # +x should point to the right in the image
                        # +y should point down in the image
                        # +z should point into to plane of the image
                        # If the frame_id here and the frame_id of the CameraInfo
                        # message associated with the image conflict
                        # the behavior is undefined

uint16 height # rows
uint16 width  # columns

float32[] data # actual matrix data, size is (height * width)

```
