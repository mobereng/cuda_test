cmake_minimum_required(VERSION 3.19.2)
project(CudaTest LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# LIBIGL PACKAGE
option(LIBIGL_WITH_OPENGL              "Use OpenGL"         ON)
option(LIBIGL_WITH_OPENGL_GLFW         "Use GLFW"           ON)
option(LIBIGL_WITH_OPENGL_GLFW_IMGUI   "Use ImGui"          ON)
find_package(LIBIGL REQUIRED QUIET)

# CUDA PACKAGE
find_package(CUDAToolkit)
add_compile_definitions(CUDA_CAPABLE=${CUDAToolkit_FOUND})
if (CUDAToolkit_FOUND)
  enable_language(CUDA)
endif()

# Add your project files
file(GLOB_RECURSE SRCFILES src/*.cpp src/*.hpp)
if (CUDAToolkit_FOUND)
  file(GLOB_RECURSE CU_SRCFILES src/*.cu)
  add_executable(${PROJECT_NAME} ${CU_SRCFILES} ${SRCFILES})
else()
  add_executable(${PROJECT_NAME} ${SRCFILES})
endif()

# Linker
target_link_libraries(${PROJECT_NAME} igl::core igl::opengl igl::opengl_glfw igl::opengl_glfw_imgui)

# Linker CUDA
if (CUDAToolkit_FOUND)
  target_link_libraries(${PROJECT_NAME} CUDA::cudart CUDA::cusparse CUDA::cusolver)
endif()
