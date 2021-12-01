# Install script for directory: /home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4/samples/cpp" TYPE FILE FILES
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/3calibration.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/application_trace.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/bgfg_segm.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/calibration.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/camshiftdemo.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/cloning_demo.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/cloning_gui.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/connected_components.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/contours2.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/convexhull.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/cout_mat.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/create_mask.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/dbt_face_detection.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/delaunay2.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/demhist.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/detect_blob.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/detect_mser.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/dft.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/digits.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/dis_opticalflow.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/distrans.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/drawing.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/edge.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/ela.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/em.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/facedetect.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/facial_features.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/falsecolor.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/fback.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/ffilldemo.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/filestorage.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/fitellipse.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/grabcut.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/image_alignment.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/imagelist_creator.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/imagelist_reader.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/inpaint.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/intersectExample.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/kalman.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/kmeans.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/laplace.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/letter_recog.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/lkdemo.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/logistic_regression.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/mask_tmpl.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/matchmethod_orb_akaze_brisk.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/minarea.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/morphology2.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/neural_network.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/npr_demo.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/opencv_version.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/pca.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/peopledetect.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/phase_corr.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/points_classifier.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/polar_transforms.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/qrcode.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/segment_objects.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/select3dobj.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/simd_basic.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/smiledetect.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/squares.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/stereo_calib.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/stereo_match.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/stitching.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/stitching_detailed.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/train_HOG.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/train_svmsgd.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/travelsalesman.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/tree_engine.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_basic.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_camera.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_gphoto2_autofocus.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_gstreamer_pipeline.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_image_sequence.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_intelperc.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_openni.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videocapture_starter.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/videowriter_basic.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/warpPerspective_demo.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/watershed.cpp"
    "/home/piai/dr-prj/Drone+TodayGAN/opencv/opencv-4.2.0/samples/cpp/CMakeLists.txt"
    )
endif()

