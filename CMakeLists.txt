cmake_minimum_required (VERSION 3.0)
project (myproject)
# Path cuda = /usr/local/cuda-12.3/targets/x86_64-linux/include/cuda_runtime_api.h
include_directories ("${PROJECT_SOURCE_DIR} /usr/local/cuda-12.3/targets/x86_64-linux/include/cuda_runtime_api.h")
include_directories ("${PROJECT_SOURCE_DIR}/third_party/eigen")
target_include_directories(demo_classic PRIVATE /usr/local/cuda-12.3/targets/x86_64-linux/include/cuda_runtime_api.h)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)
# 添加 math 子目录
add_subdirectory(src)
# 指定生成目标 
add_executable(demo_classic ${DIR_SRCS})
# 添加链接库
target_link_libraries(demo_classic MiniDNNLib)
target_link_libraries(demo_classic cuda)

