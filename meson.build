project('ORB_SLAM2', 'cpp', default_options : ['cpp_std=c++11', 'optimization=3'])

cpp = meson.get_compiler('cpp')
extra_args = cpp.get_supported_arguments(['-march=native'])

threadLinkerArgs = ['-pthread']
#filesytemLinkerArgs = ['-lstdc++fs']
#openmpLinkerArgs = ['-fopenmp']

cmake = import('cmake')
g2o_proj = cmake.subproject('g2o')
g2o_dep = g2o_proj.dependency('g2o')
DBoW2_proj = cmake.subproject('DBoW2')
DBoW2_dep = DBoW2_proj.dependency('DBoW2')
#Pangolin_proj = cmake.subproject('Pangolin')
Pangolin_dep = dependency('Pangolin')

opencvdep = dependency('opencv4')
eigendep = dependency('eigen3')

inc = include_directories('include')
inc_root = include_directories('./')

srcORB_SLAM2 = [
'src/System.cc',
'src/Tracking.cc',
'src/LocalMapping.cc',
'src/LoopClosing.cc',
'src/ORBextractor.cc',
'src/ORBmatcher.cc',
'src/FrameDrawer.cc',
'src/Converter.cc',
'src/MapPoint.cc',
'src/KeyFrame.cc',
'src/Map.cc',
'src/MapDrawer.cc',
'src/Optimizer.cc',
'src/PnPsolver.cc',
'src/Frame.cc',
'src/KeyFrameDatabase.cc',
'src/Sim3Solver.cc',
'src/Initializer.cc',
'src/Viewer.cc'
]

# Library generation
ORB_SLAM2_lib = library(
  'ORB_SLAM2',
  srcORB_SLAM2,
  include_directories : [inc, inc_root],
  dependencies : [ opencvdep, eigendep, g2o_dep, DBoW2_dep, Pangolin_dep ],
  link_args : [threadLinkerArgs]
)

ORB_SLAM2_dep = declare_dependency(
  dependencies: [opencvdep, eigendep, g2o_dep, DBoW2_dep, Pangolin_dep],
  include_directories : inc,
  link_with : ORB_SLAM2_lib
  )

srcStereoKitti = ['Examples/Stereo/stereo_kitti.cc']
executable('stereo_kitti', sources : srcStereoKitti, dependencies : [ ORB_SLAM2_dep ], link_args : [threadLinkerArgs])


