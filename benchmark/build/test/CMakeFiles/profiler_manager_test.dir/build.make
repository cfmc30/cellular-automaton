# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake

# The command to remove a file.
RM = /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/110550069/final/benchmark

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/110550069/final/benchmark/build

# Include any dependencies generated for this target.
include test/CMakeFiles/profiler_manager_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/profiler_manager_test.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/profiler_manager_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/profiler_manager_test.dir/flags.make

test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o: test/CMakeFiles/profiler_manager_test.dir/flags.make
test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o: /home/110550069/final/benchmark/test/profiler_manager_test.cc
test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o: test/CMakeFiles/profiler_manager_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/110550069/final/benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o"
	cd /home/110550069/final/benchmark/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o -MF CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o.d -o CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o -c /home/110550069/final/benchmark/test/profiler_manager_test.cc

test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.i"
	cd /home/110550069/final/benchmark/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/110550069/final/benchmark/test/profiler_manager_test.cc > CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.i

test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.s"
	cd /home/110550069/final/benchmark/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/110550069/final/benchmark/test/profiler_manager_test.cc -o CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.s

# Object files for target profiler_manager_test
profiler_manager_test_OBJECTS = \
"CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o"

# External object files for target profiler_manager_test
profiler_manager_test_EXTERNAL_OBJECTS =

test/profiler_manager_test: test/CMakeFiles/profiler_manager_test.dir/profiler_manager_test.cc.o
test/profiler_manager_test: test/CMakeFiles/profiler_manager_test.dir/build.make
test/profiler_manager_test: test/liboutput_test_helper.a
test/profiler_manager_test: src/libbenchmark_main.a
test/profiler_manager_test: src/libbenchmark.a
test/profiler_manager_test: test/CMakeFiles/profiler_manager_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/110550069/final/benchmark/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable profiler_manager_test"
	cd /home/110550069/final/benchmark/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/profiler_manager_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/profiler_manager_test.dir/build: test/profiler_manager_test
.PHONY : test/CMakeFiles/profiler_manager_test.dir/build

test/CMakeFiles/profiler_manager_test.dir/clean:
	cd /home/110550069/final/benchmark/build/test && $(CMAKE_COMMAND) -P CMakeFiles/profiler_manager_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/profiler_manager_test.dir/clean

test/CMakeFiles/profiler_manager_test.dir/depend:
	cd /home/110550069/final/benchmark/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/110550069/final/benchmark /home/110550069/final/benchmark/test /home/110550069/final/benchmark/build /home/110550069/final/benchmark/build/test /home/110550069/final/benchmark/build/test/CMakeFiles/profiler_manager_test.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/profiler_manager_test.dir/depend

