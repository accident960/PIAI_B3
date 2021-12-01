# Install script for directory: /home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so.4.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so.4.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib/libopencv_tracking.so.4.2.0"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib/libopencv_tracking.so.4.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so.4.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so.4.2"
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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so"
         RPATH "/usr/local/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib/libopencv_tracking.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so"
         OLD_RPATH "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/build/lib:"
         NEW_RPATH "/usr/local/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_tracking.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/feature.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/kalman_filters.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/onlineBoosting.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/onlineMIL.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/tldDataset.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/tracker.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/tracking.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2/tracking" TYPE FILE OPTIONAL FILES "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/include/opencv2/tracking/tracking_by_matching.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/tracking" TYPE FILE FILES
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/benchmark.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/csrt.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/goturnTracker.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/kcf.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/multiTracker_dataset.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/multitracker.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/multitracker.py"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/samples_utility.hpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tracker.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tracker.py"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tracker_dataset.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tracking_by_matching.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tutorial_customizing_cn_tracker.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tutorial_introduction_to_tracker.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv_contrib-4.2.0/modules/tracking/samples/tutorial_multitracker.cpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xsamplesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/tracking" TYPE DIRECTORY FILES "")
endif()

