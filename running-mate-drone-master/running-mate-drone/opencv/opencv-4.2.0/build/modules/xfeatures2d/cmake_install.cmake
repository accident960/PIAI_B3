# Install script for directory: /home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xlibsx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so.4.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so.4.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib/libopencv_xfeatures2d.so.4.2.0"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib/libopencv_xfeatures2d.so.4.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so.4.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so.4.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib:"
           NEW_RPATH "/usr/local/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so"
         RPATH "/usr/local/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib/libopencv_xfeatures2d.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so"
         OLD_RPATH "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib:"
         NEW_RPATH "/usr/local/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_xfeatures2d.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/include/opencv2/xfeatures2d.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/xfeatures2d" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/include/opencv2/xfeatures2d/cuda.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/xfeatures2d" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/include/opencv2/xfeatures2d/nonfree.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/xfeatures2d" TYPE FILE FILES
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/bagofwords_classification.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/export-boostdesc.py"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/gms_matcher.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/pct_signatures.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/pct_webcam.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/shape_transformation.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/surf_matcher.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/xfeatures2d/samples/video_homography.cpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/xfeatures2d" TYPE DIRECTORY FILES "")
endif()

