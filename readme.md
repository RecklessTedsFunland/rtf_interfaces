# Reckless Ted's Fundland Interfaces (`rtf_interfaces`)

- `ImageIR` (mlx90640)
    - uint16 image width and height
    - float32[] data
- Performance
    - `Top`
        - float32[] cpu: [core0, core1, ...]
        - float32[] memory: [used, max]
        - float32[] disk: [used, max]
        - string hostname
        - string ipv4
    - `Memory`
    - `Disk`
    - `CpuMemory`
- GPS
    - `GPGGA`
    - `GPGSA`
    - `GPGST`
    - `GPRMC`
    - `NemaSentence`
- PyCamera
    - `CaptureImage`:
        - request: None
        - response: bool result, string message

## Build

```bash
git clone https://github.com/RecklessTedsFunland/rtf_interfaces.git
colcon build --packages-select rtf_interfaces
. install/setup.bash
```

Double check it worked:

```bash
>>> ros2 interface show rtf_interfaces/msg/ImageIR
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

# Crap

While best practice is to declare interfaces in dedicated interface packages, sometimes it can be convenient to declare, create and use an interface all in one package.

Recall that interfaces can currently **only be defined in CMake packages**. It is possible, however, to have Python libraries and nodes in CMake packages (using `ament_cmake_python`), so you could define interfaces and Python nodes together in one package. We’ll use a CMake package and C++ nodes here for the sake of simplicity.

[ref](https://docs.ros.org/en/jazzy/Tutorials/Beginner-Client-Libraries/Single-Package-Define-And-Use-Interface.html)

# MIT License

**Copyright (c) 2020 Reckless Ted's Funland**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.