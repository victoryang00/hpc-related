# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/quest/uastar

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/quest/uastar/build

# Include any dependencies generated for this target.
include CMakeFiles/demo-sort.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/demo-sort.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/demo-sort.dir/flags.make

CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o: CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o.depend
CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o: CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o.cmake
CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o: ../utils/modern-sort.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/quest/uastar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o"
	cd /home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils && /usr/bin/cmake -E make_directory /home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils/.
	cd /home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils/./demo-sort_generated_modern-sort.cu.o -D generated_cubin_file:STRING=/home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils/./demo-sort_generated_modern-sort.cu.o.cubin.txt -P /home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o.cmake

CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o: CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o.depend
CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o: CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o.cmake
CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o: ../libs/moderngpu/src/mgpucontext.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/quest/uastar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building NVCC (Device) object CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o"
	cd /home/quest/uastar/build/CMakeFiles/uastar.dir/libs/moderngpu/src && /usr/bin/cmake -E make_directory /home/quest/uastar/build/CMakeFiles/uastar.dir/libs/moderngpu/src/.
	cd /home/quest/uastar/build/CMakeFiles/uastar.dir/libs/moderngpu/src && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/home/quest/uastar/build/CMakeFiles/uastar.dir/libs/moderngpu/src/./uastar_generated_mgpucontext.cu.o -D generated_cubin_file:STRING=/home/quest/uastar/build/CMakeFiles/uastar.dir/libs/moderngpu/src/./uastar_generated_mgpucontext.cu.o.cubin.txt -P /home/quest/uastar/build/CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o.cmake

CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o: CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o.depend
CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o: CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o.cmake
CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o: ../libs/moderngpu/src/mgpucontext.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/quest/uastar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building NVCC (Device) object CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o"
	cd /home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src && /usr/bin/cmake -E make_directory /home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src/.
	cd /home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING= -D generated_file:STRING=/home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src/./demo-sort_generated_mgpucontext.cu.o -D generated_cubin_file:STRING=/home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src/./demo-sort_generated_mgpucontext.cu.o.cubin.txt -P /home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o.cmake

CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.o: CMakeFiles/demo-sort.dir/flags.make
CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.o: ../libs/moderngpu/src/mgpuutil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quest/uastar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.o"
	/opt/spack/opt/spack/linux-centos8-broadwell/gcc-9.2.0/gcc-6.5.0-vgnjfb4guymlhgjq5ckevgz7qpimvci7/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.o -c /home/quest/uastar/libs/moderngpu/src/mgpuutil.cpp

CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.i"
	/opt/spack/opt/spack/linux-centos8-broadwell/gcc-9.2.0/gcc-6.5.0-vgnjfb4guymlhgjq5ckevgz7qpimvci7/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quest/uastar/libs/moderngpu/src/mgpuutil.cpp > CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.i

CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.s"
	/opt/spack/opt/spack/linux-centos8-broadwell/gcc-9.2.0/gcc-6.5.0-vgnjfb4guymlhgjq5ckevgz7qpimvci7/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quest/uastar/libs/moderngpu/src/mgpuutil.cpp -o CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.s

# Object files for target demo-sort
demo__sort_OBJECTS = \
"CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.o"

# External object files for target demo-sort
demo__sort_EXTERNAL_OBJECTS = \
"/home/quest/uastar/build/CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o" \
"/home/quest/uastar/build/CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o"

demo-sort: CMakeFiles/demo-sort.dir/libs/moderngpu/src/mgpuutil.cpp.o
demo-sort: CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o
demo-sort: CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o
demo-sort: CMakeFiles/demo-sort.dir/build.make
demo-sort: /usr/local/cuda/lib64/libcudart_static.a
demo-sort: /usr/lib64/librt.so
demo-sort: CMakeFiles/demo-sort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/quest/uastar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable demo-sort"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/demo-sort.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/demo-sort.dir/build: demo-sort

.PHONY : CMakeFiles/demo-sort.dir/build

CMakeFiles/demo-sort.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/demo-sort.dir/cmake_clean.cmake
.PHONY : CMakeFiles/demo-sort.dir/clean

CMakeFiles/demo-sort.dir/depend: CMakeFiles/demo-sort.dir/utils/demo-sort_generated_modern-sort.cu.o
CMakeFiles/demo-sort.dir/depend: CMakeFiles/uastar.dir/libs/moderngpu/src/uastar_generated_mgpucontext.cu.o
CMakeFiles/demo-sort.dir/depend: CMakeFiles/demo-sort.dir/libs/moderngpu/src/demo-sort_generated_mgpucontext.cu.o
	cd /home/quest/uastar/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/quest/uastar /home/quest/uastar /home/quest/uastar/build /home/quest/uastar/build /home/quest/uastar/build/CMakeFiles/demo-sort.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/demo-sort.dir/depend

