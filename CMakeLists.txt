cmake_minimum_required(VERSION 3.19.2)
project(CudaTest LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# LIBIGL PACKAGE
option(LIBIGL_WITH_OPENGL              "Use OpenGL"         ON)
option(LIBIGL_WITH_OPENGL_GLFW         "Use GLFW"           ON)
option(LIBIGL_WITH_OPENGL_GLFW_IMGUI   "Use ImGui"          ON)
find_package(LIBIGL REQUIRED QUIET)

# BOOST PACKAGE
find_package(Boost 1.75.0 REQUIRED COMPONENTS program_options filesystem serialization unit_test_framework)

# CUDA PACKAGE
find_package(CUDAToolkit)
add_compile_definitions(CUDA_CAPABLE=${CUDAToolkit_FOUND})
if (CUDAToolkit_FOUND)
  enable_language(CUDA)
endif()

# OPENMP PACKAGE
find_package(OpenMP)

# Add your project files
file(GLOB_RECURSE SRCFILES src/*.cpp src/*.hpp)
if (CUDAToolkit_FOUND)
  file(GLOB_RECURSE CU_SRCFILES src/*.cu)
  add_executable(${PROJECT_NAME} ${CU_SRCFILES} ${SRCFILES})
else()
  add_executable(${PROJECT_NAME} ${SRCFILES})
endif()

# Include
target_include_directories(${PROJECT_NAME} PRIVATE tools/include/)

# Linker
target_link_libraries(${PROJECT_NAME} igl::core igl::opengl igl::opengl_glfw igl::opengl_glfw_imgui ${Boost_LIBRARIES} ${Boost_PROGRAM_OPTIONS_LIBRARY} ${Boost_SERIALIZATION_LIBRARY} Boost::program_options Boost::filesystem Boost::serialization Boost::unit_test_framework)

# Linker CUDA
if (CUDAToolkit_FOUND)
  target_link_libraries(${PROJECT_NAME} CUDA::cudart CUDA::cusparse CUDA::cusolver)
endif()

# Linker OpenMP
if (OpenMP_FOUND)
  target_link_libraries(${PROJECT_NAME} OpenMP::OpenMP_CXX)
endif()
