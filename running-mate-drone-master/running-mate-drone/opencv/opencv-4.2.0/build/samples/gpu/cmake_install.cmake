# Install script for directory: /home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/gpu" TYPE FILE FILES
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/alpha_comp.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/bgfg_segm.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/cascadeclassifier.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/farneback_optical_flow.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/generalized_hough.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/hog.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/houghlines.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/morphology.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/multi.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/pyrlk_optical_flow.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/stereo_match.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/stereo_multi.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/super_resolution.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/surf_keypoint_matcher.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/video_reader.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/video_writer.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/gpu/CMakeLists.txt"
    )
endif()

