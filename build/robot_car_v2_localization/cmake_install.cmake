# Install script for directory: /home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/shiva/Documents/ros2_projects/robot_car_V2/install/robot_car_v2_localization")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/environment" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/pythonpath.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/environment" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/pythonpath.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.10/site-packages/robot_car_v2_localization-0.0.0-py3.10.egg-info" TYPE DIRECTORY FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_python/robot_car_v2_localization/robot_car_v2_localization.egg-info/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3.10/site-packages/robot_car_v2_localization" TYPE DIRECTORY FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/robot_car_v2_localization/" REGEX "/[^/]*\\.pyc$" EXCLUDE REGEX "/\\_\\_pycache\\_\\_$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(
        COMMAND
        "/home/shiva/.pyenv/shims/python3" "-m" "compileall"
        "/home/shiva/Documents/ros2_projects/robot_car_V2/install/robot_car_v2_localization/lib/python3.10/site-packages/robot_car_v2_localization"
      )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/include")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE DIRECTORY FILES
    "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/launch"
    "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/config"
    "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/rviz"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_car_v2_localization" TYPE PROGRAM FILES
    "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/robot_car_v2_localization/kalman_filter.py"
    "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/robot_car_v2_localization/imu_republisher.py"
    "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/robot_car_v2_localization/odometry_motion_model.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/robot_car_v2_localization")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/robot_car_v2_localization")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/environment" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/environment" TYPE FILE FILES "/opt/ros/humble/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/environment" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/path.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_environment_hooks/package.dsv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_index/share/ament_index/resource_index/packages/robot_car_v2_localization")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization/cmake" TYPE FILE FILES
    "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_core/robot_car_v2_localizationConfig.cmake"
    "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/ament_cmake_core/robot_car_v2_localizationConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_car_v2_localization" TYPE FILE FILES "/home/shiva/Documents/ros2_projects/robot_car_V2/src/robot_car_v2_localization/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/shiva/Documents/ros2_projects/robot_car_V2/build/robot_car_v2_localization/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
