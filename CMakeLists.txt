cmake_minimum_required(VERSION 3.21)
project(rtf_interfaces)

# Default to C17
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 17)
endif()

# Default to C++20
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 20)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msgs/ImageIR.msg"
  "msgs/Top.msg"
  "msgs/Disk.msg"
  msgs/Memory.msg
  msgs/CpuMemory.msg
  "msgs/NemaSentence.msg"
  "msgs/Gpgga.msg"
  "msgs/Gpgsa.msg"
  "msgs/Gpgst.msg"
#    "msgs/Gpgsv.msg"
#    "msgs/GpgsvSatellite.msg"
  "msgs/Gprmc.msg"
#    "msgs/Gpvtg.msg"
#    "msgs/Gpzda.msg"
  DEPENDENCIES std_msgs
#   DEPENDENCIES std_msgs
  # DEPENDENCIES builtin_interfaces std_msgs
)


if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
