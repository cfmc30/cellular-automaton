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
CMAKE_SOURCE_DIR = /home/110550069/final/benchmark/build/third_party/googletest

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/110550069/final/benchmark/build/third_party/googletest

# Utility rule file for googletest.

# Include any custom commands dependencies for this target.
include CMakeFiles/googletest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/googletest.dir/progress.make

CMakeFiles/googletest: CMakeFiles/googletest-complete

CMakeFiles/googletest-complete: stamp/googletest-install
CMakeFiles/googletest-complete: stamp/googletest-mkdir
CMakeFiles/googletest-complete: stamp/googletest-download
CMakeFiles/googletest-complete: stamp/googletest-update
CMakeFiles/googletest-complete: stamp/googletest-patch
CMakeFiles/googletest-complete: stamp/googletest-configure
CMakeFiles/googletest-complete: stamp/googletest-build
CMakeFiles/googletest-complete: stamp/googletest-install
CMakeFiles/googletest-complete: stamp/googletest-test
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'googletest'"
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E make_directory /home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles/googletest-complete
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-done

stamp/googletest-update:
.PHONY : stamp/googletest-update

stamp/googletest-build: stamp/googletest-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'googletest'"
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E echo_append
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-build

stamp/googletest-configure: tmp/googletest-cfgcmd.txt
stamp/googletest-configure: stamp/googletest-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'googletest'"
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E echo_append
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-configure

stamp/googletest-download: stamp/googletest-gitinfo.txt
stamp/googletest-download: stamp/googletest-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'googletest'"
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/110550069/final/benchmark/build/third_party/googletest/tmp/googletest-gitclone.cmake
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-download

stamp/googletest-install: stamp/googletest-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'googletest'"
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E echo_append
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-install

stamp/googletest-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'googletest'"
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -Dcfgdir= -P /home/110550069/final/benchmark/build/third_party/googletest/tmp/googletest-mkdirs.cmake
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-mkdir

stamp/googletest-patch: stamp/googletest-patch-info.txt
stamp/googletest-patch: stamp/googletest-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'googletest'"
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E echo_append
	/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-patch

stamp/googletest-update:
.PHONY : stamp/googletest-update

stamp/googletest-test: stamp/googletest-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'googletest'"
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E echo_append
	cd /home/110550069/final/benchmark/build/third_party/googletest/build && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -E touch /home/110550069/final/benchmark/build/third_party/googletest/stamp/googletest-test

stamp/googletest-update: tmp/googletest-gitupdate.cmake
stamp/googletest-update: stamp/googletest-update-info.txt
stamp/googletest-update: stamp/googletest-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'googletest'"
	cd /home/110550069/final/benchmark/build/third_party/googletest/src && /opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/cmake-3.30.2-6j26urzdz24bjzaaynvuts3hi4hl5bkp/bin/cmake -Dcan_fetch=YES -DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE -P /home/110550069/final/benchmark/build/third_party/googletest/tmp/googletest-gitupdate.cmake

googletest: CMakeFiles/googletest
googletest: CMakeFiles/googletest-complete
googletest: stamp/googletest-build
googletest: stamp/googletest-configure
googletest: stamp/googletest-download
googletest: stamp/googletest-install
googletest: stamp/googletest-mkdir
googletest: stamp/googletest-patch
googletest: stamp/googletest-test
googletest: stamp/googletest-update
googletest: CMakeFiles/googletest.dir/build.make
.PHONY : googletest

# Rule to build all files generated by this target.
CMakeFiles/googletest.dir/build: googletest
.PHONY : CMakeFiles/googletest.dir/build

CMakeFiles/googletest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/googletest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/googletest.dir/clean

CMakeFiles/googletest.dir/depend:
	cd /home/110550069/final/benchmark/build/third_party/googletest && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/110550069/final/benchmark/build/third_party/googletest /home/110550069/final/benchmark/build/third_party/googletest /home/110550069/final/benchmark/build/third_party/googletest /home/110550069/final/benchmark/build/third_party/googletest /home/110550069/final/benchmark/build/third_party/googletest/CMakeFiles/googletest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/googletest.dir/depend

